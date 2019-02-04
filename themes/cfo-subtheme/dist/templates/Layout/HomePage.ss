
<div class="homepage__header">

    $Header("dark-header","overlay")

    <% if $HomePageHeroFeaturesMixed %>
        <div class="carousel" id="main-content__container">
            <% loop $HomePageHeroFeaturesMixed %>
                <div class="carousel-cell">
                    <% if $Image %>
                        <% with $Image %>
                        <div class="cell-bg" data-flickity-bg-lazyload="$FocusFill(1500,900).URL" <% if $FocusX || $FocusY %>style="background-position: $PercentageX% $PercentageY%;"<% end_if %>>
                        <% end_with %>
                            <div class="inner">
                                <div class="cell-text">
                                    <span>Featured Page</span>
                                    <h2>$Title</h2>
                                    <% if $ExternalLink %>
                                        <a href="$ExternalLink" target="_blank" class="cell-btn">$ButtonText</a>
                                    <% else %>
                                        <a href="$AssociatedPage.Link" class="cell-btn">$ButtonText</a>
                                    <% end_if %>
                                </div>
                            </div>
                        </div>
                    <% else_if $TmdbBgURL %>


                        <div class="cell-bg" data-flickity-bg-lazyload="$TmdbBgURL" style="background-position: 50% 50%;">

                            <div class="inner">
                                <div class="cell-text">
                                    <span>Featured Page</span>
                                    <h2>$Title</h2>
                                    <% if $ExternalLink %>
                                        <a href="$ExternalLink" target="_blank" class="cell-btn">$ButtonText</a>
                                    <% else %>
                                        <a href="$AssociatedPage.Link" class="cell-btn">$ButtonText</a>
                                    <% end_if %>
                                </div>
                            </div>
                        </div>


                    <% else_if $Video %>
                        <div class="cell-bg">
                            <div class="fullwidth-video">
                                <video playsinline autoplay muted loop autoplay src="$Video.URL" id="vid-bg" class="ani-vid-fadein" style="opacity: 1;" <% if $VideoPoster %>poster="$VideoPoster.FocusFill(1500,900).URL"<% end_if %>></video>
                            </div>
                            <div class="inner">
                                <div class="cell-text">
                                    <span>Featured Page</span>
                                    <h2>$Title</h2>
                                    <% if $ExternalLink %>
                                        <a href="$ExternalLink" target="_blank" class="cell-btn">$ButtonText</a>
                                    <% else %>
                                        <a href="$AssociatedPage.Link" class="cell-btn">$ButtonText</a>
                                    <% end_if %>
                                </div>
                            </div>
                        </div>
                    <% else %>
                        <%-- if no image or video, fallback to a default image --%>
                        <% with $Image %>
                        <div class="cell-bg" data-flickity-bg-lazyload="division-project/src/images/cell-bg.jpg">
                        <% end_with %>
                            <div class="inner">
                                <div class="cell-text">
                                    <span>Featured Page</span>
                                    <h2>$Title</h2>
                                    <% if $ExternalLink %>
                                        <a href="$ExternalLink" target="_blank" class="cell-btn">$ButtonText</a>
                                    <% else %>
                                        <a href="$AssociatedPage.Link" class="cell-btn">$ButtonText</a>
                                    <% end_if %>
                                </div>
                            </div>
                        </div>

                    <% end_if %>
                </div>
            <% end_loop %>
        </div>
    <% end_if %>

    <% if $HomePageHeroFeaturesMixed && $HomePageHeroFeaturesMixed.Count > 1 %>
        <div class="carousel-nav" data-flickity='{ "asNavFor": ".carousel", "contain": true, "pageDots": false, "prevNextButtons": false, "autoPlay": true }'>
            <% loop $HomePageHeroFeaturesMixed %>
                <div class="carousel-nav-cell">
                    $Title
                </div>
            <% end_loop %>
        </div>
    <% end_if %>
</div>

<% include HomePageContent %>

<!-- Instagram Feed -->
<section class="instafeed" aria-labelledby="instagramid">
    <div class="row">
        <div class="columns">
<<<<<<< HEAD
            <h3 id="instagramid">Follow us on Instagram <a href="https://www.instagram.com/uistudentlife/">@uistudentlife</a></h3>
            <!-- LightWidget WIDGET --><script src="https://cdn.lightwidget.com/widgets/lightwidget.js"></script><iframe src="https://cdn.lightwidget.com/widgets/d42f1547dd2c56fb8ad082838075f620.html" scrolling="no" allowtransparency="true" class="lightwidget-widget" style="width:100%;border:0;overflow:hidden;"></iframe>
=======
            <h3 id="instagramid">Follow us on Instagram <a href="https://www.instagram.com/bijoufilm/">@bijoufilm</a></h3>
            <!-- LightWidget WIDGET --><script src="https://cdn.lightwidget.com/widgets/lightwidget.js"></script><iframe src="//lightwidget.com/widgets/c060e031b3005eb087f46126ea5ae2be.html" scrolling="no" allowtransparency="true" class="lightwidget-widget" style="width:100%;border:0;overflow:hidden;"></iframe>

>>>>>>> origin/2.0.x
        </div>
    </div>
</section>
