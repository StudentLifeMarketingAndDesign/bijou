

	<div class="large-12 columns">
		<!-- $Content -->
		<!-- $Form -->
		<div class="our-programs">
			<h4 class="subtitle">Our Programs</h4>
			<% with Page(our-programs) %>
				<div class="row">
					<% loop $Titles %>
						<div class="medium-6 large-3 columns">
							<h5><a href="{$baseUrl}our-programs">$Title</a> </h5>
							<p>$DescriptionShort</p>
						</div>
					<% end_loop %>
				</div>
			<% end_with %>
		</div>
	</div>
</div>

<div class="row collapse">
	<div class="large-12 columns">
		<div class="mission-statement">
			$Content
		</div>
	</div>
</div>

<div class="row board-list">
	<div class="large-12 columns">
		<h4 class="subtitle">Our Board Members</h4>
		<a href="{$baseUrl}about-us/" class="text-center"><small>View all board members</small></a>
		<br>
		<ul class="small-block-grid-2 medium-block-grid-3 large-block-grid-5">
			<% loop RandomStaffMembers(5) %>
				<li>
					<% if $Photo %>
						<a href="$Link" class="staff-link">
							<img src="$Photo.CroppedFocusedImage(230,230).URL" alt="$FirstName $LastName" class="staff-img">
						</a>
					<% else %>
						<a href="$Link" class="staff-link">
							<img src="{$ThemeDir}/images/placeholder.gif" alt="$FirstName $LastName" class="staff-img">
						</a>
					<% end_if %>
					<p class="staff-name">
						<a href="$Link">$FirstName $LastName</a>
					</p>
				</li>
			<% end_loop %>
		</ul>
	</div>

</div>
