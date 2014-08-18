
<div class="large-9 columns">
	<div class="">

		<h1>$Title</h1>
		$Content
		$Form

		<% loop getBlogsByTag(podcast) %>
			html code here...
		<% end_loop %>



	</div>
</div>

<div class="large-3 columns">
	<div class="panel">
		<% include BlogSideBar %>
	</div>
</div>

