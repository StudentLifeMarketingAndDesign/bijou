<div class="large-9 columns content-left">
	<article>

		<h1>$Title</h1>
		$Content
		$Form

		<% with Page(bijou-blog) %>
			<% if $Entries('','podcast') %>
				<% loop $Entries('','podcast') %>

					<div class="blogSummary">
						<h2 class="postTitle">
							<a href="$Link" title="<% _t('BlogSummary_ss.VIEWFULL', 'View full post titled -') %> '$Title'">$MenuTitle</a>
						</h2>
						<p class="authorDate">
							<% if $StaffPage %>
								Posted by <a href="$StaffPage.Link">$StaffPage.Title</a> on $Date.Long
							<% else %>
								Posted<% if $Author %> by $Author<% end_if %> on $Date.Long
							<% end_if %>
						</p>


						<% if BlogHolder.ShowFullEntry %>
							<% if $AudioClip %>
								<audio src="$AudioClip.Filename" controls="controls"></audio>
							<% end_if %>
							$Content
						<% else %>
							<p>$Content.FirstParagraph(html)</p>
							<% if $AudioClip %>
								<audio src="$AudioClip.Filename" controls="controls"></audio>
							<% end_if %>
							<p class="blogVitals">
								<a href="$Link" class="readmore" title="Listen to the podcast">Listen to the podcast</a>
							</p>
						<% end_if %>
					</div>
					<hr>

				<% end_loop %>
				<% include BlogPagination %>
			<% end_if %>

		<% end_with %>


	</article>
</div>

<div class="large-3 columns content-right">
	<br>
	<% include BlogSideBar %>
</div>

