<div class="large-9 columns content-left">
	<article>
		<h1 class="postTitle">$Title</h1>

		<p class="authorDate">
			<% if $StaffPage %>
				Posted by <a href="$StaffPage.Link">$StaffPage.Title</a> on $Date.Long
			<% else %>
				Posted<% if $Author %> by $Author<% end_if %> on $Date.Long
			<% end_if %>
		</p>

		<% if TagsCollection %>
			<p class="tags">
				 <% _t('BlogEntry_ss.TAGS', 'Tags:') %>
				<% loop TagsCollection %>
					<a href="$Link" title="<% _t('BlogEntry_ss.VIEWALLPOSTTAGGED', 'View all posts tagged') %> '$Tag'" rel="tag">$Tag</a><% if not Last %>,<% end_if %>
				<% end_loop %>
			</p>
		<% end_if %>
		$Content
		<% if $AudioClip %>
			<audio src="$AudioClip.Filename" controls="controls"></audio>
		<% end_if %>
	</article>
</div>

<div class="large-3 columns content-right">
	<br>
	<% include BlogSideBar %>
</div>
