<% include Header %>
 <section class="bg-dark text-white py-3 py-sm-6">
    <div class="container-xl">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="col-lg-10">
                $Content
            </div>

        </div>
    </div>
</section>

<% if $UpcomingShows %>
    <div class="row justify-content-center">
        <div class="col-lg-8 pt-3">
            <h2>Currently Showing:</h2>
            <% loop $UpcomingShows %>
                <% include ShowCardPoster %>
            <% end_loop %>
        </div>
    </div>
<% end_if %>

<div class="container-xl">
    <div class="row">
        <div class="col-lg-9">
            <h2 class="my-3">Recent Posts:</h2>
        </div>
    </div>
</div>

<% include BlogSection %>

<section class="bg-dark py-5 text-light">
    <div class="container-xl">
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
        <h2 class="text-center display-3 mb-5">Meet Our Members</h2>
        <div class="stafflist">
            <ul class="stafflist__list list-unstyled">
                <% loop RandomStaffMembers(8) %>
                    <% include StaffPageListItem %>
                <% end_loop %>
            </ul>
            <p class="text-center">
            <a href="about/" class="btn btn-outline-primary text-center">View all members</a>
            </p>
        </div>
    </div>
</section>

<% include InstaFeed %>
