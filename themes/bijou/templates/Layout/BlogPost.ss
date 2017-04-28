<div class="large-9 columns content-left">
	<article>

		<h1>$Title</h1>
		<% include EntryMeta %>

		<% if $FeaturedImage %>
			<p class="post-image">$FeaturedImage.CroppedFocusedImage(855,450)</p>
		<% end_if %>

		<% if $AudioClip %>
			<div class="audioclip">
				<audio src="$AudioClip.Filename" controls="controls"></audio>
			</div>
		<% end_if %>

		<div class="content">$Content</div>

		<br>
		<br>

	</article>
</div>
<div class="large-3 columns content-right">
	<br>
	<% include BlogSideBar %>
</div>
