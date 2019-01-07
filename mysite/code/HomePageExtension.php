<?php

use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\FieldList;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\File;
use SilverStripe\ORM\ArrayList;
class HomePageExtension extends DataExtension {

	private static $has_one = array(

    );

	private static $owns = array(

	);

    public function updateCMSFields(FieldList $fields) {
       // $fields->push($upload = new UploadField('AudioClip', 'Upload Podcast'));
    }

    public function HomePageHeroFeaturesMixed(){
        $existingFeatures = NewHomePageHeroFeature::get();
        $existingFeaturesArrayList = $this->owner->to_array_list($existingFeatures);

        $showHolder = ShowHolderPage::get()->First();
        $nextShow = $showHolder->UpcomingShows(1)->First();



        if($nextShow){

            $showFeature = new NewHomePageHeroFeature();
            $showFeature->Title = $nextShow->Title;
            $showFeature->AssociatedPageID = $nextShow->ID;
            $showFeature->ImageID = $nextShow->FeaturedImageID;
            $existingFeaturesArrayList->unshift($showFeature);
        }



        //print_r($existingFeaturesArrayList);
        return $existingFeaturesArrayList;
    }

}



