<!-- Instagram Feed -->
<% if not $HideInstaFeed %>
<section class="instafeed" aria-labelledby="instagramid">
    <div class="row">
        <div class="columns">
            <h3 id="instagramid">Follow us on Instagram <a href="https://www.instagram.com/bijoufilm/">@bijoufilm</a></h3>
            <!-- LightWidget WIDGET --><script src="https://cdn.lightwidget.com/widgets/lightwidget.js"></script><iframe src="//lightwidget.com/widgets/9567d08477a659f5bd2fac386a9c858d.html" scrolling="no" allowtransparency="true" class="lightwidget-widget" style="width:100%;border:0;overflow:hidden;"></iframe>

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
