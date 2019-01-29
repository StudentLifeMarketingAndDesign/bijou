$Header
<main class="main-content__container" id="main-content__container">

	<!-- Background Image Feature -->
	<% if $BackgroundImage %>
		<% include FeaturedImage %>
	<% end_if %>
	$Breadcrumbs
	<% if not $BackgroundImage %>
	<div class="column row">
		<div class="main-content__header">
			<h1>$Title</h1>
		</div>
	</div>
<% end_if %>

$BeforeContent

<div class="row">

	<article role="main" class="main-content main-content--with-padding <% if $SiteConfig.ShowExitButton %>main-content--with-exit-button-padding<% end_if %> <% if $Children || $Menu(2) || $SidebarArea.Elements ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
		$BeforeContentConstrained
		<% if $MainImage %>
			<img class="main-content__main-img" src="$MainImage.ScaleMaxWidth(500).URL" alt="" role="presentation"/>
		<% end_if %>
		<div class="main-content__text">
			$Content
		</div>
		$AfterContentConstrained
		$Form

		
				<%-- $Header --%>
    <div class="grid-container">
        <div class="main-content__text">
           

               <%--  <h2 class="show-list__date-header">$Date.Format("E, MMM d")</h2> --%>
                <div class="show-list grid-x grid-margin-x medium-up-2 large-up-3">
                   <% loop ShowPages %>
                        <a href="$Link" class="cell show-list__show">
                            <% if $Poster %>
                                <img class="show-list__show-img" src="$Poster.FocusFill(267, 400).URL" alt="$Title poster image" role="presentation" />
                            <% end_if %>
                            <div class="show-list__content">
                                <div class="show-list__content-inner">
                                    <p class="show-list__show-header">
                                        <strong>$Title</strong>
                                    </p>
                                    <p class="show-list__time-list">
                                        <% loop $TimesFormatted %>
                                            <time class="show-list__time">$TimeFormatted</time>
                                        <% end_loop %>
                                    </p>
                                </div>
                                <div class="show-list__moreinfo">More Info</div>
                            </div>
                        </a>
                    <% end_loop %>
                </div><br />
               <% if $Thanks %>
               		<p class="thanks">
               			$Thanks
               		</p>
               <% end_if %> 
               <ul class="accordion" data-allow-all-closed="true" data-accordion>
				  <li class="accordion-item" data-accordion-item>
				    <!-- Accordion tab title -->
				    <a href="#" class="accordion-title">Have a movie suggestion? Let us know!</a>

				    	<div class="accordion-content" data-tab-content>
			      			$SuggestionForm
			      
			    </div>
			  </li>
  
			</ul>
           					

        </div>
    </div>


		
		<% if $ShowChildPages %>
			<% include ChildPages %>
		<% end_if %>
	</article>
	<aside class="sidebar dp-sticky">
		<% include SideNav %>
		<% if $SideBarView %>
			$SideBarView
		<% end_if %>
		$SidebarArea
	</aside>
</div>
$AfterContent

</main>
