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
class SeriesPage extends Page {

    private static $db = array(

    );

    private static $has_one = array(

    );

    private static $belongs_many_many = array (
        'ShowPages' => 'ShowPage',
        'ShowDates' => 'ShowDate'
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
            $showPage = $date->ShowPage();

            if($showPage){
                //TODO: Optimize this, we're looping through and filtering, ineffecient
                foreach($showPage->SeriesPages() as $seriesPage){

                    if($seriesPage->ID == $this->ID){
                        $shows->push($showPage);
                    }
                }

            }

        }

        return $shows;
    }

    //private static $allowed_children = array("");

}
