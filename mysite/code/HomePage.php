<?php

class HomePage extends Page {

	private static $db = array(

	);

	private static $has_one = array(

	);

	private static $has_many = array(

	);

	public function getCMSFields() {
		$f = parent::getCMSFields();
		$contentField = $f->dataFieldByName('Content');
		$contentField->setRows(2);
		$f->removeByName("Content");
		$f->removeByName("BackgroundImage");
		$f->removeByName("InheritSidebarItems");
		$f->removeByName("SidebarLabel");
		$f->removeByName("SidebarItem");
		$f->removeByName("Metadata");

		return $f;
	}
}
