<a href="$Link">
<% if $Poster %>
    <img src="$Poster.URL" alt="Film poster for $Title"class="img-thumbnail" />
<% else_if $TmdbPosterURL %>
    <img src="$TmdbPosterURL" alt="Film poster for $Title"class="img-thumbnail" />
<% end_if %>
</a>
