<?php

use SilverStripe\Forms\DateField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextareaField;
use SilverStripe\ORM\ArrayList;
use SilverStripe\ORM\DataObject;
use SilverStripe\Versioned\Versioned;

class ShowDate extends DataObject {

	private static $db = array(
		'Date' => 'Date',
		'Times' => 'Text',

	);
	private static $has_one = array(
		'ShowPage' => 'ShowPage',
	);

	private static $has_many = array(
		// 'Times' => 'ShowTime'
	);

	private static $many_many = array(
		'SeriesPages' => 'SeriesPage',
	);

	private static $summary_fields = array('Date');

	private static $extensions = [
		Versioned::class,
	];

	public function getCMSFields() {

		$fields = new FieldList();

		$fields->push(new DateField('Date'));
		$textarea = new TextareaField('Times', 'Start time(s) (One time per line, no time ranges or end times, please only start times. ex: "6pm")');
		$fields->push($textarea);
		// $timeFieldConfig = GridFieldConfig_RelationEditor::create();
		// $timeField = new GridField('Times', 'Times', $this->Times());
		// $timeField->setConfig($timeFieldConfig);

		// $fields->push($timeField);

		return $fields;
	}

	public function onBeforeWrite() {
		$timesFormatted = trim(preg_replace('/\s\s+/', ' ', $this->Times));
		$this->Times = $timesFormatted;

		parent::onBeforeWrite();
	}
	public function TimesFormatted() {
		if (!$this->Times) {
			return;
		}

		$times = $this->Times;
		//$times = strip_tags($times);
		//Debug::show($times);
		$timesArray = explode("\n", $times);

		$timesArrayList = new ArrayList();

		foreach ($timesArray as $time) {
			//$time = strip_tags($time);
			$time = trim(preg_replace('/\s+/', ' ', $time));

			$timestamp = strtotime($time);

			$timeFormatted = date('g:iA', $timestamp);

			$timeObj = new DataObject;
			$timeObj->TimeFormatted = $timeFormatted;
			$timesArrayList->push($timeObj);

			//print_r($timeObj->TimeFormatted);
		}

		return $timesArrayList;

	}
}
