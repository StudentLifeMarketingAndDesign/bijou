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

        <article role="main" class="main-content main-content--with-padding main-content--full-width">


            $BeforeContentConstrained

            <div class="main-content__text">
                $Content
                <div class="stafflist">
                <% if $Teams %>
                    <% loop $Teams %>

                        <% if $Title != "Alumni" %>
                        <h2 class="stafflist__title">$Title</h2>
                        <ul class="stafflist__list no-bullet row small-up-1 medium-up-2 large-up-3">
                        <% if $Up.SortLastName %>
                            <% loop $ActiveStaffPages.Sort(LastName, ASC) %>
                                <% include StaffPageListItem %>
                            <% end_loop %>
                        <% else %>
                            <% loop $ActiveStaffPages %>
                                <% include StaffPageListItem %>
                            <% end_loop %>
                        <% end_if %>
                        </ul>
                        <% end_if %>

                    <% end_loop %>
                <% else %><%-- end if teams --%>
                    <ul class="stafflist__list no-bullet row small-up-1 medium-up-2 large-up-3">
                        <% loop $Children %>
                            <% include StaffPageListItem %>
                        <% end_loop %>
                    </ul>
                <% end_if %>
                </div><%-- end stafflist --%>
            </div>
            $AfterContentConstrained
            $Form
        </article>
    </div>

    $AfterContent

</main>
