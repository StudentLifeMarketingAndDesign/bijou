<?php

use SilverStripe\Blog\Model\Blog;
use SilverStripe\ORM\ArrayList;

class ShowHolderPage extends Blog {

    private static $db = array(

    );

    private static $has_one = array(

    );

    private static $allowed_children = array(
        'ShowPage',
    );

    private static $belongs_many_many = array(

    );
    /**
     * This sets the title for our gridfield.
     *
     * @return string
     */
    public function getLumberjackTitle() {
        return _t(__CLASS__ . '.LumberjackTitle', 'Shows');
    }
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
        // $fields->removeByName('Main');
        $fields->removeByName('Categorisation');

        return $fields;
    }
    public function UpcomingDates($count = 7) {
        $now = date('Y-m-d');
        $dates = ShowDate::get()->filter(array(
            'Date:GreaterThanOrEqual' => $now,
        ))->sort('Date')->limit($count);

        $combinedDates = array();
        $masterDates = new ArrayList();

        $datesArrayList = $this->to_array_list($dates);
        $datesUnique = $datesArrayList->removeDuplicates('Date');
        //print_r($datesArrayList);
        foreach ($datesArrayList as $dateUnique) {
            $masterDateShows = new ArrayList();
            //$masterDates->push($dateUnique);
            //$masterDate = $masterDates->find('Date', $dateUnique);
            $dateTransient = new ShowDateTransient();
            $dateTransient->Date = $dateUnique->Date;
            $dateTransient->ShowsTransient = new ArrayList();
            $masterDates->push($dateTransient);
        }

        //masterDates holds onto an array of dates that will contain all events on each date.
        foreach ($dates as $date) {
            $show = $date->ShowPage();

            if($show->isPublished()){


                $showWithTimes = new ShowPage();
                $showWithTimes->Title = $show->Title;
                $showWithTimes->Content = $show->Content;
                $showWithTimes->URLSegment = $show->URLSegment;
                $showWithTimes->Times = $date->Times;
                $showWithTimes->Poster = $show->Poster;
                $showWithTimes->TmdbPosterURL = $show->TmdbPosterURL;

                $masterDateToUse = $masterDates->find('Date', $date->Date);

                //print_r($masterDateToUse);
                $masterDateToUse->ShowsTransient->push($showWithTimes);


            }


        }

        //print_r($masterDates);
        return $masterDates;
    }

    public function UpcomingShows($count = 5) {
        $now = date('Y-m-d');
        $dates = ShowDate::get()->filter(array(
            'Date:GreaterThanOrEqual' => $now,
        ))->sort('Date')->limit($count);

        $shows = new ArrayList();

        foreach ($dates as $date) {
            $showPage = ShowPage::get()->filter(array('ID' => $date->ShowPageID))->First();

            if ($showPage) {
                $shows->push($showPage);
            }

        }

        return $shows;
    }

}
