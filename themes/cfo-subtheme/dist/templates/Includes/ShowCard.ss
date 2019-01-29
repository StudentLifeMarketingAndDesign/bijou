<div class="showcard clearfix ">
    <!-- show series -->
    <% if $SeriesPages.exists %>
        <p class="showcard__category">
        <% loop $SeriesPages %>
            <a href="$Link" class="showcard__category">$Title</a><% if not Last %><% else %><% end_if %>
        <% end_loop %>
        </p>
    <% end_if %>

    <% if $TmdbPosterURL %>
        <a href="$Link" class="showcard__img">
            <img class="dp-lazy" alt="" role="presentation" data-original="$TmdbPosterURL" width="267" height="400" src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" alt="$Title">
        </a>

    <% else_if $Poster %>
        <a href="$Link" class="showcard__img">
            <img class="dp-lazy" alt="" role="presentation" data-original="$Poster.FocusFill(267, 400)" width="267" height="400" src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" alt="$Title">
        </a>
    <% end_if %>

    <div class="showcard__content">
        <h3 class="showcard__heading"><a href="$Link">$Title</a></h3>

        <%-- <% if $Summary %>
            <div class="showcard__desc">$Summary</div>
        <% else %>
            <p class="showcard__desc">$Content.LimitCharacters(130) <br /><a href="$Link">Continue reading</a></p>
        <% end_if %> --%>

        <% loop $Dates %>
            <p class="show-list__date"><strong>$Date.Format("E, MMM d")</strong></p>
            <div class="show-list__time-list">
                <% loop $TimesFormatted %>
                    <time class="show-list__time">$TimeFormatted</time>
                <% end_loop %>
            </div>
        <% end_loop %>
    </div>
</div>