<div class="row gray collapse social-blog">

	<div class="large-7 large-push-5 columns">
		<div class="row">
			<% with Page("bijou-blog") %>
				<% loop $Entries('2') %>
					<div class="large-6 columns">
						<div class="blogsnippit">
							<h5 class="intro">From the Blog</h5>
							<h3 class="title"><a href="$Link">$Title</a></h3>
							<p>$Content.LimitCharacters(180)</p>
							<a href="$Link" class="anchor">read more</a>
						</div>
					</div>
				<% end_loop %>
			<% end_with %>
		</div>
	</div>
	<div class="large-5 large-pull-7 columns white">
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4&appId=142327899218761";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
		<div class="fb-page" data-href="https://www.facebook.com/bijoufilm" data-width="500px" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="false" data-show-posts="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/bijoufilm"><a href="https://www.facebook.com/bijoufilm">Bijou Film Board</a></blockquote></div></div>
	</div>



</div>