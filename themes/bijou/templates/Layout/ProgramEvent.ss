
<div class="<% if $Children || $Parent %>large-9 columns content-left<% else %>large-12<% end_if %> columns">
	<article>
		<h1>$Title <% if $Year %><span>($Year)</span><% end_if %></h1>

			<% if $Photo %>
				<div class="row">
					<div class="large-6 columns">
						<img src="$Photo.URL" alt="$Title" class="program-img">
					</div>
					<div class="large-6 columns">
						<% if $DateAndTime %><h4>$DateAndTime.format("F j, g:i A")</h4><% end_if %>

						$Content

						<ul class="side-nav">
							<% if $Director %><li><strong>Director</strong>: $Director</li><% end_if %>
							<% if $Runtime %><li><strong>Runtime</strong>: $Runtime min.</li><% end_if %>
							<% if $Rating %><li><strong>Rating</strong>: $Rating</li><% end_if %>
						</ul>

						<% if $Trailer %><p><a href="$Trailer" target="_blank" class="button radius tiny">Trailer</a></p><% end_if %>
					</div>
				</div>
			<% else %>

				<% if $DateAndTime %><h4>$DateAndTime.format("F j, g:i A")</h4><% end_if %>
				$Content
				<ul class="side-nav">
					<% if $Director %><li><strong>Director</strong>: $Director</li><% end_if %>
					<% if $Runtime %><li><strong>Runtime</strong>: $Runtime min.</li><% end_if %>
					<% if $Rating %><li><strong>Rating</strong>: $Rating</li><% end_if %>
				</ul>
				<% if $Trailer %><p><a href="$Trailer" target="_blank" class="button radius tiny">Trailer</a></p><% end_if %>

			<% end_if %>



	</article>
</div>
<% if $Children || $Parent %><%--Determine if Side Nav should be rendered, you can change this logic--%>
<div class="large-3 columns content-right">
	<% include SideNav %>
</div>
<% end_if %>