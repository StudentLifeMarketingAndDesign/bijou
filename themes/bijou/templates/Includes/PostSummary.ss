<div class="post-summary clearfix">
	<h2>
		<a href="$Link" title="<%t Blog.ReadMoreAbout "Read more about '{title}'..." title=$Title %>">
			<% if $MenuTitle %>$MenuTitle
			<% else %>$Title<% end_if %>
		</a>
	</h2>

	<% if $FeaturedImage %>
		<p class="post-image">
			<a href="$Link">
				<img src="$FeaturedImage.setWidth(200).URL" alt="$Title" class="right">
			</a>
		</p>
	<% end_if %>

	<% if $Summary %>
		<p>$Summary
	<% else %>
		<p>$Excerpt
	<% end_if %>
		</p>
		<% if $AudioClip %>
			<audio src="$AudioClip.Filename" controls="controls"></audio>
		<% end_if %>
	<% include EntryMeta %>
</div>
