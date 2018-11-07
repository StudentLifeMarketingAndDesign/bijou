<?php

use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Forms\TreeDropdownField;
use SilverStripe\Forms\TreeMultiselectField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\OptionsetField;
use UncleCheese\DisplayLogic\Forms\Wrapper;
use SilverStripe\Forms\DropdownField;

class StaffHolderBlock extends BaseElement{

	private static $db = array(
		'MaxSize' => 'Enum(array("4x4","3x3","2x2")',

	);
	private static $has_one = array(
		'Holder' => SiteTree::class,
	);

	private static $many_many = array(
		'CustomPages' => 'Page'
	);

    private static $table_name = 'StaffHolderBlock';

    public function getType()
    {
        return 'Staff Holder Block';
    }

    public function StaffPages() {
			$StaffPages= StaffPage::get()->sort('RAND()')->limit(4);

		return $StaffPages;
	}

	public function StaffHolder(){
		$StaffHolder= StaffHolderPage::get()->First();
		return $StaffHolder;
	}
	public function getCMSFields() {
		$f = parent::getCMSFields();

		$f->removeByName('HolderID');
		$f->removeByName('CustomPages');

		$f->addFieldsToTab('Root.Main', array(

			DropdownField::create(
			  'MaxSize',
			  'Maximum tile grid size on large displays',
			  singleton('TileGridBlock')->dbObject('MaxSize')->enumValues()
			)

		));



		return $f;



	}


}
