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

class ShowPage extends BlogPost {

    private static $db = array(
        'TrailerVideoID' => 'Varchar(11)',
        'TicketsLink' => 'Varchar(255)',
        'FacebookEventLink' => 'Varchar(255)',
        'FilmSceneLink' => 'Varchar(255)',

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

    private static $belongs_many_many = array (

    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->removeByName('YoutubeBackgroundEmbed');
        $fields->removeByName('LayoutType');
        $fields->removeByName('BackgroundImage');
        $fields->removeByName('CustomSummary');
        $fields->removeByName('AudioClip');
        $fields->removeByName('FeaturedImage');


        $dateFieldConfig = GridFieldConfig_RelationEditor::create();
        $dateField = new GridField('Dates', 'Dates', $this->Dates());
        $dateField->setConfig($dateFieldConfig);


        if($this->ID !=0){
          $fields->addFieldToTab('Root.Main', $dateField, 'Content');
        }else{
            $fields->addFieldToTab('Root.Main', new LabelField('Please save this show page as a draft before adding a date.'));
        }
        $fields->addFieldToTab('Root.Main', new TextField('TicketsLink', 'Buy tickets link'), 'Content');
        $fields->addFieldToTab('Root.Main', new YouTubeField('TrailerVideoID', 'YouTube Video'), 'Content');
        $fields->addFieldToTab('Root.Main', new TextField('FacebookEventLink', 'Facebook Event Link'), 'Content');
        $fields->addFieldsToTab('Root.Main', new TextField('FilmSceneLink', 'FilmScene Link'), 'Content');
        $fields->addFieldsToTab('Root.Main', new UploadField('Poster', 'Poster Image'), 'Content');
        $fields->addFieldsToTab('Root.Main', new UploadField('FeaturedImage', 'Featured Image'), 'Content');
        return $fields;
    }

    public function TimesFormatted(){
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

    //private static $allowed_children = array("");

}
