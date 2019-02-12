<?php

use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\DataExtension;

class HomePageExtension extends DataExtension {

    private static $db = array(

        'NumberOfUpcomingShowsToDisplay' => 'Int',

    );

    private static $owns = array(

    );

    public function updateCMSFields(FieldList $fields) {
        $fields->addFieldToTab('Root.Main', new TextField('NumberOfUpcomingShowsToDisplay'), 'Content');
        // $fields->push($upload = new UploadField('AudioClip', 'Upload Podcast'));
    }

    public function HomePageHeroFeaturesMixed() {
        $existingFeatures = NewHomePageHeroFeature::get();
        $existingFeaturesArrayList = $this->owner->to_array_list($existingFeatures);
        $numShows = $this->owner->NumberOfUpcomingShowsToDisplay;
        $showHolder = ShowHolderPage::get()->First();

        if ((!$showHolder) || ($numShows == 0)) {
            return $existingFeatures;
        }

        $nextShows = $showHolder->UpcomingShows($numShows);

        // print_r($nextShow);

        if ($nextShows) {

            foreach ($nextShows as $nextShow) {

                $nextShowDate = $nextShow->NextUpcomingDate()->obj('Date')->Format("MMMM d");

                $showFeature = new NewHomePageHeroFeature();
                $showFeature->Title = $nextShow->Title;
                $showFeature->AssociatedPageID = $nextShow->ID;
                $showFeature->ImageID = $nextShow->FeaturedImageID;
                $showFeature->TmdbBgURL = $nextShow->TmdbBgURL;
                $showFeature->ButtonText = $nextShowDate;

                $existingFeaturesArrayList->unshift($showFeature);

            }

        }

        //print_r($existingFeaturesArrayList);
        return $existingFeaturesArrayList;
    }

}
