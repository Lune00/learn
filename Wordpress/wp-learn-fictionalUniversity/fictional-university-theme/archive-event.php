<?php get_header(); ?>

<?php pageBanner(array(
    'title' => 'All Events',
    'subtitle' => 'See what is going on'
)); ?>

<p>Powered by archive-event.php</p>

<div class="container container--narrow page-section">



    <?php
    while (have_posts()) {
        the_post(); ?>
         <?php get_template_part('template-parts/content', get_post_type()) ?>
    <?php }

    echo paginate_links();

    ?>

    <hr class="section-break">

    <p>Looking for a recap of past events. <a href="<?php echo site_url('/past-events') ?>">Checkout out our past events archive</a></p>


</div>


<?php
gravity_form(1, $display_title = true, $display_description = true, $display_inactive = false, $field_values = null, $ajax = false, $tabindex, $echo = true);
?>




<?php get_footer(); ?>