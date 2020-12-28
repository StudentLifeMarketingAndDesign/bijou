<?php
use SilverStripe\Blog\Model\Blog;

class NewsHolder extends Blog {

	public function getCMSFields() {
		$f = parent::getCMSFields();

		return $f;
	}

	public function getPostsWithAudio() {

		$posts = $this->blogPosts->filter(array('AudioClipID:not' => 0));

		return $posts;

	}
}
