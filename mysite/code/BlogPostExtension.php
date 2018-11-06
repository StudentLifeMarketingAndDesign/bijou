<?php

use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\FieldList;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\File;

class BlogPostExtension extends DataExtension {

	private static $has_one = array(
        'AudioClip' => File::class
    );

	private static $owns = array(
		'AudioClip'
	);

        // function getCMSFields() {

        //     $fields = parent::getCMSFields();

        //     $fields->addFieldToTab(
        //         'Root.Upload',
        //         $uploadField = new UploadField(
        //             $name = 'AudioClip',
        //             $title = 'Upload a single audio clip'
        //         )
        //     );
        //     return $fields;
        // }

    public function updateCMSFields(FieldList $fields) {
       $fields->push($upload = new UploadField('AudioClip', 'Upload Podcast'));
    }

}



