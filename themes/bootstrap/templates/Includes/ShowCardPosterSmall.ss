<a href="$Link">
<% if $Poster %>
    <img src="$Poster.URL" alt="Film poster for $Title"class="p-1 d-block w-100" />
<% else_if $TmdbPosterURL %>
    <img src="$TmdbPosterURL" alt="Film poster for $Title"class="p-1 d-block w-100" />
<% end_if %>
</a>
