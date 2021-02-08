<% include Header %>

<main id="main-content" class="container-xl">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="blog__content">
                <div class="py-3">
                    <% if $AudioClip || $HasTag("podcast") || $HasTag("banter") %><p class="h4"><i class="fas fa-podcast"></i> Bijou Banter</p> <% end_if %>
                    <h1 class="display-3 pb-4">$Title</h1>
                    <% include SilverStripe\\Blog\\EntryMeta %>
                    <hr>
                </div>
                <% if $FeaturedImage %>
                    <img src="$FeaturedImage.ScaleMaxWidth(400).URL" class="img-thumbnail float-right mb-3 ml-3 mr-lg-n8 mr-xl-n9" alt="Title" />
                <% end_if %>

                <% if $Summary %>
                    <div class="lead">$Summary</div>
                <% end_if %>


                $Content
                <% if $AudioClip %>
                <div class="card" style="width: 18rem;">
                  <div class="card-body">
                    <h2 class="card-title h6"><i class="fas fa-podcast"></i> Listen to this episode:</h2>
                    <p class="card-text"><audio src="$AudioClip.URL" controls="controls" preload="none"></audio></p>
                    <a href="https://podcasts.apple.com/us/podcast/bijou-banter/id924764855" target="_blank" rel="noopener" class="btn btn-sm btn-primary"><small>Bijou Banter on Apple Podcasts&nbsp;<i class="fas fa-external-link-alt"></i></small></a>

                  </div>
                </div>


                <% end_if %>
                $Form
                $CommentsForm
            </div>
        </div>
    </div>
</main>

<!-- Previous/Next Links -->
<section class="bg-primary mt-4" style="margin-bottom: 100px;">
    <div class="container-xl">
        <% if $PreviousPage || $NextPage %>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="prev-next">

                        <div class="text-divider">
                            <span class="text-light">Read Next</span>
                        </div>

                        <ul class="prev-next__grid list-unstyled">
                            <li>
                                <% if PreviousPage %>
                                    <h4 class="prev-next__title">
                                        <a href="$PreviousPage.Link" class="text-light">$PreviousPage.Title</a>
                                    </h4>
                                    <p class="text-light">
                                        <small>
                                        <%t SilverStripe\\Blog\\Model\\Blog.Posted "Posted" %>
                                        $PreviousPage.PublishDate.format("MMMM d, y")
                                        </small>
                                    </p>
                                <% end_if %>
                            </li>
                            <li>
                                <% if NextPage %>
                                    <h4 class="prev-next__title">
                                        <a href="$NextPage.Link" class="text-light">$NextPage.Title</a>
                                    </h4>
                                    <p class="text-light">
                                        <small>
                                        <%t SilverStripe\\Blog\\Model\\Blog.Posted "Posted" %>
                                        $NextPage.PublishDate.format("MMMM d, y")
                                        </small>
                                    </p>
                                <% end_if %>
                            </li>
                        </ul>
                        <br>
                    </div>
                </div>
            </div>
        <% end_if %>
    </div>
</section>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-10">

            <h2>More on the Bijou Blog:</h2>
        </div>

    </div>

</div>

<% include BlogSection %>

