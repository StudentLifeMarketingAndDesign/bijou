<% include Header %>
<% if not $PaginatedList.NotFirstPage %>
<div class="container-fluid">
    <div class="row">
        <% loop $PaginatedList.Limit(2) %>
            <div class="col-lg-6 p-2 card-list__item">
                <% include BlogCardLarge %>
            </div>
        <% end_loop %>
    </div>
</div>

<main class="container my-5" id="content">
    <article id="content" class="">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <h1>$Title</h1>
                $Content
            </div>
        </div>
    </article>
</main>
<% end_if %>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <% if $PaginatedList.Exists %>
                <div class="card-list row">
                    <% loop $PaginatedList %>
                        <div class="col-6 col-lg-4 p-2 card-list__item">
                            <% include BlogCard %>
                        </div>
                    <% end_loop %>
                </div>
            <% else %>
                <p><%t SilverStripe\\Blog\\Model\\Blog.NoPosts 'There are no posts' %></p>
            <% end_if %>


            $Form
            $CommentsForm

        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-lg-4 my-5">
            <% with $PaginatedList %>
                <% include SilverStripe\\Blog\\Pagination %>
            <% end_with %>
        </div>
    </div>
</div>
