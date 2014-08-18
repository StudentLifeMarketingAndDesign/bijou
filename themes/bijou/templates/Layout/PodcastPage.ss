
<div class="large-9 columns">
	<div class="">

		<h1>$Title</h1>
		$Content
		$Form

		<% with Page(bijou-blog) %>
			<% if $Entries('','podcast') %>
				<h3 class="mod-title">Podcasts</h3>
				<ul class="unstyled">
					<% loop $Entries('','podcast') %>
						<li>$Title</li>
					<% end_loop %>
				</ul>
			<% end_if %>
		<% end_with %>

	</div>
</div>

<div class="large-3 columns">
	<div class="panel">
		<% include BlogSideBar %>
	</div>
</div>

