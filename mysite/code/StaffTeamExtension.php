<?php
use SilverStripe\ORM\DataExtension;

class StaffTeamExtension extends DataExtension {

    public function ActiveStaffPages() {

        $staffPages = $this->owner->StaffPages()->filter(array('ShowInMenus' => 1));
        $alumniTeam = StaffTeam::get()->filter(array('Name' => 'Alumni'))->First();
        $alumniStaffPages = $alumniTeam->StaffPages();

        $activeStaffPages = $staffPages->subtract($alumniStaffPages);

        return $activeStaffPages;

    }

    public function AlumniStaffPages() {
        $staffPages = $this->owner->StaffPages();
        $alumniPages = new ArrayList();
        foreach ($staffPages as $staffPage) {
            $staffTeams = $staffPage->Teams();

            foreach ($staffTeams as $staffTeam) {
                if ($staffTeam->Name == "Alumni") {
                    $alumniPages->push($staffPage);
                }
            }

        }

        return $alumniPages;

    }

}
