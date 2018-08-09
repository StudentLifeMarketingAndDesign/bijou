<?php

use SilverStripe\CMS\Model\VirtualPage;
use SilverStripe\Forms\CheckboxSetField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use SilverStripe\Forms\GridField\GridField;
use PageController;
class ProgramHolderPage extends Page {

	private static $db = array(

	);

	private static $has_one = array(

	);

	private static $belongs_many_many = array(
		"Titles" => "ProgramTitle"
	);

	private static $allowed_children = array("ProgramEvent", VirtualPage::class);

	public function getCMSFields(){
		$f = parent::getCMSFields();

		$f->addFieldToTab('Root.Main', new CheckboxSetField("Titles", 'Show the following event titles on this page:', ProgramTitle::get()->map('ID', 'Title')), 'Content');

		//$f->removeByName("Content");
		$gridFieldConfig = GridFieldConfig_RecordEditor::create();
		$gridFieldConfig->addComponent(new GridFieldSortableRows('SortOrder'));


		$gridField = new GridField("ProgramTitle", "Program Titles", ProgramTitle::get(), $gridFieldConfig);
		$f->addFieldToTab("Root.Main", $gridField, "Content"); // add the grid field to a tab in the CMS
		return $f;
	}

	public function Children(){
		$programEvents = parent::Children()->sort('LastName');
		return $programEvents;
	}

	public function ProgramTitles(){
		$titles = ProgramTitle::get();
		return $titles;
	}
}
class ProgramHolderPage_Controller extends PageController {

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