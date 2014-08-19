<?php
class ProgramTitle extends DataObject {

	private static $db = array(
		"Name" => "Text",
		"Description" => "Text",
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
	  "Description" => "Description",
   );

   private static $default_sort = array(
   		"SortOrder"
   );

      public function getCMSFields() {
		$f = parent::getCMSFields();
		$f->addFieldToTab("Root.Main", new TextareaField("Description", "Description"));

		$f->addFieldToTab('Root.Main', new CheckboxSetField("ProgramEvents", 'Titles', ProgramEvent::get()->map('ID', 'Title')));
		return $f;

     }

     public function SortedProgramEvents(){
	     $programEvents = $this->ProgramEvents()->sort('Sort');
	     return $programEvents;

     }

}
