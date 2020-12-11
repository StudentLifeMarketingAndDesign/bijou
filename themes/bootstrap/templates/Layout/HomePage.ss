<% include Header %>
    <section class="bg-dark text-white py-3 py-sm-6">
    <div class="container-xl">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="col-lg-10">
                <h2 class="hero-header">Making Thoughtful Cinema Accessible To All Students.</h2>
               <p class="lead">
                   $Content
               </p>
               <p><a href="calendar/" class="btn btn-outline-light btn-large">See our calendar</a> <a href="join/" class="btn btn-outline-light btn-large">Join Bijou</a> <a href="about/" class="btn btn-outline-light btn-large">Learn about Bijou</a></p>

            </div>

        </div>
    </div>
</section>



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

    </div>

</section>

<section class="bg-dark py-5 text-light">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12 text-center">

                <h2>Bijou Series:</h2>

            </div>
        </div>
        <div class="row justify-content-center">
            <% loop $Series %>
                <div class="col-lg-6">
                    <div class="row my-md-5">
                        <div class="col-3 committee-image">

                            <% if $Image %>
                            <img src="$Image.URL" class="w-100 d-block" style="border-radius: 300px" alt="" role="presentation">
                            <% end_if %>

                        </div>
                        <div class="col-9">
                            <h3 class="$URLSegment">$Title</h3>
                            $Content.Summary
                            <p><a href="$Link" class="">Learn more about {$Title}...</a></p>
                        </div>
                    </div>
                </div>
<%--                 <div class="col-lg-1">
                    <a href="$Link" class="d-block"><img src="$Image.URL" class="w-100 d-block" style="border-radius: 300px" alt="$Title"></a>
                </div> --%>
            <% end_loop %>
        </div>
    </div>
</section>



<%-- <main id="content" class="my-3 mb-5">
    <div class="container-xl">
        <% if $Calendar.EventList %>
            <hr class="my-5" />
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <% with $Calendar %>
                        <h2>Up next:</h2>
                        <% loop $EventList %>
                            <% include ShowCard %>
                        <% end_loop %>
                        <p class="text-center">
                            <a href="calendar/" class="btn btn-outline-primary text-center">View Calendar</a>
                        </p>
                    <% end_with %>
                </div>
            </div>
        <% end_if %>
    </div>
</main>
 --%>



<section class="py-5">
    <div class="container-xl">
        <h2 class="text-center display-3 mb-5">Meet Our Directors</h2>
        <div class="stafflist">
            <ul class="stafflist__list list-unstyled">
                <% loop RandomStaffMembers(8) %>
                    <% include StaffPageListItem %>
                <% end_loop %>
            </ul>
            <p class="text-center">
            <a href="about/" class="btn btn-outline-primary text-center">View all Directors</a>
            </p>
        </div>
    </div>
</section>

<% include InstaFeed %>
