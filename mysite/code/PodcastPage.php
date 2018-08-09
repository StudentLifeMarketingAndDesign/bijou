<?php

use SilverStripe\Assets\Image;
use PageController;
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
class PodcastPage_Controller extends PageController {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
	private static $allowed_actions = array (
	);

	public function init() {
		parent::init();


	}

}