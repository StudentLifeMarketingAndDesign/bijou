<?php



class BlogFieldExtension extends DataExtension {

    private static $db = array(

    );

    private static $has_one = array(
        'Image' => 'Image',
        'AudioClip' => 'File',
    );

    public function getCMSFields() {
      $this->extend('updateCMSFields', $fields);

      return $fields;
    }


    public function updateCMSFields(FieldList $fields) {

      $fields->addFieldToTab('Root.Main', new UploadField( 'AudioClip', 'Audio Clip'),'Content');

      // remove
      $fields->removeByName("StoryByEmail");
      $fields->removeByName("StoryByTitle");
      $fields->removeByName("StoryByDept");
      $fields->removeByName("PhotosByEmail");
      $fields->removeByName("ExternalURL");
      $fields->removeByName("PhotosBy");
      $fields->removeByName("StoryBy");

      if($this->owner->ClassName == "BlogEntry"){
        //$fields->removeByName("Date");
      }else {
        $fields->renameField("Date", "Published Date");
      }

  }



}