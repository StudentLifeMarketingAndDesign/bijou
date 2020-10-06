<!-- Instagram Feed -->
<% if not $HideInstaFeed %>
<section class="instafeed" aria-labelledby="instagramid">
    <div class="row">
        <div class="columns">
            <h3 id="instagramid">Follow us on Instagram <a href="https://www.instagram.com/bijoufilm/">@bijoufilm</a></h3>
            <!-- SnapWidget -->
<iframe src="https://snapwidget.com/embed/878696" class="snapwidget-widget" allowtransparency="true" frameborder="0" scrolling="no" style="border:none; overflow:hidden;  width:1220px; height:610px"></iframe>

        </div>
    </div>
</section>

    <% if $ClassName != "HomePage" %>
    <section class="content-block__container " aria-labelledby="Block$ID">
        <div class="content-block row">
            <div class="column showsblock">
                <h3 class="showsblock__title" id="Block$ID">Upcoming Shows</h3>
                <ul class="showsblock__cards">
                    <% loop $AllUpcomingShows %>
                        <li class="">
                            <% include ShowCard %>
                        </li>
                    <% end_loop %>
                </ul>
            </div>
        </div>
    </section>
    <% end_if %>
<% end_if %>
