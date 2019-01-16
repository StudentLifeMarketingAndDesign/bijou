<?php

use SilverStripe\Assets\Image;
use SilverStripe\Blog\Model\BlogPost;
use SilverStripe\Forms\DateField;
use SilverStripe\Forms\TextareaField;
use EdgarIndustries\YouTubeField\YouTubeField;

class SeriesPage extends Page {

    private static $db = array(

    );

    private static $has_one = array(

    );

    private static $belongs_many_many = array (
        'ShowPages' => 'ShowPage'
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();


        return $fields;
    }

    //private static $allowed_children = array("");

}
