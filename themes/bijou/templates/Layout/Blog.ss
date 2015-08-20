
<div class="large-9 columns content-left">
    <div id="BlogContent" class="blogcontent">

        <article>
            <h1>
                <% if $ArchiveYear %>
                    <%t Blog.Archive "Archive" %>:
                    <% if $ArchiveDay %>
                        $ArchiveDate.Nice
                    <% else_if $ArchiveMonth %>
                        $ArchiveDate.format("F, Y")
                    <% else %>
                        $ArchiveDate.format("Y")
                    <% end_if %>
                <% else_if $CurrentTag %>
                    <%t Blog.Tag "Tag" %>: $CurrentTag.Title
                <% else_if $CurrentCategory %>
                    <%t Blog.Category "Category" %>: $CurrentCategory.Title
                <% else %>
                    $Title
                <% end_if %>
            </h1>

            <% if $CurrentTag.Title == "podcast" %>
                <div class="content">$Content</div>
            <% end_if %>


            <% if $PaginatedList.Exists %>
                <% loop $PaginatedList %>
                    <% include PostSummary %>
                <% end_loop %>
            <% else %>
                <p><%t Blog.NoPosts "There are no posts" %></p>
            <% end_if %>
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

