<?php
use SilverStripe\ORM\PaginatedList;

class ShowHolderPageController extends PageController {

	public function paginatedPreviousShows() {
		$curDate = date("Y-m-d");

		$previousShows = $this->PreviousShows();
		$paginatedItems = new PaginatedList($previousShows, $this->request);
		$paginatedItems->setPageLength(24);

		return $paginatedItems;
	}
}
