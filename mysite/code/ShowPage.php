<?php

use SilverStripe\Assets\Image;
use SilverStripe\Blog\Model\BlogPost;
use SilverStripe\Forms\DateField;
use SilverStripe\Forms\TextareaField;
use EdgarIndustries\YouTubeField\YouTubeField;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig;
use SilverStripe\Forms\GridField\GridFieldDataColumns;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\Forms\LabelField;
class ShowPage extends BlogPost {

    private static $db = array(
        'TrailerVideoID' => 'Varchar(11)',
        'TicketsLink' => 'Varchar(255)'
    );

    private static $has_one = array(

    );

    private static $has_many = array(
        'Dates' => 'ShowDate'
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



        $dateFieldConfig = GridFieldConfig_RelationEditor::create();
        $dateField = new GridField('Dates', 'Dates', $this->Dates());
        $dateField->setConfig($dateFieldConfig);


        if($this->ID){
          $fields->addFieldToTab('Root.Main', $dateField, 'Content');
        }else{
            $fields->addFieldToTab('Root.Main', new LabelField('Please save this show page as a draft before adding a date.'));
        }
        $fields->addFieldToTab('Root.Main', new TextField('TicketsLink', 'Buy tickets link'), 'Content');
        $fields->addFieldToTab('Root.Main', new YouTubeField('TrailerVideoID', 'YouTube Video'), 'Content');
        return $fields;
    }

    //private static $allowed_children = array("");

}
