

	<div class="large-12 columns">
		<!-- $Content -->
		<!-- $Form -->
		<div class="our-programs">
			<h4 class="subtitle">Our Programs</h4>
			<div class="row">
				<div class="medium-6 large-3 columns">
					<h5><a href="#">Bijou After Hours</a></h5>
					<p>Maecenas sed diam eget risus varius blandit sit amet non magna. Donec ullamcorper nulla non metus auctor fringilla.</p>
				</div>
				<div class="medium-6 large-3 columns">
					<h5><a href="#">Bijou After Hours</a></h5>
					<p>Maecenas sed diam eget risus varius blandit sit amet non magna. Donec ullamcorper nulla non metus auctor fringilla.</p>
				</div>
				<div class="medium-6 large-3 columns">
					<h5><a href="#">Bijou After Hours</a></h5>
					<p>Maecenas sed diam eget risus varius blandit sit amet non magna. Donec ullamcorper nulla non metus auctor fringilla.</p>
				</div>
				<div class="medium-6 large-3 columns">
					<h5><a href="#">Bijou After Hours</a></h5>
					<p>Maecenas sed diam eget risus varius blandit sit amet non magna. Donec ullamcorper nulla non metus auctor fringilla.</p>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row collapse">
	<div class="large-12 columns">
		<div class="mission-statement">
			The Bijou Film Board is a non-profit, student-run organization dedicated to the exhibition of American indementent, foreigh and classic cinema. Established in 1972, the Bijou has built a reputation as one of the preeminent student-run cinemas in the nation and has since partnered with FilmScene to assist with the programming and operation of the downtown cinema.
		</div>
	</div>
</div>

<div class="row board-list">
	<div class="large-12 columns">
		<h4 class="subtitle">Our Board Members</h4>
		<a href="#" class="text-center">View all board members</a>
		<br>
		<ul class="small-block-grid-2 medium-block-grid-3 large-block-grid-5">
			<% with $Page(about-us) %>
				<% loop $Children.Limit(5) %>
					<% include StaffPageListItem %>
				<% end_loop %>
			<% end_with %>
		</ul>
	</div>

</div>
