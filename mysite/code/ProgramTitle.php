<?php
class ProgramTitle extends DataObject {

	private static $db = array(
		"Name" => "Text",
		"SortOrder" => "Int"

	);

	private static $many_many = array(
		"ProgramEvents" => "ProgramEvent",
		"ProgramHolderPages" => "ProgramHolderPage"
	);

	private static $belongs_many_many = array(

	);

	private static $summary_fields = array(
	  'Name' => 'Name',
   );

   private static $default_sort = array(
   		"SortOrder"
   );

      public function getCMSFields() {
		$f = parent::getCMSFields();

		$f->addFieldToTab('Root.Main', new CheckboxSetField("ProgramEvents", 'Titles <a href="admin/pages/edit/show/14" target="_blank">(Manage Titles)</a>', ProgramEvent::get()->map('ID', 'Title')));
		return $f;

     }

     public function SortedProgramEvents(){
	     $programEvents = $this->ProgramEvents()->sort('Sort');
	     return $programEvents;

     }

}
