<div class="<% if $Children || $Parent %>large-9 columns content-left<% else %>large-12<% end_if %> columns">
	<article>
		<h1>$Title</h1>
		$Content
		<% if $Teams %>
		<% loop $Teams %>
			<hr>
			<h2 class="staff-title">$Title</h2>
			<ul class="staff-list small-block-grid-2 medium-block-grid-3 large-block-grid-4">
			<% loop $SortedStaffPages %>
				<% include StaffPageListItem %>
			<% end_loop %>
			</ul>
		<% end_loop %>
		<% else %>
			<ul class="staff-list small-block-grid-2 medium-block-grid-3 large-block-grid-4">
			<% loop $Children %>
				<% include StaffPageListItem %>
			<% end_loop %>
			</ul>
		<% end_if %>

	</article>
</div>
<% if $Children || $Parent %><%--Determine if Side Nav should be rendered, you can change this logic--%>
	<div class="large-3 columns content-right">
		<br>
		<% include SideNav %>
	</div>
<% end_if %>