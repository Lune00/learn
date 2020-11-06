<?php get_header(); ?>

<div class="page-banner">
    <div class="page-banner__bg-image" style="background-image: url(<?php echo get_theme_file_uri('/images/ocean.jpg') ?>);"></div>
    <div class="page-banner__content container container--narrow">
        <h1 class="page-banner__title">Past events</h1>
        <div class="page-banner__intro">
            <p>See what you might have missed</p>
        </div>
    </div>
</div>

<p>Page powered by page-test-events.php</p>

<div class="container container--narrow page-section">

    <?php
    $today = date('Ymd');
    $pastEvents = new WP_Query(array(
        'paged' => get_query_var('paged', 1), //for pagination with custom query (a revoir)
        'post_type' => 'event',
        'orderby' => 'meta_value_num',
        'meta_key' => 'event_date',
        'order' => 'DESC',
        'meta_query' => array(
            array(
                'key' => 'event_date',
                'compare' => '<',
                'value' => $today,
                'type' => 'numeric'
            )
        )
    ));
    ?>


    <?php
    while ($pastEvents->have_posts()) {
        $pastEvents->the_post();
    ?>

        <?php get_template_part('template-parts/content', get_post_type()) ?>

    <?php }

    echo paginate_links(array(
        'total' => $pastEvents->max_num_pages
    ));

    ?>


</div>



<?php get_footer(); ?>