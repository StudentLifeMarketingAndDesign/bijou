<% if $UpcomingShows %>
    <% if $AreaName == "AfterContent" %>
        <section class="content-block__container " aria-labelledby="Block$ID">
            <div class="content-block row">
                <div class="column showsblock">
                    <h3 class="showsblock__title" id="Block$ID">Upcoming Shows</h3>
                    <ul class="showsblock__cards">
                        <% loop $UpcomingShows %>
                            <li class="">
                                <% include ShowCard %>
                            </li>
                        <% end_loop %>
                    </ul>
                </div>
            </div>
        </section>
    <% else_if $AreaName == "BeforeContent" %>
        <section class="content-block__container recentnews" aria-labelledby="Block$ID">
            <div class="content-block row">
                <div class="newsblock">
                    <div class="column">
                        <h3 class="newsblock-title text-center" id="Block$ID"><% if $Title && $ShowTitle %>$Title<% else %>Recent News<% end_if %></h3>
                    </div>

                    <ul class="medium-up-5 ">
                        <% loop $Entries %>
                            <li class="column column-block">
                                <% include ShowCard %>
                            </li>
                        <% end_loop %>
                    </ul>
                </div>
            </div>
        </section>
    <% else_if $AreaName == "SidebarArea" %>
        <section class="content-block__container" aria-labelledby="Block$ID">
            <div class="content-block row column">
                <div class="newsblock">
                    <h2 id="Block$ID" class="newsblock__header"><% if $Title && $ShowTitle %>$Title<% else %>Recent News<% end_if %></h2>

                    <ul>
                        <% loop $Entries %>
                            <% include ShowCard %>
                        <% end_loop %>
                    </ul>
                </div>
            </div>
        </section>
    <% else %>
        <section class="content-block__container" aria-labelledby="Block$ID">
            <div class="content-block row column">
                <div class="newsblock">
                    <h2 id="Block$ID" class="newsblock__header"><% if $Title && $ShowTitle %>$Title<% else %>Recent News<% end_if %></h2>
                    <% loop $Entries %>
                        <% include ShowCard %>
                    <% end_loop %>
                    <br>
                </div>
            </div>
        </section>
    <% end_if %>
<% end_if %>