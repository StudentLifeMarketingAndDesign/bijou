<div class="<% if $Children || $Parent %>large-9 columns<% else %>large-12<% end_if %> columns">
      <article>
            <h2>$Title</h2>
            $Content
            <% if $Teams %>
            <% loop $Teams %>
                  <h2 class="staff-title">$Title</h2>
                  <ul class="staff-list">
                  <% loop $SortedStaffPages %>
                        <% include StaffPageListItem %>
                  <% end_loop %>
                        <li class="filler"></li>
                        <li class="filler"></li>
                  </ul>
            <% end_loop %>
            <% else %>
                  <ul class="staff-list">
                  <% loop $Children %>
                        <% include StaffPageListItem %>
                  <% end_loop %>
                        <li class="filler"></li>
                        <li class="filler"></li>
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