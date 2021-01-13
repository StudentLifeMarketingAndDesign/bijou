<a href="$Link">
<% if $Poster %>
    <img src="$Poster.URL" alt="Film poster for $Title"class="img-thumbnail w-50 float-right mb-3 ml-3 mr-lg-n8 mr-xl-n9" />
<% else_if $TmdbPosterURL %>
    <img src="$TmdbPosterURL" alt="Film poster for $Title"class="img-thumbnail w-50 float-right mb-3 ml-3 mr-lg-n8 mr-xl-n9" />
<% end_if %>
</a>
<div class="show-list__content">
    <div class="show-list__content-inner">
        <h2><a href="$Link">$Title</a></h2>
        <% if $Ongoing %>Date: <strong>Streaming Until ...</strong><% end_if %>
        <% if $Content %>$Content<% end_if %>
        <% loop $Dates %>
            <p class="show-list__date"><strong>$Date.Format("EEEE, MMMM d, Y")</strong></p>
            <h3>Showtimes:</h3>
            <ul class="show-list__time-list">
                <% loop $TimesFormatted %>
                    <li class="show-list__time"><time>$TimeFormatted</time></li>
                <% end_loop %>
            </ul>
        <% end_loop %>
        <% if $FilmSummary %>
            <hr />
            $FilmSummary
        <% end_if %>
    </div>
    <div class="show-list__moreinfo pt-4"><a href="$Link" class="btn btn-outline-dark">More Info</a></div>
</div>
