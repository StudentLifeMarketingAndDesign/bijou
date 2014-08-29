<div class="row" id="content" >
	<div class="medium-7 large-8 columns">
		<div id="header-bg-image" style="background-image: url('$Image.URL');"></div>
		<h2>$Title</h2>
		$Content
		<hr />
		<p><% if $FacebookEventLink %><a href="{$ParsedFacebookEventLink}" class="facebook button" target="_blank">Facebook Event</a><% end_if %> <a href="{$LocalistLink}" target="_blank" class="button">View on events.uiowa.edu</a></p>
	</div>
	<div class="medium-5 large-4 columns">
		<div class="event-details">
			<% include LocalistEventVenueInfo %>
			<% include LocalistEventDate %>	
		</div>
	</div>
</div>

