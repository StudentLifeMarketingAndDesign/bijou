<div class="<% if $Children || $Parent %>large-9 columns content-left<% else %>large-12<% end_if %> columns">
	<article>
			<h1>$Title</h1>
			<% if $Photo %>
					<img src="$Photo.CroppedFocusedImage(706,397).URL" alt="$FirstName $LastName" class="staffpage-img">
				<% else %>
					<img src="{$ThemeDir}/images/placeholder.gif" alt="$FirstName $LastName" class="staff-img">
			<% end_if %>
			<hr>
			<h3>$Position</h3>
			<% if $EmailAddress %><p>Email: <a href="mailto:$EmailAddress">$EmailAddress</a></p><% end_if %>
			$Content
	</article>
</div>
<% if $Children || $Parent %><%--Determine if Side Nav should be rendered, you can change this logic--%>
	<div class="large-3 columns content-right">
		<br>
		<% include SideNav %>
	</div>
<% end_if %>