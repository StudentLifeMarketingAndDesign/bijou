
<div class="<% if $Children || $Parent %>large-9 columns content-left<% else %>large-12<% end_if %> columns">
	<article class="article">
		<h1>$Title</h1>
		$Content
		$Form
	</article>
</div>
<% if $Children || $Parent %><%--Determine if Side Nav should be rendered, you can change this logic--%>
<div class="large-3 columns content-right">
	<br>
	<% include SideNav %>
</div>
<% end_if %>