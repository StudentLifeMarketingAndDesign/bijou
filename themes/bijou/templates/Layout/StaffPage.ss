<div class="<% if $Children || $Parent %>large-9 columns<% else %>large-12<% end_if %> columns">
	<article>
			<h1>$Title</h1>
			<% if $Photo %>
					<img src="$Photo.CroppedImage(706,530).URL" alt="$FirstName $LastName">
				<% else %>
					<img src="{$ThemeDir}/images/placeholder.gif" alt="$FirstName $LastName" class="staff-img">
			<% end_if %>

			<h3>$Position</h3>
			<% if $EmailAddress %><p>Email: <a href="mailto:$EmailAddress">$EmailAddress</a></p><% end_if %>
			$Content
	</article>
</div>
<% if $Children || $Parent %><%--Determine if Side Nav should be rendered, you can change this logic--%>
<div class="large-3 columns">
	<div class="panel">
		<% include SideNav %>
	</div>
</div>
<% end_if %>