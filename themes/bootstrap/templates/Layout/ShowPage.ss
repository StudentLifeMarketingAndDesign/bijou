<% include Header %>

    <% if $TmdbBgURL %>
        <div class="show-featured" style="background-image: url('$TmdbBgURL');">

        </div>
    <% else_if $FeaturedImage %>
       <div class="show-featured" style="background-image: url('$FeaturedImage.FocusFill(600,400).URL');">

        </div>
    <% end_if %>
<main id="main-content" class="container-xl">



    <div class="row justify-content-center">
        <div class="col-lg-9">
            <div class="blog__content pt-5">
                <div class="">
                    <% if $SeriesPages %>
                        <p class="h4">
                        <% loop $SeriesPages %>
                            <% if $Image %><img src="$Image.ScaleWidth(100).URL" width="50" alt="" role="presentation" /><% end_if %>$Title
                        <% end_loop %>
                        </p>
                    <% end_if %>

                    <h1 class="display-3">$Title</h1>
                </div>
                <% if $Poster %>
                    <img src="$Poster.URL" alt="$Title poster image" class="img-thumbnail w-50 d-block float-right mb-3 ml-5 mr-lg-n8 mr-xl-n9" />
                <% else_if $TmdbPosterURL %>
                    <img src="$TmdbPosterURL" alt="$Title poster image"class="img-thumbnail w-50 d-block float-right mb-3 ml-5 mr-lg-n8 mr-xl-n9" />
                <% end_if %>
                <% if $Summary %>
                    <div class="lead">$Summary</div>
                <% end_if %>

                $Content
                <% if $FilmSummary %>
                    <hr />
                    $FilmSummary
                <% end_if %>
                <% if $Ongoing %><p>Date: <strong>Ongoing</strong><% end_if %></p>
                <% if $Dates %>
                    <div class="my-5">
                        <% if $FilmTitle %>
                            <h2>Showtimes for $FilmTitle:</h2>
                        <% else %>
                            <h2>Time(s):</h2>
                        <% end_if %>
                        <div class="show-list">
                            <% loop $Dates %>
                                <p class="show-list__date"><strong>$Date.Format("EEEE, MMMM d, y")</strong></p>
                                <div class="show-list__time-list">
                                    <% loop $TimesFormatted %>
                                        <time class="show-list__time">$TimeFormatted</time>
                                    <% end_loop %>
                                </div>
                            <% end_loop %>
                        </div>
                    </div>
                <% end_if %>
                <div class="list-group my-3">
                    <% if $FilmSceneLink %>
                      <a href="$FilmSceneLink" class="list-group-item list-group-item-action" target="_blank" rel="noopener">
                        View on ICFilmScene
                      </a>
                    <% end_if %>
                    <% if $FacebookEventLink %>
                        <a href="$FacebookEventLink" class="list-group-item list-group-item-action" target="_blank" rel="noopener">View Event on Facebook</a>
                    <% end_if %>
                    <% if $TicketsLink %>
                        <a href="$TicketsLink" class="list-group-item list-group-item-action" target="_blank" rel="noopener">
                            Buy Tickets
                        </a>
                    <% end_if %>
                    <% if $TrailerVideoID %>
                        <a href="https://www.youtube.com/watch?v={$TrailerVideoID}" class="list-group-item list-group-item-action" target="_blank" rel="noopener">
                            View Trailer
                        </a>
                    <% end_if %>
                </div>

                $Form
                $CommentsForm
            </div>
        </div>
    </div>
</main>

<!-- Previous/Next Links -->
<section class="bg-primary mt-4" style="margin-bottom: 100px;">
    <div class="container-xl">
        <% if $PreviousPage || $NextPage %>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="prev-next">

                        <div class="text-divider">
                            <span class="text-light">Previously Presented</span>
                        </div>

                        <ul class="prev-next__grid list-unstyled">
                            <li>
                                <% if PreviousPage %>
                                    <h4 class="prev-next__title">
                                        <a href="$PreviousPage.Link" class="text-light">$PreviousPage.Title</a>
                                    </h4>
                                    <p class="text-light">
                                        <small>
                                        <%t SilverStripe\\Blog\\Model\\Blog.Posted "Posted" %>
                                        $PreviousPage.PublishDate.format("MMMM d, y")
                                        </small>
                                    </p>
                                <% end_if %>
                            </li>
                            <li>
                                <% if NextPage %>
                                    <h4 class="prev-next__title">
                                        <a href="$NextPage.Link" class="text-light">$NextPage.Title</a>
                                    </h4>
                                    <p class="text-light">
                                        <small>
                                        <%t SilverStripe\\Blog\\Model\\Blog.Posted "Posted" %>
                                        $NextPage.PublishDate.format("MMMM d, y")
                                        </small>
                                    </p>
                                <% end_if %>
                            </li>
                        </ul>
                        <br>
                    </div>
                </div>
            </div>
        <% end_if %>
    </div>
</section>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">

            <h2>From the blog:</h2>
        </div>

    </div>

</div>

<% include BlogSection %>
<% include InstaFeed %>
