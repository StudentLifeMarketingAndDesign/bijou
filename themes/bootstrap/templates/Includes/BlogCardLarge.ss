<a href="$Link" class="card-list__link card-list__link--large" style="background-image: url('{$FeaturedImage.FocusFill(690,440).URL}')">
    <%-- <img class="card-list__img" src="$FeaturedImage.FocusFill(640,400).URL"> --%>
    <% if $FeaturedImage %>
        <div class="card-list__overlay"></div>
        <div class="card-list__text card-list__text--large">
    <% else %>
        <div class="card-list__overlay card-list__overlay--always-visible"></div>
        <div class="card-list__text card-list__text--large card-list__text--always-visible">
    <% end_if %>
        <% if $AudioClip || $HasTag("banter") || $HasTag("podcast") %>
            <p class="card-list__byline mb-1"><small><i class="fas fa-podcast"></i> Bijou Banter</small></p>
        <% end_if %>
    <h2 class="card-list__header card-list__header--large">$Title</h2>

        <% if $Credits %>
        <p class="card-list__byline"><% loop $Credits %><% if not $First && not $Last %>, <% end_if %><% if not $First && $Last %> <%t Blog.AND "and" %> <% end_if %>$Name.XML<% end_loop %></p>
        <% end_if %>

        <p class="card-list__date">Posted on $PublishDate.Format("MMMM d, y")</p>
    </div>

</a>
