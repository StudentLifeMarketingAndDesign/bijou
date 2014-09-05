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
							Posted on $Date.Long
						</p>


						<% if BlogHolder.ShowFullEntry %>
							$Content
							<% if $AudioClip %>
								<audio src="$AudioClip.Filename" controls="controls"></audio>
							<% end_if %>
						<% else %>
							<p>$Content.FirstParagraph(html)</p>
							<% if $AudioClip %>
								<audio src="$AudioClip.Filename" controls="controls"></audio>
							<% end_if %>
							<p class="blogVitals">
								<a href="$Link" class="readmore" title="Read Full Post">
									<% _t('BlogSummary_ss.READFULLPOST','Read the full post') %>
								</a>
							</p>
						<% end_if %>
					</div>
					<hr>

				<% end_loop %>
			<% end_if %>
		<% end_with %>

	</article>
</div>

<div class="large-3 columns content-right">
	<br>
	<% include BlogSideBar %>
</div>

