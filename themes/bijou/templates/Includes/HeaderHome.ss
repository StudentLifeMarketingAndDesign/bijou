<header class="header" role="banner">
	<div class="row collapse">
		<div class="large-4 columns">
			<div class="logo-quicklinks">
				<a href="{$baseUrl}">
					<img src="{$ThemeDir}/images/bijou_logo.png" alt="$SiteConfig.Title">
				</a>
				<% if HomePageQuicklinks %>
				<ul class="home-quicklinks">
					<% loop HomePageQuicklinks %>
						<li>
							<a href="$AssociatedPage.Link">
								<h4 class="quicklinks-title">$Title <span>$SubTitle</span></h4>
							</a>
						</li>
					<% end_loop %>
				</ul>
				<% end_if %>
			</div>
		</div>
		<div class="large-8 columns">
			<ul class="main-nav nav-collapse">
				<% loop Menu(1) %>
				<li class="<% if $LinkingMode == "current" || $LinkingMode == "section" %>active<% end_if %><% if $Children %> has-dropdown<% end_if %>">
					<a href="$Link" title="Go to $Title.ATT">$MenuTitle</a>
					<!--<% if $Children %>
					<ul class="dropdown">
						<li><label>$MenuTitle</label></li>
						<% loop $Children %>
						<li class="<% if $LinkingMode == "current" || $LinkingMode == "section" %>active<% end_if %><% if $Children %> has-dropdown<% end_if %>">
							<a href="$Link" title="Go to $Title.ATT">$MenuTitle</a>
							<% if $Children %>
							<ul class="dropdown">
								<% loop $Children %>
								<li class="<% if $LinkingMode == "current" || $LinkingMode == "section" %>active<% end_if %>"><a href="$Link" title="Go to $Title.ATT">$MenuTitle</a></li>
								<% end_loop %>
							</ul>
							<% end_if %>
						</li>
						<% end_loop %>
						<li><a href="$Link">See all &rarr;</a></li>
					</ul>
					<% end_if %>-->
				</li>
				<% end_loop %>
			</ul>

			<ul class="home-orbit" data-orbit data-options="
				animation:slide;
				animation_speed:1000;
				pause_on_hover:true;
				navigation_arrows:true;
				bullets:false;
				timer:false;">
				<% loop CarouselImages.Limit(3) %>
					<li>
						<% if $YouTubeEmbed %>
							$YouTubeEmbed
						<% else %>
							<a href="$AssociatedPage.Link">
								<img src="$Image.CroppedImage(644,390).URL" alt="$Title">
							</a>
						<% end_if %>
						<div class="orbit-caption">
							$Title
						</div>
					</li>
				<% end_loop %>
			</ul>
		</div>
	</div>
</header>