<% include Header %>

    <% if $TmdbBgURL %>
        <div class="show-featured" style="background-image: url('$TmdbBgURL');">
<%--             <% if $TrailerVideoID %>
                <a class="popup-youtube show-trailer" href="https://www.youtube.com/watch?v={$TrailerVideoID}">
                    <svg class="css-18vwi2-playButton" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40" width="40" height="40"><title>Play Trailer</title><g opacity=".53"><circle cx="20" cy="20" r="19.5" fill="#4a4a4a"></circle><path d="M20 1c10.5 0 19 8.5 19 19s-8.5 19-19 19S1 30.5 1 20 9.5 1 20 1m0-1C9 0 0 9 0 20s9 20 20 20 20-9 20-20S31 0 20 0z" fill="#fff"></path></g><path fill="#fff" d="M29.6 21.1l-14.1-9.3v18.6z"></path></svg>
                </a>
            <% end_if %> --%>
        </div>
    <% else_if $FeaturedImage %>
       <div class="show-featured" style="background-image: url('$FeaturedImage.FocusFill(600,400).URL');">
<%--             <% if $TrailerVideoID %>
                <a class="popup-youtube show-trailer" href="https://www.youtube.com/watch?v={$TrailerVideoID}">
                    <svg class="css-18vwi2-playButton" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40" width="40" height="40"><title>Play Trailer</title><g opacity=".53"><circle cx="20" cy="20" r="19.5" fill="#4a4a4a"></circle><path d="M20 1c10.5 0 19 8.5 19 19s-8.5 19-19 19S1 30.5 1 20 9.5 1 20 1m0-1C9 0 0 9 0 20s9 20 20 20 20-9 20-20S31 0 20 0z" fill="#fff"></path></g><path fill="#fff" d="M29.6 21.1l-14.1-9.3v18.6z"></path></svg>
                </a>
            <% end_if %> --%>
        </div>
    <% end_if %>
<main id="main-content" class="container-xl">



    <div class="row justify-content-center">
        <div class="col-lg-9">
            <div class="blog__content pt-5">
                <div class="">
                    <h1 class="display-3">$Title</h1>
                </div>
                <% if $Poster %>
                    <img src="$Poster.URL" alt="$Title poster image"class="img-thumbnail w-50 d-block float-right mb-3 ml-5 mr-lg-n8 mr-xl-n9" />
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
                <% if $Ongoing %><p>Date: <strong>Streaming</strong><% end_if %></p>
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
                        View on Film Scene
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
                            <span class="text-light">Read Next</span>
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
