<a href="$Link" class="card-list__link card-list__link--small" style="background-image: url('{$BackgroundImageURL}')">
    <%-- <img class="card-list__img" src="$FeaturedImage.FocusFill(640,400).URL"> --%>
    <% if $BackgroundImageURL %>
        <div class="card-list__overlay"></div>
        <div class="card-list__text">
    <% else %>
        <div class="card-list__overlay card-list__overlay--always-visible"></div>
        <div class="card-list__text card-list__text--always-visible">
    <% end_if %>

    <% if $AudioClip %>
        <p class="card-list__byline mb-1"><small><i class="fas fa-podcast"></i> Bijou Banter</small></p>
    <% end_if %>
    <h2 class="card-list__header">$Title</h2>



    </div>

</a>
