<?php
class BijouHomePage extends HomePage {

	private static $db = array(
		"Mission" => "Text",
	);

	private static $has_one = array(

	);

	private static $belongs_many_many = array (

	);

	public function getCMSFields(){
		$fields = parent::getCMSFields();

		$fields->addFieldToTab("Root.Main", new TextareaField("Mission", "Mission Statement"));

		return $fields;

	}

	//private static $allowed_children = array("");

}
class BijouHomePage_Controller extends HomePage_Controller {

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