<a href="$Link">
<% if $Poster %>
    <img data-src="$Poster.URL" alt="Film poster for $Title"class="lazyload p-1 d-block w-100" />
<% else_if $TmdbPosterURL %>
    <img data-src="$TmdbPosterURL" alt="Film poster for $Title"class="lazyload p-1 d-block w-100" />
<% end_if %>
</a>
