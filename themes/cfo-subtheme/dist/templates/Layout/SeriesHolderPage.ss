<style>
    <% loop Children %>

    .series-{$URLSegment}{


          background:
            linear-gradient(
              rgba({$AccentRgb}, 0.2),
              rgba({$AccentLightRgb}, 0.75)
            ),

            /* bottom, image */
            url($NextUpcomingBackgroundURL);

        }






    <% end_loop %>
</style>


$Header
<main class="main-content__container" id="main-content__container">

    $Breadcrumbs


        <div class="column row">
            <div class="main-content__header">
                <h1>$Title</h1>

            </div>
        </div>

    <div class="row">
        <div class="grid-container">
          <div class="grid-x grid-margin-x grid-padding-x grid-padding-y">

                <% loop $Children %>
                <div class="cell large-12">
                    <div style="position:relative;">
                        <a href="$Link" class=" series series-{$URLSegment}">
                            <span><h2>$Title</h2><br><p class="subtitle">$Subtitle</p></span>


                        </a>

                    </div>
                </div>

               <% end_loop %>

            </div>



        <%-- <article role="main" class="main-content main-content--with-padding main-content--with-sidebar">
                $BeforeContent

            $BeforeContentConstrained
            <div class="main-content__text">

                <div class="content">




                    $Content

                </div>
                $AfterContentConstrained
            </div>
            $Form
        </article> --%>

    </div>
    $AfterContent
</main>

