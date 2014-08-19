<?php
class ProgramEvent extends Page {

	private static $db = array(
		"Director" => "Text",
		"Year" => "Text",
		"Runtime" => "Text",
		"DateAndTime" => "SS_Datetime",
		"Rating" => "Text",
		"Trailer" => "Text",

	);

	private static $has_one = array(
		"Photo" => "Image",
	);

	private static $belongs_many_many = array (
		"Titles" => "ProgramTitle"
	);

	public function getCMSFields(){
		$fields = parent::getCMSFields();

		$fields->removeByName("Content");
		$fields->removeByName("Metadata");
		$fields->removeByName("BackgroundImage");

		$fields->addFieldToTab("Root.Main", new TextField("Director", "Director"));
		$fields->addFieldToTab("Root.Main", new TextField("Year", "Year"));
		$fields->addFieldToTab("Root.Main", new TextField("Runtime", "Runtime (minutes)"));
		$fields->addFieldToTab("Root.Main", new TextField("Rating", "Rating (PG, PG-13, R, NR)"));

		$dateTimeField = new DatetimeField("DateAndTime", "Enter a date and time");
		$dateTimeField::create('DateAndTime')->setConfig('dateformat', 'dd-MM-yyyy');
		$dateTimeField->getDateField()->setConfig('showcalendar', 1);

		$fields->addFieldToTab("Root.Main", $dateTimeField );

		//$fields->addFieldToTab("Root.Main", new TextField("Time", "Time (11pm)"));
		$fields->addFieldToTab("Root.Main", new TextField("Trailer", "Trailer URL"));


		$fields->addFieldToTab("Root.Main", new CheckboxSetField("Titles", 'Titles <a href="admin/pages/edit/show/14" target="_blank">(Manage Titles)</a>', ProgramTitle::get()->map('ID', 'Name')));

		//$fields->addFieldToTab("Root.Main", new LiteralField("TeamLabel", ''));

		$fields->addFieldToTab("Root.Main", new UploadField("Photo", "Photo (dimensions)"));

		$fields->addFieldToTab("Root.Main", new HTMLEditorField("Content", "Description"));

		return $fields;

	}

	//private static $allowed_children = array("");

}
class ProgramEvent_Controller extends Page_Controller {

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