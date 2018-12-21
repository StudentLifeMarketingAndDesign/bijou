$Header


<main class="main-content__container" id="main-content__container">
    <!-- Background Image Feature -->
    <% if $BackgroundImage %>
        <% include FeaturedImage %>
    <% end_if %>

    $Breadcrumbs

    <% if not $BackgroundImage %>
        <div class="column row">
            <div class="main-content__header">
                <h1 class="page-title">
                    <% if $ArchiveYear %>
                        <%t Blog.Archive 'Archive' %>:
                        <% if $ArchiveDay %>
                            $ArchiveDate.Nice
                        <% else_if $ArchiveMonth %>
                            $ArchiveDate.format('F, Y')
                        <% else %>
                            $ArchiveDate.format('Y')
                        <% end_if %>
                    <% else_if $CurrentTag %>
                        <%t Blog.Tag 'Tag' %>: $CurrentTag.Title
                    <% else_if $CurrentCategory %>
                        <%t Blog.Category 'Category' %>: $CurrentCategory.Title
                    <% else %>
                        $Title
                    <% end_if %>
                </h1>
            </div>
        </div>
    <% end_if %>

    $BeforeContent

    <div class="row">
        <div role="main" class="main-content main-content--with-padding main-content--with-sidebar">
            $BeforeContentConstrained
            <div class="main-content__text">

                <h2>Upcoming dates</h2>
                <% loop $UpcomingDates %>
                <p>$Date.Nice</p>
                <ul>
                    <% loop $ShowsTransient %>
                        <li>$Title<br />
                            $Times
                        </li>

<%--                         <% loop $DateTimes($Up.Date) %>
                            $Me.Nice
                        <% end_loop %> --%>
                    <% end_loop %>
                </ul>

                <% end_loop %>

                <h2>Upcoming shows</h2>
                <% loop $UpcomingShows %>
                    <p>$Title</p>
                    <ul>
                    <% loop $Dates %>
                        <li>$Date.Nice - $Times</li>
                    <% end_loop %>
                    </ul>
                <% end_loop %>
                $Content

                <% if $Action == "index" %>
                    <% if $SortAlphabetically %>
                        <% loop $BlogPostsAlpha %>
                            <% include BlogCard %>
                        <% end_loop %>
                    <% else_if $PaginatedList.Exists %>
                        <% loop $PaginatedList %>
                            <% include BlogCard %>
                        <% end_loop %>
                    <% end_if %>
                <% else %>
                    <% loop $PaginatedList %>
                        <% include BlogCard %>
                    <% end_loop %>
                <% end_if %>
                $AfterContentConstrained

                $Form
                $CommentsForm

                <% with $PaginatedList %>
                    <% include Pagination %>
                <% end_with %>

            </div>
        </div>


        <aside class="sidebar dp-sticky">
            <% include PodcastWidget %>


            <% include SideNav %>
            <% if $SideBarView %>
                $SideBarView
            <% end_if %>
            $SidebarArea
        </aside>
    </div>

    $AfterContent

</main>
