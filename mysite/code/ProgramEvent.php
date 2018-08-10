<?php

use SilverStripe\Assets\Image;
use SilverStripe\Control\Director;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\DatetimeField;
use SilverStripe\Forms\CheckboxSetField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

class ProgramEvent extends Page {

	private static $db = array(
		"Director" => "Text",
		"Year" => "Text",
		"Runtime" => "Text",
		"DateAndTime" => "DBDatetime",
		"Rating" => "Text",
		"Trailer" => "Text",

	);

	private static $has_one = array(
		"Photo" => Image::class,
	);

	private static $belongs_many_many = array (
		"Titles" => "ProgramTitle"
	);

	private static $owns = array('Photo');

	public function getCMSFields(){
		$fields = parent::getCMSFields();

		$fields->removeByName("Content");
		$fields->removeByName("Metadata");
		$fields->removeByName("BackgroundImage");

		$fields->addFieldToTab("Root.Main", new TextField(Director::class, Director::class));
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
