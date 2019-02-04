<?php

use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\ORM\ArrayList;
use SilverStripe\Forms\CheckboxField;
class Page extends SiteTree {

	private static $db = array(

        'HideInstaFeed' => 'Boolean'

	);

	private static $has_one = array(
	);


	private static $many_many = array (
	);

    private static $many_many_extraFields=array(
      );

    private static $plural_name = "Pages";

	private static $defaults = array ();


	public function getCMSFields(){
		$f = parent::getCMSFields();

        $f->addFieldToTab('Root.Main', new CheckboxField('HideInstaFeed', 'Hide Instagram feed from this page'));

		return $f;
	}

    public function AllUpcomingShows(){

        $holder = ShowHolderPage::get()->First();

        if($holder){
            return $holder->UpcomingShows();
        }
    }
    /**
     * This method converts a {@link DataList} to an {@link ArrayList} with an option to add
     * an additional column to each list item to be used for sorting. This is particularly useful when you are
     * trying to group or sort a list by a value on a somehow related object, or not able to query from the database.
     *
     * @param DataList $list
     * @param bool $additionalSortColumn If you have MyObject with a has_one relation to OtherObject
     *                                      which then has a has_one to ThirdObject,
     *                                      you would pass the following for column: 'OtherObject.ThirdObject.FieldName
     *                                      where FieldName is on the ThirdObject
     * @return ArrayList
     */

    public static function to_array_list(SilverStripe\ORM\DataList $list, $additionalSortColumn = false)
    {
        $arrayList = ArrayList::create();

        $push = function ($item) use (&$arrayList, &$additionalSortColumn) {
            if ($additionalSortColumn) {
                $item = self::additional_sort_column($item, $additionalSortColumn);
            }
            $arrayList->push($item);
        };

        $list->each($push);

        return $arrayList;
    }


}
