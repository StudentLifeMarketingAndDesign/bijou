<?php

use SilverStripe\Forms\TextareaField;
use SilverStripe\ORM\ArrayList;

class SeriesPage extends Page {

	private static $db = array(
		'AccentColor' => 'Varchar(7)',
		'AccentColorLight' => 'Varchar(7)',
		'Subtitle' => 'Varchar',

	);

	private static $has_one = array(

	);

	private static $belongs_many_many = array(
		'ShowPages' => 'ShowPage',
		'ShowDates' => 'ShowDate',
	);

	//private static $allowed_children = array("");

	public function getCMSFields() {
		$fields = parent::getCMSFields();

		// $fields->addFieldToTab('Root.Main', ColorField::create('AccentColor'), 'Content');
		// $fields->addFieldToTab('Root.Main', ColorField::create('AccentColorLight'), 'Content');
		$fields->addFieldToTab('Root.Main', TextareaField::create('Subtitle'), 'Content');
		return $fields;
	}

	public function AccentRgb() {
		$hex = $this->AccentColor;
		$rgb = $this->hex2rgb($hex);
		// print_r($rgb);
		$rgbString = $rgb['red'] . ',' . $rgb['green'] . ',' . $rgb['blue'];

		return $rgbString;
	}

	public function AccentLightRgb() {
		$hex = $this->AccentColor;
		$rgb = $this->hex2rgb($hex);
		// print_r($rgb);
		$rgbString = $rgb['red'] . ',' . $rgb['green'] . ',' . $rgb['blue'];

		return $rgbString;
	}

	public function NextUpcomingBackgroundURL() {
		$show = $this->UpcomingShows(1)->First();

		if ($show) {
			if ($show->TmdbBgURL) {
				return $show->TmdbBgURL;
			}

			if ($show->FeaturedImage()) {
				return $show->FeaturedImage()->URL;
			}

		}

	}

	public function UpcomingShows($count = 5) {

		$now = date('Y-m-d');
		$dates = ShowDate::get()->filter(array(
			'Date:GreaterThanOrEqual' => $now,
		))->sort('Date');
		// print_r($dates->toArray());
		$shows = new ArrayList();

		foreach ($dates as $date) {
			$showPage = $date->ShowPage();

			if ($showPage) {
				//TODO: Optimize this, we're looping through and filtering, ineffecient
				foreach ($showPage->SeriesPages() as $seriesPage) {

					if ($seriesPage->ID == $this->ID) {
						$shows->push($showPage);
					}
				}

			}

		}

		return $shows->Limit(5);
	}

	private function hex2rgb($colour) {
		if ($colour[0] == '#') {
			$colour = substr($colour, 1);
		}
		if (strlen($colour) == 6) {
			list($r, $g, $b) = array($colour[0] . $colour[1], $colour[2] . $colour[3], $colour[4] . $colour[5]);
		} elseif (strlen($colour) == 3) {
			list($r, $g, $b) = array($colour[0] . $colour[0], $colour[1] . $colour[1], $colour[2] . $colour[2]);
		} else {
			return false;
		}
		$r = hexdec($r);
		$g = hexdec($g);
		$b = hexdec($b);
		return array('red' => $r, 'green' => $g, 'blue' => $b);
	}

}
