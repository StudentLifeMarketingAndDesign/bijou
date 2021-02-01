<?php
use SilverStripe\Blog\Model\Blog;

class NewsHolder extends Blog {

	private static $allowed_children = [
		BlogPost::class,
	];

	public function getCMSFields() {
		$f = parent::getCMSFields();

		return $f;
	}

	public function getPostsWithAudio() {

		$posts = $this->blogPosts->filter(array('AudioClipID:not' => 0));

		return $posts;

	}

}
