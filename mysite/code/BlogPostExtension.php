<?php

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\File;
use SilverStripe\Blog\Model\BlogTag;
use SilverStripe\Forms\FieldList;
use SilverStripe\ORM\DataExtension;
use SilverStripe\TagField\TagField;

class BlogPostExtension extends DataExtension {

	private static $has_one = array(
		'AudioClip' => File::class,
	);

	private static $owns = array(
		'AudioClip',
	);

	// function getCMSFields() {

	//     $fields = parent::getCMSFields();

	//     $fields->addFieldToTab(
	//         'Root.Upload',
	//         $uploadField = new UploadField(
	//             $name = 'AudioClip',
	//             $title = 'Upload a single audio clip'
	//         )
	//     );
	//     return $fields;
	// }

	public function updateCMSFields(FieldList $fields) {
		$fields->addFieldToTab('Root.Main', $upload = new UploadField('AudioClip', 'Upload Podcast'), 'Content');
		$fields->removeByName('Tags');
		$fields->removeByName('YoutubeBackgroundEmbed');
		$fields->removeByName('LayoutType');
		$fields->removeByName('BackgroundImage');
		$parent = $this->owner->Parent();
		$tags = $parent instanceof Blog
		? $parent->Tags()
		: BlogTag::get();

		$tagField = TagField::create(
			'Tags',
			'Tags (e.g., "podcast")',
			$tags,
			$this->owner->Tags()
		)->setCanCreate($this->owner->canCreateTags())->setShouldLazyLoad(true);

		$fields->addFieldToTab('Root.Main', $tagField, 'AudioClip');
	}

	public function HasTag($tagName) {
		return $this->owner->Tags()->filter(array('Title' => $tagName))->First();
	}

}
