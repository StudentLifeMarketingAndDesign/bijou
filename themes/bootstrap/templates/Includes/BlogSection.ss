<section>

    <div class="container-fluid">

        <div class="row justify-content-center my-5">
            <div class="col-lg-12">



                <div class="card-list row">
                    <% loop $LatestPosts(9) %>
                        <div class="col-6 col-xl-4 p-2 card-list__item <% if $Last %>d-none d-xl-block<% end_if %>">
                            <% include BlogCard %>
                        </div>
                    <% end_loop %>
                </div>
                    <%-- <% include BlogCard %> --%>


            </div>
        </div>

        <div class="row justify-content-center my-5">
            <div class="col-lg-4 pt-5">
                 <h2 class="display-5">Be a part of Bijou!</h2>
                    <div class="list-group my-3">

                      <a href="#" class="list-group-item list-group-item-action" target="_blank" rel="noopener">
                        Apply to join Bijou
                      </a>


                        <a href="#" class="list-group-item list-group-item-action" target="_blank" rel="noopener">Submit a blog post</a>


                        <a href="#" class="list-group-item list-group-item-action" target="_blank" rel="noopener">
                            Submit a film for Bijou Open Screen
                        </a>


                </div>


            </div>
            <div class="col-lg-5">

                <iframe src="https://embed.podcasts.apple.com/us/podcast/bijou-banter/id924764855?itsct=podcast_box&amp;itscg=30200&amp;theme=light" height="450px" frameborder="0" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation-by-user-activation" allow="autoplay *; encrypted-media *;" style="width: 100%; overflow: hidden; border-top-left-radius: 10px; border-top-right-radius: 10px; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"></iframe>
<%--
                <a href="#" class="mt-3 btn btn-lg btn-outline-primary d-block"><i class="fab fa-spotify" style="color: #1ed05d"></i> Bijou Banter is also available on Spotify</a> --%>

            </div>

        </div>
    </div>
</section>
