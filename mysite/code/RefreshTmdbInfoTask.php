<?php

use SilverStripe\Dev\BuildTask;

class RefreshTmdbInfoTask extends BuildTask {

	protected $title = 'Refreshes TmdbInfo (fixes image URLs and other things that change over time)';

	protected $enabled = true;

	function run($request) {

		echo "<h2>Refreshing Show Pages</h2>";
		$shows = ShowPage::get();
		foreach ($shows as $show) {
			echo "<li>Refreshing " . $show->Title . "'s Tmdb info.</li>";
			$show->write();

			if ($show->isPublished()) {
				$show->doPublish('Stage', 'Live');
			}

		}

	}

}
