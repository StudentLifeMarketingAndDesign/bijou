<?php

use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Forms\TreeDropdownField;
use SilverStripe\Forms\TreeMultiselectField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\OptionsetField;
use UncleCheese\DisplayLogic\Forms\Wrapper;
use SilverStripe\Forms\DropdownField;
use SilverStripe\ORM\DataObject;


class ShowTime extends DataObject{

    private static $db = array(
        'Time' => 'Time'

    );
    private static $has_one = array(
        'Date' => 'ShowDate'
    );

    private static $summary_fields = array('Time');

    public function getTitle(){
        return $this->Time()->Nice();
    }

}
