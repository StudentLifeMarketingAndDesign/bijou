<div class="post-summary clearfix">
	<h2>
		<a href="$Link">
			<% if $MenuTitle %>$MenuTitle
			<% else %>$Title<% end_if %>
		</a>
	</h2>

	<% if $FeaturedImage %>
		<p class="post-image">
			<a href="$Link">
				<img src="$FeaturedImage.setWidth(350).URL" alt="$Title" class="right">
			</a>
		</p>
	<% end_if %>
		$Content.FirstParagraph(html)
		<p>	<a href="$Link">
				Continue reading....
			</a>
		</p>
		<h4>Audio:</h4>
		<% if $AudioClip %>
			<audio src="$AudioClip.Filename" controls="controls" preload="none"></audio>
		<% end_if %>
	<% include EntryMeta %>
</div>
