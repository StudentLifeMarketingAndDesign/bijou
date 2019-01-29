$Header
<main class="main-content__container" id="main-content__container">
    $Breadcrumbs
    <div class="grid-container">
        <div class="main-content__text">
            <% loop $UpcomingDates %>
                <h2 class="show-list__date-header">$Date.Format("E, MMM d")</h2>
                <div class="show-list grid-x grid-margin-x medium-up-2 large-up-3">
                    <% loop $ShowsTransient %>
                        <a href="$Link" class="cell show-list__show">
                            <% if $TmdbPosterURL %>
                                <img class="show-list__show-img" src="$TmdbPosterURL" alt="$Title poster image" role="presentation" />
                            <% else_if $Poster %>
                                <img class="show-list__show-img" src="$Poster.FocusFill(267, 400)" alt="$Title poster image" role="presentation" />

                            <% end_if %>
                            <div class="show-list__content">
                                <div class="show-list__content-inner">
                                    <p class="show-list__show-header">
                                        <strong>$Title</strong>
                                    </p>
                                    <p class="show-list__time-list">
                                        <% loop $TimesFormatted %>
                                            <time class="show-list__time">$TimeFormatted</time>
                                        <% end_loop %>
                                    </p>
                                </div>
                                <div class="show-list__moreinfo">More Info</div>
                            </div>
                        </a>
                    <% end_loop %>
                </div><br />
            <% end_loop %>
        </div>
    </div>
</main>

<%--
    <h2>Upcoming shows</h2>
    <% loop $UpcomingShows %>
        <p>$Title</p>
        <ul>
        <% loop $Dates %>
            <li>$Date.Nice - $Times</li>
        <% end_loop %>
        </ul>
    <% end_loop %>
 --%>
