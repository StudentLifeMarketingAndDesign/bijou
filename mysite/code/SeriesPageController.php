<?php

use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Forms\EmailField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\Form;
use SilverStripe\Forms\RequiredFields;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\TextField;
use SilverStripe\Control\Email\Email;


class SeriesPageController extends PageController
{
    /**
     * An array of actions that can be accessed via a request. Each array element should be an action name, and the
     * permissions or conditions required to allow the user to access it.
     *
     * <code>
     * [
     *     'action', // anyone can access this action
     *     'action' => true, // same as above
     *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
     *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
     * ];
     * </code>
     *
     * @var array
     */
    private static $allowed_actions = ['SuggestionForm'];

    protected function init()
    {

        parent::init();
        // You can include any CSS or JS required by your project here.
        // See: https://docs.silverstripe.org/en/developer_guides/templates/requirements/
    }
        public function SuggestionForm(){

            $fields = new FieldList(
                TextField::create('Name','Your Name (optional):'),
                TextField::create('ContactInfo', 'Your Email (optional):'),
                TextField::create('FilmSeries', 'Film Series:', $this->Title),
                TextField::create('FilmTitle','Suggested Film Title (required):')
            );

            $actions = new FieldList(
                    FormAction::create('submit')->setTitle('Submit a Suggestion!')
                );

            $required = new RequiredFields('FilmTitle');

            $form = new Form($this, 'SuggestionForm', $fields, $actions, $required);
            $form->enableSpamProtection();
            return $form;
        }

        public function submit($data, $form){
            $email = new Email();

            $email->setTo('bijouui.executive@gmail.com');
            $email->setFrom('imu-web@uiowa.edu');
            $email->setSubject("[Bijou Website] Film Suggestion from {$data['Name']}");

            $messageBody = "
                <p><strong>Name:</strong> {$data['Name']}</p>
                <p><strong>Email:</strong> {$data['ContactInfo']}</p>
                <p><strong>Film Series:</strong>{$data['FilmSeries']}</p>
                <p><strong>Film Suggestion:</strong>{$data['FilmTitle']}</p>
            ";
            $email->setBody($messageBody);
            $email->send();
            return [
                'Thanks' => 'Thank you for your suggestion!',
                'Form' => ''
            ];
        }
}

    //      public function SendSuggestion($data, Form $form)
    // {
    //     $form->sessionMessage('Submit a Suggestion!' . $data['Suggested Film Title (required):'], 'Thank you for your feedback!');

    //     return $this->redirectBack();
    // }


