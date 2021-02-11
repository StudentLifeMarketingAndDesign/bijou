<?php
use EdgarIndustries\YouTubeField\YouTubeField;
use OP\AutocompleteSuggestField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Blog\Model\BlogPost;
use SilverStripe\Core\Environment;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\DateField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\ListboxField;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\ArrayList;
use SilverStripe\ORM\DataObject;
use UncleCheese\DisplayLogic\Forms\Wrapper;

class ShowPage extends BlogPost {

	private static $db = array(

		'TicketsLink' => 'Varchar(255)',
		'FacebookEventLink' => 'Varchar(255)',
		'FilmSceneLink' => 'Varchar(255)',

		'UseTmdbForLookup' => 'Boolean',

		'TmdbFilmID' => 'Int',
		'TmdbFilmTitle' => 'Text',
		'TmdbFilmYear' => 'Varchar(10)',
		'TmdbTrailerVideoID' => 'Varchar(11)',
		'TmdbFilmRating' => 'Varchar(11)',
		'TmdbFilmSummary' => 'HTMLText',

		'TmdbPosterURL' => 'Varchar(255)',
		'TmdbBgURL' => 'Varchar(255)',

		'CustomFilmTitle' => 'Text',
		'CustomFilmYear' => 'Varchar(10)',
		'CustomTrailerVideoID' => 'Varchar(11)',
		'CustomFilmRating' => 'Varchar(11)',
		'CustomFilmSummary' => 'HTMLText',

		'Ongoing' => 'Boolean',
		'OngoingStart' => 'Date',
		'OngoingExpiry' => 'Date',

	);

	private static $defaults = array(
		'UseTmdbForLookup' => true,
		'FilmSceneLink' => 'https://icfilmscene.org/',
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

		$seriesField = ListBoxField::create(
			'SeriesPages',
			'Series',
			SeriesPage::get()->map()
		);
		$fields->addFieldToTab('Root.Main', new LiteralField('InstructionsAdd', '<p class="message notice"><strong><a href="https://github.com/StudentLifeMarketingAndDesign/bijou/blob/main/docs/adding-a-show.md" target="_blank" rel="noopener">Instructions for adding shows and dates can be found here &rarr;</a></strong></p>'), 'Title');
		$fields->addFieldToTab('Root.Main', $seriesField, 'Content');

		$fields->addFieldToTab('Root.Main', new CheckboxField('Ongoing', 'Ongoing Stream'), 'Content');

		$ongoingFieldWrapper = Wrapper::create(
			DateField::create('OngoingStart', 'Ongoing stream starts on this date'),
			DateField::create('OngoingExpiry', 'Ongoing stream expires on this date')
		)->displayIf('Ongoing')->isChecked()->end();

		$fields->addFieldToTab('Root.Main', $ongoingFieldWrapper, 'Content');

		$fields->addFieldToTab('Root.Main', $dateField, 'Content');

		if ($this->Title != 'New Show Page') {

		} else {
			$dateField->setDisabled(true);
			$fields->addFieldToTab('Root.Main', new LiteralField('DateWarning', '<p style="font-size: 16px;"><strong>Please give this page a title and save as a draft before adding a date.</strong></p>'), 'Dates');
		}

		$fields->addFieldToTab('Root.Main', new TextField('TicketsLink', 'Buy tickets link'), 'Content');

		$fields->addFieldToTab('Root.Main', new TextField('FacebookEventLink', 'Facebook Event Link'), 'Content');
		$fields->addFieldToTab('Root.Main', new TextField('FilmSceneLink', 'FilmScene Link'), 'Content');

		$fields->addFieldToTab('Root.FilmInfo', new CheckboxField('UseTmdbForLookup', 'Use TMDB for film information'));

		$tmdbFieldWrapper = Wrapper::create(
			LiteralField::create('TmdbInfo', '<p style="font-size: 14px;"><strong>Use the field below to autofill in information and imagery (poster/background) from <img src="_resources/themes/cfo-subtheme/dist/images/tmdb.svg" height="27" width="30" /> for a film. Save a draft of this page after choosing a film to see the info below.</strong> This field only works in Firefox/Chrome.</p>'),
			$suggestedFilm = AutocompleteSuggestField::create('TmdbFilmID', $this, 'Film Lookup:', FilmSuggestController::create(), null, $this),
			ReadonlyField::create('TmdbBgURL', 'Background Image (from TMDB)'),

			ReadonlyField::create('TmdbPosterURL', 'Poster Image (from TMDB)'),
			YouTubeField::create('TmdbTrailerVideoID', 'YouTube Video'),
			ReadonlyField::create('TmdbFilmYear'),
			ReadonlyField::create('TmdbFilmSummary'),
			LiteralField::create('TmdbInfoTwo', '<p style="font-size: 14px;">Use the fields below to override any of the fields above.</p>'))

			->displayIf('UseTmdbForLookup')->isChecked()->end();

		$suggestedFilm->setDescription('Enter text to search for a film, then <strong>save a draft of this page</strong> to see the information appear below.');

		$fields->addFieldsToTab('Root.FilmInfo', $tmdbFieldWrapper);

		$overrideFields = new FieldList(
			UploadField::create('Poster', 'Custom Poster Image (vertical images work best)'),
			UploadField::create('FeaturedImage', 'Custom Background Image'),
			TextField::create('CustomFilmTitle'),
			TextField::create('CustomFilmYear'),
			YouTubeField::create('CustomTrailerVideoID'),
			HTMLEditorField::create('CustomFilmSummary')
		);
		$fields->addFieldsToTab('Root.FilmInfo', $overrideFields);

		return $fields;
	}
	public function NextPage() {
		$page = Page::get()->filter(array(
			'ParentID' => $this->owner->ParentID,
			'Sort:GreaterThan' => $this->owner->Sort,
		))->First();
		return $page;
	}

	public function PreviousPage() {
		$page = Page::get()->filter(array(
			'ParentID' => $this->owner->ParentID,
			'Sort:LessThan' => $this->owner->Sort,
		))->Last();
		return $page;
	}

	public function getBackgroundImageURL() {

		if ($this->FeaturedImageID) {

			return $this->FeaturedImage()->URL;
		} else {

			return $this->dbObject('TmdbBgURL');
		}

	}

	public function getFilmTitle() {

		$override = $this->CustomFilmTitle;
		if ($override != '') {
			return $override;
		}

		return $this->dbObject('TmdbFilmTitle');

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

		$times = $this->Times;

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

	public function NextUpcomingDate() {
		$now = date('Y-m-d');
		$date = $this->Dates()->filter(array(
			'Date:GreaterThanOrEqual' => $now,
		))->sort('Date')->First();

		return $date;
	}

	public function onBeforeWrite() {
		// check on first write action, aka "database row creation" (ID-property is not set)
		// echo $this->FilmID;

		if (($this->TmdbFilmID != 0) && ($this->UseTmdbForLookup == 1)) {

			$film = $this->getMovieInfo($this->TmdbFilmID);

			if ($film) {

				foreach ($film as $filmKey => $filmVal) {
					$this->{$filmKey} = $filmVal;
				}

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
