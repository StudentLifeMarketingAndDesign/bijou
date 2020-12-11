<section>

    <div class="container-fluid">

        <div class="row">
            <div class="col-lg-6">



                <div class="card-list row">
                    <% loop $LatestPosts(9) %>
                        <div class="col-6 col-xl-4 px-0 card-list__item <% if $Last %>d-none d-xl-block<% end_if %>">
                            <% include BlogCard %>
                        </div>
                    <% end_loop %>
                </div>
                    <%-- <% include BlogCard %> --%>


            </div>

            <div class="col-lg-6 pt-5">

                <iframe src="https://embed.podcasts.apple.com/us/podcast/bijou-banter/id924764855?itsct=podcast_box&amp;itscg=30200&amp;theme=light" height="450px" frameborder="0" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation-by-user-activation" allow="autoplay *; encrypted-media *;" style="width: 100%; overflow: hidden; border-top-left-radius: 10px; border-top-right-radius: 10px; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px; background-color: transparent; background-position: initial initial; background-repeat: initial initial;"></iframe>
<%--
                <a href="#" class="mt-3 btn btn-lg btn-outline-primary d-block"><i class="fab fa-spotify" style="color: #1ed05d"></i> Bijou Banter is also available on Spotify</a> --%>

            </div>

        </div>

        <section class="py-5">
            <div class="container-xl">
                <div class="row">
                    <div class="col-lg-4">
                        <h2 class="display-5">Be a part of Bijou!</h2>



                    </div>

                    <div class="col-lg-8">


                        <p><a href="#" class="btn btn-lg btn-outline-primary mr-2">Apply to join Bijou</a><a href="#" class="btn btn-lg btn-outline-primary mr-2">Submit a blog post</a><a href="#" class="btn btn-lg btn-outline-primary mr-2">Submit a film for Bijou Open Screen</a></p>



                    </div>


                </div>

            </div>
        </section>

</section>
