<?php
use SilverStripe\Control\HTTPRequest;
use SilverStripe\View\Requirements;
use SilverStripe\Core\Environment;
use SilverStripe\CMS\Controllers\ContentController;
class FilmSuggestController extends ContentController {

    private static $allowed_actions = array(
        'autocompleteFilmID'
    );
    private static $url_handlers = [
        'autocompleteFilmID' => 'autocompleteFilmID'
    ];
    /**
     * used to autocomplete the teams on office 365
     * @param SS_HTTPRequest $httprequest
     */
    public function autocompleteFilmID(HTTPRequest $httprequest) {
        Requirements::clear();


        $token  = new \Tmdb\ApiToken(Environment::getEnv('TMDB_API_KEY'));

        $client = new \Tmdb\Client($token, [
            'cache' => [
                'path' => '/tmp/php-tmdb'
            ]
        ]);

        $infoArray = array();

        $query = new \Tmdb\Model\Search\SearchQuery\MovieSearchQuery();
        $query->page(1);

        $searchRepo = new \Tmdb\Repository\SearchRepository($client);
        $movieRepo =  new \Tmdb\Repository\MovieRepository($client);
        $configRepository = new \Tmdb\Repository\ConfigurationRepository($client);


        $queryString = $httprequest->getVar('query');
        $returnarray = array();

        if ($queryString && strlen($queryString) > 1) {

            $find = $searchRepo->searchMovie($queryString, $query);
            $findArray = $find->toArray();

            foreach($findArray as $findResult){
            $releaseDate = $findResult->getReleaseDate();
            $releaseYear = $releaseDate->format('Y');

                $returnarray[] = array(
                    'id' => $findResult->getId(),
                    'name' => $findResult->getTitle().' ('.$releaseYear.')',
                );
            }

        }

        print_r(json_encode($returnarray));
    }
}
