<?php get_header(); ?>

<?php pageBanner(array(
    'title' => get_the_archive_title(),
    'subtitle' => get_the_archive_description()
)) ?>

<p>Powered by archive.php</p>

<div class="container container--narrow page-section">

    <?php
    while (have_posts()) {
        the_post(); ?>


        <div class="post-item">
            <h2 class="headline headline--medium headline--post-title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
        </div>

        <div class="metabox">
            <p>Posted by <?php the_author_posts_link() ?> on <?php the_time('d/m/Y h:m') ?> in <?php echo get_the_category_list(', '); ?></p>
        </div>

        <div class="generic-content">
            <?php the_excerpt(); ?>
            <p><a class="btn btn--blue" href="<?php echo the_permalink(); ?>">Continue reading &raquo;</a></p>
        </div>


    <?php }

    echo paginate_links();

    ?>


</div>



<?php get_footer(); ?>