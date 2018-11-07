<?php

use SilverStripe\Assets\Image;
use SilverStripe\Blog\Model\Blog;
use SilverStripe\Forms\DateField;
use EdgarIndustries\YouTubeField\YouTubeField;

class ShowHolderPage extends Blog {

    private static $db = array(

    );

    private static $has_one = array(

    );

    private static $allowed_children = array(
        'ShowPage'
    );

    private static $belongs_many_many = array (

    );


    //private static $allowed_children = array("");

}
