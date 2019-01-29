$Header
<main class="main-content__container" id="main-content__container">

    <!-- $Breadcrumbs -->

    <% if $TmdbBgURL %>
        <div class="show-featured" data-interchange="[$TmdbBgURL, small], [$TmdbBgURL, medium]">
            <% if $TrailerVideoID %>
                <a class="popup-youtube show-trailer" href="https://www.youtube.com/watch?v={$TrailerVideoID}">
                    <svg class="css-18vwi2-playButton" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40" width="40" height="40"><title>Play Trailer</title><g opacity=".53"><circle cx="20" cy="20" r="19.5" fill="#4a4a4a"></circle><path d="M20 1c10.5 0 19 8.5 19 19s-8.5 19-19 19S1 30.5 1 20 9.5 1 20 1m0-1C9 0 0 9 0 20s9 20 20 20 20-9 20-20S31 0 20 0z" fill="#fff"></path></g><path fill="#fff" d="M29.6 21.1l-14.1-9.3v18.6z"></path></svg>
                </a>
            <% end_if %>
        </div>
    <% else_if $FeaturedImage %>
        <div class="show-featured" data-interchange="[$FeaturedImage.FocusFill(600,400).URL, small], [$FeaturedImage.FocusFill(1400,800).URL, medium]">
            <% if $TrailerVideoID %>
                <a class="popup-youtube show-trailer" href="https://www.youtube.com/watch?v={$TrailerVideoID}">
                    <svg class="css-18vwi2-playButton" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40" width="40" height="40"><title>Play Trailer</title><g opacity=".53"><circle cx="20" cy="20" r="19.5" fill="#4a4a4a"></circle><path d="M20 1c10.5 0 19 8.5 19 19s-8.5 19-19 19S1 30.5 1 20 9.5 1 20 1m0-1C9 0 0 9 0 20s9 20 20 20 20-9 20-20S31 0 20 0z" fill="#fff"></path></g><path fill="#fff" d="M29.6 21.1l-14.1-9.3v18.6z"></path></svg>
                </a>
            <% end_if %>
        </div>
    <% end_if %>

    <div class="row" style="position: relative;">
        <article role="main" class="main-content main-content--with-padding main-content--with-sidebar">
            <div class="main-content__text">
                <div class="">
                    <h1 class="showpage__title">$Title</h1>
                    $Content

                    <hr />

                    $FilmSummary

                    <% if $FilmTitle %>
                    <h2>Showtimes for $FilmTitle:</h2>
                    <div class="show-list">
                        <% loop $Dates %>
                            <p class="show-list__date"><strong>$Date.Format("E, MMM d")</strong></p>
                            <div class="show-list__time-list">
                                <% loop $TimesFormatted %>
                                    <time class="show-list__time">$TimeFormatted</time>
                                <% end_loop %>
                            </div>
                        <% end_loop %>
                    </div>
                    <br /><br />
                    <% end_if %>
                </div>
                $AfterContentConstrained
            </div>
            $Form
        </article>
        <aside class="sidebar dp-sticky">
            <% if $TmdbPosterURL %>
                <div class="posterimg">
                    <img src="$TmdbPosterURL" alt="$Title poster image" />
                </div>
            <% end_if %>

            <div class="show-meta">
                <ul class="show-meta__list">
                    <% if $FilmSceneLink %>
                        <li class="show-meta__item">
                            <a href="$FilmSceneLink" target="_blank">View on Film Scene</a>
                        </li>
                    <% end_if %>
                    <% if $FacebookEventLink %>
                        <li class="show-meta__item">
                            <a href="$FacebookEventLink" target="_blank">View Event on Facebook</a>
                        </li>
                    <% end_if %>
                    <% if $TicketsLink %>
                        <li class="show-meta__item">
                            <a href="$TicketsLink" target="_blank">Buy Tickets</a>
                        </li>
                    <% end_if %>
                    <% if $TrailerVideoID %>
                        <li class="show-meta__item">
                            <a class="popup-youtube" href="https://www.youtube.com/watch?v={$TrailerVideoID}">View Trailer</a>
                        </li>
                    <% end_if %>
                </ul>
            </div>

            <br />
        </aside>
    </div>
    $AfterContent
</main>

<% if $RelatedNewsEntries %>
<div class="block_area block_area_aftercontent">
    <section class="content-block__container recentnews" aria-labelledby="RelatedNewsSection">
        <div class="content-block row">
            <div class="newsblock">
                <div class="column">
                    <h3 class="newsblock-title text-center" id="RelatedNewsSection">Related News</h3>
                </div>
                <ul class="medium-up-3 ">
                    <% loop $RelatedNewsEntries.limit(3) %>
                        <li class="column column-block">
                            <% include BlogCard %>
                        </li>
                    <% end_loop %>
                </ul>
            </div>
        </div>
    </section>
</div>
<% end_if %>