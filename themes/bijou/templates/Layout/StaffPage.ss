<div class="<% if $Children || $Parent %>large-9 columns<% else %>large-12<% end_if %> columns">
      <article>
                  <h1>$Title</h1>
                  <% if $Photo %>
                        <img src="$Photo.URL" alt="$FirstName $LastName">
                  <% end_if %>
                  <h2>$Position</h2>
                  <ul>
                        <% if $EmailAddress %><li>Email: <a href="mailto:$EmailAddress">$EmailAddress</a></li><% end_if %>
                        <% if $Phone %><li>Phone: $Phone</li><% end_if %>
                        <% if $DepartmentName %>
                              <li>
                                    <% if $DepartmentURL %>
                                          <a href="$DepartmentURL">$DepartmentName</a>
                                    <% else %>
                                          $DepartmentName
                                    <% end_if %>
                              </li>
                        <% end_if %>
                  </ul>
                  
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