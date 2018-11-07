<?php

use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Forms\TreeDropdownField;
use SilverStripe\Forms\TreeMultiselectField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\OptionsetField;
use UncleCheese\DisplayLogic\Forms\Wrapper;
use SilverStripe\Forms\DropdownField;

class ShowsBlock extends BaseElement{

    private static $db = array(


    );
    private static $has_one = array(

    );

    private static $many_many = array(

    );

    private static $table_name = 'ShowsBlock';

    public function getType()
    {
        return 'Shows Block';
    }


    public function Shows() {
        $shows = ShowPage::get()->sort('ShowingDate DESC')->limit(3);
        return $shows;
    }


}
