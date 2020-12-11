<% include Header %>

<main class="container my-5" id="content">
    <div class="row">
        <div class="col-lg-12">
            <h1>$Title</h1>
            <br>
            $Content





            <% if $PaginatedList.Exists %>
                <div class="card-list row">
                    <% loop $PaginatedList %>
                        <div class="col-6 col-lg-4 px-0 card-list__item">
                            <% include BlogCard %>
                        </div>
                    <% end_loop %>
                </div>
            <% else %>
                <p><%t SilverStripe\\Blog\\Model\\Blog.NoPosts 'There are no posts' %></p>
            <% end_if %>


            $Form
            $CommentsForm

            <% with $PaginatedList %>
                <% include SilverStripe\\Blog\\Pagination %>
            <% end_with %>
        </div>
    </div>
</main>
