<?php
use SilverStripe\Dev\Debug;
use SilverStripe\Assets\Image;
use SilverStripe\Blog\Model\BlogPost;
use SilverStripe\Forms\DateField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\TextField;
use EdgarIndustries\YouTubeField\YouTubeField;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig;
use SilverStripe\Forms\GridField\GridFieldDataColumns;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\Forms\LabelField;
use SilverStripe\ORM\ArrayList;
use SilverStripe\ORM\DataObject;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\TagField\TagField;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Core\Environment;
use OP\AutocompleteSuggestField;
use SilverStripe\CMS\Controllers\ModelAsController;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\View\Requirements;
class ShowPage extends BlogPost {

    private static $db = array(

        'TicketsLink' => 'Varchar(255)',
        'FacebookEventLink' => 'Varchar(255)',
        'FilmSceneLink' => 'Varchar(255)',

        'FilmID' => 'Int',
        'FilmTitle' => 'Text',
        'FilmYear' => 'Varchar(10)',
        'TrailerVideoID' => 'Varchar(11)',

        'FilmRating' => 'Varchar(11)',
        'FilmSummary' => 'HTMLText',
        'TmdbPosterURL' => 'Varchar(255)',
        'TmdbBgURL' => 'Varchar(255)'

    );

    private static $has_one = array(
        "Poster" => Image::class,
    );

    private static $has_many = array(
        'Dates' => 'ShowDate'
    );

    private static $owns = array(
        'Poster'
    );

    private static $many_many = array(
        'SeriesPages' => 'SeriesPage'
    );


    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->removeByName('YoutubeBackgroundEmbed');
        $fields->removeByName('LayoutType');
        $fields->removeByName('BackgroundImage');
        $fields->removeByName('CustomSummary');
        $fields->removeByName('AudioClip');
        $fields->removeByName('FeaturedImage');
        $suggestedFilm = AutocompleteSuggestField::create('FilmID', FilmSuggestController::create(), 'Film Title', null, $this);
        $suggestedFilm->setDescription('Enter text to search for a film');
        $fields->addFieldToTab('Root.Main', $suggestedFilm,'Content');
        $dateFieldConfig = GridFieldConfig_RelationEditor::create();
        $dateField = new GridField('Dates', 'Dates', $this->Dates());
        $dateField->setConfig($dateFieldConfig);


        $seriesField = TagField::create(
            'SeriesPages',
            'Series',
            SeriesPage::get(),
            $this->SeriesPages()
        )
            ->setShouldLazyLoad(true) // tags should be lazy loaded
            ->setCanCreate(false);     // new tag DataObjects can be created

        $fields->addFieldToTab('Root.Main', $seriesField, 'Content');

        if($this->ID !=0){
          $fields->addFieldToTab('Root.Main', $dateField, 'Content');
        }else{
            $fields->addFieldToTab('Root.Main', new LabelField('Please save this show page as a draft before adding a date.'));
        }

        $fields->addFieldToTab('Root.Main', new TextField('TicketsLink', 'Buy tickets link'), 'Content');

        $fields->addFieldToTab('Root.Main', new TextField('FacebookEventLink', 'Facebook Event Link'), 'Content');
        $fields->addFieldsToTab('Root.Main', new TextField('FilmSceneLink', 'FilmScene Link'), 'Content');




        $fields->addFieldToTab('Root.FilmInfo', new ReadonlyField('TmdbBgURL','Background Image (from TMDB)'));
        $fields->addFieldToTab('Root.FilmInfo', new ReadonlyField('TmdbPosterURL', 'Poster Image (from TMDB)'));
        $fields->addFieldsToTab('Root.FilmInfo', new UploadField('Poster', 'Override Poster Image'));
        $fields->addFieldsToTab('Root.FilmInfo', new UploadField('FeaturedImage', 'Override Background Image '));
        $fields->addFieldToTab('Root.FilmInfo', new YouTubeField('TrailerVideoID', 'YouTube Video'));

        $fields->addFieldToTab('Root.FilmInfo', new ReadonlyField('FilmYear'));
        $fields->addFieldToTab('Root.FilmInfo', new ReadonlyField('FilmSummary'));
        return $fields;
    }

    public function TimesFormatted(){
        //$this->getMovieInfo('Where the wild things are');
        if(!$this->Times){
            return;
        }

        $times = $this->Times;
        //$times = strip_tags($times);
        //Debug::show($times);
        $timesArray = explode("\n", $times);

        $timesArrayList = new ArrayList();

        foreach($timesArray as $time){
            //$time = strip_tags($time);
            $time = trim(preg_replace('/\s+/', ' ', $time));

            $timestamp = strtotime($time);



            $timeFormatted = date('g:iA', $timestamp);

            $timeObj = new DataObject;
            $timeObj->TimeFormatted =  $timeFormatted;
            $timesArrayList->push($timeObj);

            //print_r($timeObj->TimeFormatted);
        }

        return $timesArrayList;

    }



    public function onBeforeWrite()
    {
        // check on first write action, aka "database row creation" (ID-property is not set)
        if($this->FilmID != 0) {
            $film = $this->getMovieInfo($this->FilmID);

            if($film){

                 $this->FilmTitle = $film['FilmTitle'];
                 $this->FilmYear = $film['FilmYear'];
                 $this->FilmSummary = $film['FilmSummary'];
                 $this->TmdbBgURL = $film['TmdbBgURL'];
                 $this->TmdbPosterURL = $film['TmdbPosterURL'];
                 $this->TrailerVideoID = $film['TrailerVideoID'];

            }

        }



        // check on every write action
        // if(!$this->record['TeamID']) {
        //     user_error('Cannot save player without a valid team', E_USER_ERROR);
        //     exit();
        // }

        // CAUTION: You are required to call the parent-function, otherwise
        // SilverStripe will not execute the request.
        parent::onBeforeWrite();
    }

    public function getMovieInfo($filmID){

        $token  = new \Tmdb\ApiToken(Environment::getEnv('TMDB_API_KEY'));

        $client = new \Tmdb\Client($token, [
            'cache' => [
                'path' => '/tmp/php-tmdb'
            ]
        ]);

        $infoArray = array();

        $query = new \Tmdb\Model\Search\SearchQuery\MovieSearchQuery();
        $query->page(1);

        $searchRepo = new \Tmdb\Repository\SearchRepository($client);
        $movieRepo =  new \Tmdb\Repository\MovieRepository($client);
        $configRepository = new \Tmdb\Repository\ConfigurationRepository($client);


        $config = $configRepository->load();

        $configImages = $config->getImages();


        $firstFilm = $movieRepo->load($filmID);

        // $findArray = $find->toArray();

        // $firstFilm = reset($findArray);


        if(!$firstFilm){
            return;
        }


        //****************************
        //Get id (for other api calls)
        //****************************

        $filmId = $firstFilm->getId();

        $infoArray['ID'] = $filmId;


        //***********
        //Get title
        //************

        $infoArray['FilmTitle'] = $firstFilm->getTitle();

        //****************
        //Get release year
        //****************

        $releaseDate = $firstFilm->getReleaseDate();
        $releaseYear = $releaseDate->format('Y');

        $infoArray['FilmYear'] = $releaseYear;

        //***********
        //Get summary
        //***********

        $infoArray['FilmSummary'] = $firstFilm->getOverview();


        //**********
        //Get Images
        //**********

        $imgBase = $configImages['secure_base_url'];



        $backdropSize = $configImages['backdrop_sizes'][2];
        $backdropBase = $imgBase.$backdropSize.$firstFilm->getBackdropPath();

        $posterSize = $configImages['poster_sizes'][4];
        $posterBase = $imgBase.$posterSize.$firstFilm->getPosterPath();



        $infoArray['TmdbBgURL'] = $backdropBase;
        $infoArray['TmdbPosterURL'] = $posterBase;
        // print_r($images);

        //**********
        //Get Videos
        //**********
        $videosArray = $movieRepo->getVideos($filmId)->toArray();
        $firstVideo = reset($videosArray);

        $infoArray['TrailerVideoID'] = $firstVideo->getKey();

        //print_r($infoArray);
        return $infoArray;

    }

}
