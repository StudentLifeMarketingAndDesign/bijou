<div class="large-9 columns content-left">
    <div id="BlogContent" class="blogcontent">
        <article>

            <% include MemberDetails %>

            <% if $PaginatedList.Exists %>
                <p>Posts by $CurrentProfile.FirstName $CurrentProfile.Surname for $Title:</p>
                <% loop $PaginatedList %>
                    <% include PostSummary %>
                <% end_loop %>
            <% end_if %>

            $Form
            $CommentsForm

        </article>

        <% with $PaginatedList %>
        <% include Pagination %>
        <% end_with %>


    </div>
</div>

<div class="large-3 columns content-right">
    <br>
    <% include BlogSideBar %>
</div>