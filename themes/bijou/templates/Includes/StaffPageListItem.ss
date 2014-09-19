<li>
	<% if $Photo %>
		<a href="$Link" class="staff-link">
			<img src="$Photo.CroppedFocusedImage(230,230).URL" alt="$FirstName $LastName" class="staff-img">
		</a>
	<% else %>
		<a href="$Link" class="staff-link">
			<img src="{$ThemeDir}/images/placeholder.gif" alt="$FirstName $LastName" class="staff-img">
		</a>
	<% end_if %>
	<p class="staff-name">
		<a href="$Link">$FirstName $LastName</a>
		<% if $Position %><small class="staff-position">$Position</small><% end_if %>
	</p>
</li>