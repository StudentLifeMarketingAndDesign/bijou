<?php

use SilverStripe\Assets\Image;
use SilverStripe\Blog\Model\BlogPost;
use SilverStripe\Forms\DateField;
use SilverStripe\Forms\TextareaField;
use EdgarIndustries\YouTubeField\YouTubeField;

class ShowPage extends BlogPost {

    private static $db = array(
        'ShowingDate' => 'Date',
        'ShowingTimes' => 'Text',
        'TrailerVideoID' => 'Varchar(11)',
    );

    private static $has_one = array(

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
        $fields->addFieldToTab('Root.Main', new DateField('ShowingDate', 'Show date for this instance'), 'Content');
        $fields->addFieldToTab('Root.Main', new TextareaField('ShowingTimes', 'Time(s) for this instance'), 'Content');
        $fields->addFieldToTab('Root.Main', new YouTubeField('TrailerVideoID', 'YouTube Video'), 'Content');
        return $fields;
    }

    //private static $allowed_children = array("");

}
