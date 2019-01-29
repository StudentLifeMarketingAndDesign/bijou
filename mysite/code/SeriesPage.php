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
use RyanPotter\SilverStripeColorField\Forms\ColorField;

class SeriesPage extends Page {

    private static $db = array(
        'AccentColor' => 'Varchar(7)',
    );

    private static $has_one = array(

    );

    private static $belongs_many_many = array (
        'ShowPages' => 'ShowPage',
        'ShowDates' => 'ShowDate'
    );

    //private static $allowed_children = array("");

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', ColorField::create('AccentColor'), 'Content');
        return $fields;
    }

    public function AccentRgb(){
        $hex = $this->AccentColor;
        $rgb = $this->hex2rgb($hex);
        // print_r($rgb);
        $rgbString = $rgb['red'].','.$rgb['green'].','.$rgb['blue'];

        return $rgbString;
    }

    public function NextUpcomingBackgroundURL(){
        $show = $this->UpcomingShows(1)->First();

        if($show){
            if($show->TmdbBgURL) return $show->TmdbBgURL;
            if($show->FeaturedImage()) return $show->FeaturedImage()->URL;
        }

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


    private function hex2rgb( $colour ) {
            if ( $colour[0] == '#' ) {
                    $colour = substr( $colour, 1 );
            }
            if ( strlen( $colour ) == 6 ) {
                    list( $r, $g, $b ) = array( $colour[0] . $colour[1], $colour[2] . $colour[3], $colour[4] . $colour[5] );
            } elseif ( strlen( $colour ) == 3 ) {
                    list( $r, $g, $b ) = array( $colour[0] . $colour[0], $colour[1] . $colour[1], $colour[2] . $colour[2] );
            } else {
                    return false;
            }
            $r = hexdec( $r );
            $g = hexdec( $g );
            $b = hexdec( $b );
            return array( 'red' => $r, 'green' => $g, 'blue' => $b );
    }


}
