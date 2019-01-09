$Header
<main class="main-content__container" id="main-content__container">
    $Breadcrumbs
<div class="grid-container">
    <div class="main-content__text">
        <% loop $UpcomingDates %>

                <h2 class="show-list__date-header">$Date.Format("E, MMM d")</h2>
                    <div class="show-list grid-x grid-padding-x small-up-2 medium-up-2 large-up-3">
                        <% loop $ShowsTransient %>
                        <a href="$Link" class="cell show-list__show">
                            <% if $FeaturedImage %>
                            <img class="show-list__show-img" src="$FeaturedImage.FocusFill(800, 600).URL" alt="" role="presentation" />
                            <% end_if %>
                            <h3 class="show-list__show-header">$Title</h3>
                            <p class="show-list__time-list">
                                <% loop $TimesFormatted %>
                                    <time class="show-list__time">$TimeFormatted</time>
                                <% end_loop %></p>
                        </a>
                        <% end_loop %>
                    </div>

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