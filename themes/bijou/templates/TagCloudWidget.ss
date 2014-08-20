<ul class="tagcloud side-nav">
	<% loop TagsCollection %>
		<li><a href="$Link" class="$Class">$Tag.XML</a></li>
	<% end_loop %>
</ul>