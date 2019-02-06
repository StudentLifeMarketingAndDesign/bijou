<?php
use EdgarIndustries\YouTubeField\YouTubeField;
use OP\AutocompleteSuggestField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Blog\Model\BlogPost;
use SilverStripe\Core\Environment;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\ArrayList;
use SilverStripe\ORM\DataObject;
use SilverStripe\TagField\TagField;
use UncleCheese\DisplayLogic\Forms\Wrapper;

class ShowPage extends BlogPost {

    private static $db = array(

        'TicketsLink' => 'Varchar(255)',
        'FacebookEventLink' => 'Varchar(255)',
        'FilmSceneLink' => 'Varchar(255)',

        'UseTmdbForLookup' => 'Boolean',

        'TmdbFilmID' => 'Int',
        'TmdbFilmTitle' => 'Text',
        'TmdbFilmRuntime' => 'Varchar(10)',
        'TmdbFilmYear' => 'Varchar(10)',
        'TmdbTrailerVideoID' => 'Varchar(11)',
        'TmdbFilmRating' => 'Varchar(11)',
        'TmdbFilmSummary' => 'HTMLText',

        'TmdbPosterURL' => 'Varchar(255)',
        'TmdbBgURL' => 'Varchar(255)',

        'CustomFilmTitle' => 'Text',
        'CustomFilmRuntime' => 'Varchar(10)',
        'CustomFilmYear' => 'Varchar(10)',
        'CustomTrailerVideoID' => 'Varchar(11)',
        'CustomFilmRating' => 'Varchar(11)',
        'CustomFilmSummary' => 'HTMLText',

    );

    private static $defaults = array(
        'UseTmdbForLookup' => true,
    );

    private static $has_one = array(
        "Poster" => Image::class,
    );

    private static $has_many = array(
        'Dates' => 'ShowDate',
    );

    private static $owns = array(
        'Poster',
        'Dates',
    );

    private static $many_many = array(
        'SeriesPages' => 'SeriesPage',
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->removeByName('YoutubeBackgroundEmbed');
        $fields->removeByName('LayoutType');
        $fields->removeByName('BackgroundImage');
        $fields->removeByName('CustomSummary');
        $fields->removeByName('AudioClip');
        $fields->removeByName('FeaturedImage');
        $fields->removeByName('Blocks');
        $fields->removeByName('PostOptions');
        $fields->removeByName('MetaData');
        $fields->removeByName('SocialMediaSharing');
        $fields->removeByName('Widgets');

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
            ->setCanCreate(false); // new tag DataObjects can be created

        $fields->addFieldToTab('Root.Main', $seriesField, 'Content');
        $fields->addFieldToTab('Root.Main', $dateField, 'Content');

        if ($this->Title != 'New Show Page') {

        } else {
            $dateField->setDisabled(true);
            $fields->addFieldToTab('Root.Main', new LiteralField('DateWarning', '<p style="font-size: 16px;"><strong>Please give this page a title and safe as a draft before adding a date.</strong></p>'), 'Dates');
        }

        $fields->addFieldToTab('Root.Main', new TextField('TicketsLink', 'Buy tickets link'), 'Content');

        $fields->addFieldToTab('Root.Main', new TextField('FacebookEventLink', 'Facebook Event Link'), 'Content');
        $fields->addFieldToTab('Root.Main', new TextField('FilmSceneLink', 'FilmScene Link'), 'Content');

        $fields->addFieldToTab('Root.FilmInfo', new CheckboxField('UseTmdbForLookup', 'Use TMDB for film information'));

        // $fields->addFieldToTab('Root.FilmInfo', new , 'Content');

        $tmdbFieldWrapper = Wrapper::create(
            LiteralField::create('TmdbInfo', '<p style="font-size: 14px;"><strong>Use the field below to autofill in information and imagery (poster/background) from <img src="resources/themes/cfo-subtheme/dist/images/tmdb.svg" height="27" width="30" /> for a film. Save a draft of this page after choosing a film to see the info below.</strong></p>'),
            $suggestedFilm = AutocompleteSuggestField::create('FilmID', FilmSuggestController::create(), 'Film Lookup:', null, $this),
            ReadonlyField::create('TmdbBgURL', 'Background Image (from TMDB)'),

            ReadonlyField::create('TmdbPosterURL', 'Poster Image (from TMDB)'),
            YouTubeField::create('TmdbTrailerVideoID', 'YouTube Video'),
            ReadonlyField::create('TmdbFilmYear'),
            ReadonlyField::create('TmdbFilmSummary'),
            LiteralField::create('TmdbInfoTwo', '<p style="font-size: 14px;">Use the fields below to override any of the fields above.</p>'))

            ->displayIf('UseTmdbForLookup')->isChecked()->end();

        $suggestedFilm->setDescription('Enter text to search for a film, then <strong>save a draft of this page</strong> to see the information appear below.');

        $fields->addFieldsToTab('Root.FilmInfo', $tmdbFieldWrapper);

        // $fields->addFieldsToTab('Root.FilmInfo', $tmdbFieldWrapper);

        $overrideFields = new FieldList(
            UploadField::create('Poster', 'Custom Poster Image (vertical images work best)'),
            UploadField::create('FeaturedImage', 'Custom Background Image'),
            TextField::create('CustomFilmTitle'),
            TextField::create('CustomFilmRuntime'),
            TextField::create('CustomFilmYear'),
            YouTubeField::create('CustomTrailerVideoID'),
            HTMLEditorField::create('CustomFilmSummary')
        );
        $fields->addFieldsToTab('Root.FilmInfo', $overrideFields);

        // $fields->addFieldToTab('Root.FilmInfo', new );
        // $fields->addFieldToTab('Root.FilmInfo', new );
        // $fields->addFieldsToTab('Root.FilmInfo', new );
        // $fields->addFieldsToTab('Root.FilmInfo', new UploadField('FeaturedImage', 'Custom Background Image '));
        // $fields->addFieldToTab('Root.FilmInfo', new ));

        // $fields->addFieldToTab('Root.FilmInfo', new );
        // $fields->addFieldToTab('Root.FilmInfo', new );
        return $fields;
    }

    public function getFilmTitle() {

        $override = $this->CustomFilmTitle;
        if ($override != '') {
            return $override;
        }

        return $this->dbObject('TmdbFilmTitle');

    }

    public function getFilmRuntime(){

        $override = $this->CustomFilmRuntime;
        if ($override != '') {
            return $override;
        }

        return $this->dbObject('TmdbFilmRuntime');
    }

    public function getFilmYear() {

        $override = $this->CustomFilmYear;
        if ($override != '') {
            return $override;
        }

        return $this->dbObject('TmdbFilmYear');

    }

    public function getFilmSummary() {

        $override = $this->obj('CustomFilmSummary');
        if ($override != '') {
            return $override;
        }

        return $this->dbObject('TmdbFilmSummary');

    }

    public function getTrailerVideoID() {
        $override = $this->CustomTrailerVideoID;
        if ($override != '') {
            return $override;
        }

        return $this->dbObject('TmdbTrailerVideoID');
    }
    public function TimesFormatted() {

        //$this->getMovieInfo('Where the wild things are');
        // if(!$this->Times){
        //     return;
        // }

        $times = $this->Times;
        //$times = strip_tags($times);
        //Debug::show($times);
        $timesArray = explode("\n", $times);

        if (count($timesArray) == 0) {
            return;
        }

        $timesArrayList = new ArrayList();

        foreach ($timesArray as $time) {
            //$time = strip_tags($time);
            $time = trim(preg_replace('/\s+/', ' ', $time));

            $timestamp = strtotime($time);

            $timeFormatted = date('g:iA', $timestamp);

            $timeObj = new DataObject;
            $timeObj->TimeFormatted = $timeFormatted;
            $timesArrayList->push($timeObj);

            //print_r($timeObj->TimeFormatted);
        }

        return $timesArrayList;

    }

    public function onBeforeWrite() {
        // check on first write action, aka "database row creation" (ID-property is not set)
        // echo $this->FilmID;
        if (($this->FilmID != 0) && ($this->UseTmdbForLookup)) {
            $film = $this->getMovieInfo($this->FilmID);

            if ($film) {

                foreach ($film as $filmKey => $filmVal) {
                    $this->{$filmKey} = $filmVal;
                }
                // $this->FilmTitle = $film['FilmTitle'];
                // $this->FilmYear = $film['FilmYear'];
                // $this->FilmSummary = $film['FilmSummary'];
                // $this->TmdbBgURL = $film['TmdbBgURL'];
                // $this->TmdbPosterURL = $film['TmdbPosterURL'];
                // $this->TrailerVideoID = $film['TrailerVideoID'];

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
    public function onBeforeDelete() {

        parent::onBeforeDelete();

    }
    public function getMovieInfo($filmID) {

        $token = new \Tmdb\ApiToken(Environment::getEnv('TMDB_API_KEY'));

        $client = new \Tmdb\Client($token, [
            'cache' => [
                'path' => '/tmp/php-tmdb',
            ],
        ]);

        $infoArray = array();

        $query = new \Tmdb\Model\Search\SearchQuery\MovieSearchQuery();
        $query->page(1);

        $searchRepo = new \Tmdb\Repository\SearchRepository($client);
        $movieRepo = new \Tmdb\Repository\MovieRepository($client);
        $configRepository = new \Tmdb\Repository\ConfigurationRepository($client);

        $config = $configRepository->load();

        $configImages = $config->getImages();

        $firstFilm = $movieRepo->load($filmID);

        // $findArray = $find->toArray();

        // $firstFilm = reset($findArray);

        if (!$firstFilm) {
            return;
        }

        //****************************
        //Get id (for other api calls)
        //****************************

        $filmId = $firstFilm->getId();

        $infoArray['TmdbFilmID'] = $filmId;

        //***********
        //Get title
        //************

        $infoArray['TmdbFilmTitle'] = $firstFilm->getTitle();

        //***********
        //Get runtime
        //************
        $infoArray['TmdbFilmRuntime'] = $firstFilm->getRuntime();
        print_r($infoArray['TmdbFilmRuntime']);

        //****************
        //Get release year
        //****************

        $releaseDate = $firstFilm->getReleaseDate();
        $releaseYear = $releaseDate->format('Y');

        $infoArray['TmdbFilmYear'] = $releaseYear;

        //***********
        //Get summary
        //***********

        $infoArray['TmdbFilmSummary'] = $firstFilm->getOverview();

        //**********
        //Get Images
        //**********

        $imgBase = $configImages['secure_base_url'];

        $backdropSize = $configImages['backdrop_sizes'][2];
        $backdropBase = $imgBase . $backdropSize . $firstFilm->getBackdropPath();

        $posterSize = $configImages['poster_sizes'][4];
        $posterBase = $imgBase . $posterSize . $firstFilm->getPosterPath();

        $infoArray['TmdbBgURL'] = $backdropBase;
        $infoArray['TmdbPosterURL'] = $posterBase;
        // print_r($images);

        //**********
        //Get Videos
        //**********
        $videosArray = $movieRepo->getVideos($filmId)->toArray();
        $firstVideo = reset($videosArray);

        if ($firstVideo) {

            $infoArray['TmdbTrailerVideoID'] = $firstVideo->getKey();

        }

        return $infoArray;

    }

}
