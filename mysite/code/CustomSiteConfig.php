<?php

class CustomSiteConfig extends DataExtension {

    private static $db = array(
        'SettingsFooter' => 'HTMLText'
    );

    public function updateCMSFields(FieldList $fields) {
        $fields->addFieldToTab("Root.Main", new HTMLEditorField("SettingsFooter", "Footer Content"));
    }
}