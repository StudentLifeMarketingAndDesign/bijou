<a href="$Link" class="card-list__link card-list__link--small" style="background-image: url('{$FeaturedImage.FocusFill(690,440).URL}')">
    <%-- <img class="card-list__img" src="$FeaturedImage.FocusFill(640,400).URL"> --%>
    <% if $FeaturedImage %>
        <div class="card-list__overlay"></div>
        <div class="card-list__text">
    <% else %>
        <div class="card-list__overlay card-list__overlay--always-visible"></div>
        <div class="card-list__text card-list__text--always-visible">
    <% end_if %>
    <h2 class="card-list__header">$Title</h2>
        <% if $Credits %>
        <p class="card-list__byline"><% loop $Credits %><% if not $First && not $Last %>, <% end_if %><% if not $First && $Last %> <%t Blog.AND "and" %> <% end_if %>$Name.XML<% end_loop %></p>
        <% end_if %>
        <% if $AudioClip %>
            <p class="card-list__byline"><small><i class="fas fa-podcast"></i> Bijou Banter Episode</small></p>
        <% end_if %>

    </div>

</a>
