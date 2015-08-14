
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
                <p>Tune in to <a href="https://itunes.apple.com/us/podcast/bijou-banter/id924764855?mt=2" target="_blank">Bijou Banter Podcast (iTunes)</a>&nbsp;every Wednesday at 6 pm on KRUI!</p>
                <p>With&nbsp;<a style="line-height: 25.6000003814697px;" href="[sitetree_link,id=11]">Leah Vonderheide</a>,&nbsp;<a style="line-height: 25.6000003814697px;" href="[sitetree_link,id=12]">Katherine Steinbach</a>, and&nbsp;<a style="line-height: 25.6000003814697px;" href="[sitetree_link,id=23]">Chang-Min Yu</a></p>
            <% end_if %>

            <div class="content">$Content</div>

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

