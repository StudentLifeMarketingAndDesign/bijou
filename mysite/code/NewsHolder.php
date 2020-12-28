<?php
use SilverStripe\Blog\Model\BlogPost;

class NewsHolder extends Blog {

	public function getCMSFields() {
		$f = parent::getCMSFields();

		return $f;
	}
	private static $allowed_children = [
		BlogPost::class,
	];
	public function getPostsWithAudio() {

		$posts = $this->blogPosts->filter(array('AudioClipID:not' => 0));

		return $posts;

	}
}
