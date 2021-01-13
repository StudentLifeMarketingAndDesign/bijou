<% include Header %>

<main class="container my-5" id="content">
    <article id="content" class="pb-5">
        <div class="row justify-content-center">

            <div class="col-lg-8">
                    <h1>$Title</h1>
                    $Content

            </div>


        </div>
    </article>
    <div class="row justify-content-center">
        <div class="col-lg-8 py-5">
            <% loop $UpcomingShows %>
                <% include ShowCardPoster %>
            <% end_loop %>
        </div>
    </div>


    $Form
    $CommentsForm

    <% if $paginatedPreviousShows %>
        <h2>Previously presented by Bijou Film Board:</h2>
            <div class="card-list row">
            <% loop $paginatedPreviousShows %>
                <div class="col-6 col-lg-2 px-0">
                    <% include ShowCardPosterSmall %>
                </div>
            <% end_loop %>
        </div>
    <% end_if %>
    <div class="row justify-content-center">
        <div class="col-lg-4 my-5">
             <% with $paginatedPreviousShows %>
                <% include SilverStripe\\Blog\\Pagination %>
            <% end_with %>
        </div>
    </div>

</main>
