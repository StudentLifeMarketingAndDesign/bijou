<div class="<% if $Children || $Parent %>large-9 columns<% else %>large-12<% end_if %> columns">
	<article>
		<h1>$Title</h1>
		$Content
		<% if $Titles %>
		<% loop $Titles %>
			<h2 class="">$Title Title</h2>
			<ul class="">
			<% loop $SortedProgramEvents %>
				<li>
				<% if $Photo %>
					<a href="$Link" class="">
						<img src="$Photo.CroppedImage(230,230).URL" alt="$FirstName $LastName" class="">
					</a>
				<% end_if %>
				<p class="">
					<a href="$Link">$Title</a>
					<% if $Position %><small class="">$Position</small><% end_if %>
				</p>
			</li>
			<% end_loop %>
			</ul>
		<% end_loop %>
		<% else %>
			<ul class="">
			<% loop $Children %>
				<li>
				<% if $Photo %>
					<a href="$Link" class="">
						<img src="$Photo.CroppedImage(230,230).URL" alt="$Title" class="">
					</a>
				<% end_if %>
				<p class="">
					<a href="$Link">$Title</a>
					<% if $Position %><small class="">$Position</small><% end_if %>
				</p>
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