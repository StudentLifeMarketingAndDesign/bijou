<?php

use SilverStripe\Assets\Image;

class PodcastPage extends Page {

	private static $db = array(

	);

	private static $has_one = array(
		"Photo" => Image::class,
	);

	private static $belongs_many_many = array (

	);

	public function getCMSFields(){
		$fields = parent::getCMSFields();

		// $fields->addFieldToTab("Content");

		// $fields->addFieldToTab("Root.Main", new UploadField("Photo", "Photo"));

		$fields->removeByName("Metadata");

		return $fields;

	}

	//private static $allowed_children = array("");

}
