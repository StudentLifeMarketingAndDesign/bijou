<?php

use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Forms\TreeDropdownField;
use SilverStripe\Forms\TreeMultiselectField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\OptionsetField;
use UncleCheese\DisplayLogic\Forms\Wrapper;
use SilverStripe\Forms\DropdownField;
use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\DateField;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig;
use SilverStripe\Forms\GridField\GridFieldDataColumns;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\ORM\ArrayList;

class ShowDate extends DataObject{

    private static $db = array(
        'Date' => 'Date',
        'Times' => 'Text'

    );
    private static $has_one = array(
        'ShowPage' => 'ShowPage'
    );

    private static $has_many = array(
        // 'Times' => 'ShowTime'
    );

    private static $summary_fields = array('Date');


    public function getCMSFields() {

        $fields = new FieldList();

        $fields->push(new DateField('Date'));
        $fields->push(new TextareaField('Times','Time(s) (One time per line)'));
        // $timeFieldConfig = GridFieldConfig_RelationEditor::create();
        // $timeField = new GridField('Times', 'Times', $this->Times());
        // $timeField->setConfig($timeFieldConfig);


        // $fields->push($timeField);

        return $fields;
    }
    public function TimesFormatted(){
        if(!$this->Times){
            return;
        }

        $times = $this->Times;
        //$times = strip_tags($times);
        //Debug::show($times);
        $timesArray = explode("\n", $times);

        $timesArrayList = new ArrayList();

        foreach($timesArray as $time){
            //$time = strip_tags($time);
            $time = trim(preg_replace('/\s+/', ' ', $time));

            $timestamp = strtotime($time);



            $timeFormatted = date('g:iA', $timestamp);

            $timeObj = new DataObject;
            $timeObj->TimeFormatted =  $timeFormatted;
            $timesArrayList->push($timeObj);

            //print_r($timeObj->TimeFormatted);
        }

        return $timesArrayList;

    }
}
