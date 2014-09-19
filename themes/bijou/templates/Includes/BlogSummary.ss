<div class="blogSummary">
	<h2 class="postTitle"><a href="$Link" title="<% _t('BlogSummary_ss.VIEWFULL', 'View full post titled -') %> '$Title'">$MenuTitle</a></h2>
	<p class="authorDate">
		<% if $StaffPage %>
			Posted by <a href="$StaffPage.Link">$StaffPage.Title</a> on $Date.Long
		<% else %>
			Posted<% if $Author %> by $Author<% end_if %> on $Date.Long
		<% end_if %>
	</p>
	<% if TagsCollection %>
		<p class="tags">
			<% _t('BlogSummary_ss.TAGS','Tags') %>:
			<% loop TagsCollection %>
				<a href="$Link" title="View all posts tagged '$Tag'" rel="tag">$Tag</a><% if not Last %>,<% end_if %>
			<% end_loop %>
		</p>
	<% end_if %>



	<% if BlogHolder.ShowFullEntry %>
		<% if $AudioClip %>
			<audio src="$AudioClip.Filename" controls="controls"></audio>
		<% end_if %>
		$Content
	<% else %>
		<p>$Content.FirstParagraph(html)</p>
		<% if $AudioClip %>
			<audio src="$AudioClip.Filename" controls="controls"></audio><br>
		<% end_if %>
		<p class="blogVitals">
			<% if $AudioClip %>
				<br>
				<a href="$Link" class="readmore" title="Listen to the podcast">
					Listen to the podcast
				</a>
			<% else %>
				<a href="$Link" class="readmore" title="Read Full Post">
					<% _t('BlogSummary_ss.READFULLPOST','Read the full post') %>
				</a>
			<% end_if %>
		</p>
	<% end_if %>
</div>
<hr>
