<div class="<% if $Children || $Parent %>large-9 columns<% else %>large-12<% end_if %> columns">
	<article>
		<h1>$Title</h1>
		$Content
		<% if $Titles %>
		<% loop $Titles %>
			<br>
			<h1>$Title</h1>
			<p>$Description</p>
			<ul class="program-events">
			<% loop $SortedProgramEvents %>
				<li class="clearfix <% if $Photo %>photo<% end_if %>">
				<% if $Photo %><img src="$Photo.CroppedImage(200,200).URL" alt="$Title" class="program-img"><% end_if %>
				<div class="program-content">
					<h4 class="title">$Title <% if $Year %><span>($Year)</span><% end_if %></h4>
					<% if $DateAndTime %>
						<p>$DateAndTime.format("F j, g:i A") <br>
						<% if $Runtime %><strong>runtime</strong>: $Runtime min. &nbsp;|&nbsp; <% end_if %>
						<% if $Rating %><strong>rating</strong>: $Rating &nbsp;|&nbsp; <% end_if %>
						<% if $Director %><strong>director</strong>: $Director<% end_if %>
						</p>
					<% end_if %>
					$Content
					<% if $Trailer %><p><a href="$Trailer" target="_blank" class="button radius tiny">Trailer</a></p><% end_if %>
				</div>
			</li>
			<% end_loop %>
			</ul>
		<% end_loop %>
		<% else %>
			<ul class="">
			<% loop $Children %>
				<li class="clearfix <% if $Photo %>photo<% end_if %>">
				<% if $Photo %>
					<a href="$Link" class="">
						<img src="$Photo.CroppedImage(200,200).URL" alt="$Title" class="program-img">
					</a>
				<% end_if %>
				<div class="program-content">
					<h4 class="title">$Title <% if $Year %><span>($Year)</span><% end_if %></h4>
					<% if $DateAndTime %>
						<p>$DateAndTime.format("F j, g:i A") <br>
						<% if $Runtime %><strong>runtime</strong>: $Runtime min. &nbsp;|&nbsp; <% end_if %>
						<% if $Rating %><strong>rating</strong>: $Rating &nbsp;|&nbsp; <% end_if %>
						<% if $Director %><strong>director</strong>: $Director<% end_if %>
						</p>
					<% end_if %>
					$Content
					<% if $Trailer %><p><a href="$Trailer" target="_blank" class="button radius tiny">Trailer</a></p><% end_if %>
				</div>
			</li>
			<% end_loop %>
			</ul>
		<% end_if %>

	</article>
</div>
<% if $Children || $Parent %><%--Determine if Side Nav should be rendered, you can change this logic--%>
<div class="large-3 columns">
	<div class="panel">
		<% include SideNav %>
	</div>
</div>
<% end_if %>