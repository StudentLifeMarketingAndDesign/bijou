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

    public function UpcomingShows($count = 5){
        $now = date('Y-m-d');
        $dates = ShowDate::get()->filter(array(
            'Date:GreaterThanOrEqual' => $now
            ))->sort('Date')->limit($count);

        $shows = new ArrayList();

        foreach($dates as $date){
            $showPage = ShowPage::get()->filter(array('ID' => 472))->First();


            if($showPage){
                $shows->push($showPage);
            }

        }


        return $shows;
    }

    //private static $allowed_children = array("");

}
