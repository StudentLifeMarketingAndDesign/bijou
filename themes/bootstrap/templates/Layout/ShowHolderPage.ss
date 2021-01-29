<% include Header %>
<div class="container-xl">

</div>
<main class="my-5" id="content">

    <div class="container">
        <article id="content" class="pb-5">

            <div class="row justify-content-center">

                <div class="col-lg-8">
                    <h1>$Title</h1>
                        $Content

                </div>


            </div>

        </article>
    </div>
    <% if $CalendarEmbedCode %>
        <div class="container-fluid">
            <div class="row">
                <div class="pt-5 col-lg-12">
                    <h2>Current Calendar</h2>
                    $CalendarEmbedCode.RAW
                </div>
            </div>
        </div>
    <% end_if %>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 py-5">
                <% loop $UpcomingShows %>
                    <% include ShowCardPoster %>
                <% end_loop %>
            </div>
        </div>
    </div>


    $Form
    $CommentsForm


    <% if $paginatedPreviousShows %>
        <div class="container-fluid">
            <h2>Previously presented by the Bijou Film Board:</h2>
            <div class="card-list row">
                <% loop $paginatedPreviousShows %>
                    <div class="col-6 col-lg-2 px-0">
                        <% include ShowCardPosterSmall %>
                    </div>
                <% end_loop %>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-4 my-5">
                     <% with $paginatedPreviousShows %>
                        <% include SilverStripe\\Blog\\Pagination %>
                    <% end_with %>
                </div>
            </div>
        </div>
    <% end_if %>
</main>
<% include InstaFeed %>
