<?php get_header() ?>

<div class="page-banner">
    <div class="page-banner__bg-image" style="background-image: url(<?php echo get_theme_file_uri('/images/ocean.jpg') ?>);"></div>
    <div class="page-banner__content container container--narrow">
        <h1 class="page-banner__title"><?php echo the_title() ?></h1>
        <div class="page-banner__intro">
            <p>TODO : REPLACE ME LATER</p>
        </div>
    </div>
</div>
<p>Powered by single-event.php</p>
<div class="container container--narrow page-section">
    <div class="metabox metabox--position-up metabox--with-home-link">
        <p><a class="metabox__blog-home-link" href="<?php echo get_post_type_archive_link('event'); ?>"><i class="fa fa-home" aria-hidden="true"></i> Events Home</a> <span class="metabox__main">
                <?php the_title(); ?>
            </span></p>
    </div>
    <div class="generic-content"><?php the_content(); ?></div>

    <?php
    $relatedPrograms = get_field('related_programs');
    // print_r($relatedPrograms);
    ?>

    <!-- Print related programs to the event if they exit -->
    <?php if ($relatedPrograms) : ?>   
        <hr class="section-break">
        <h2 class="headline headline--medium">Related Programs</h2>
        <ul class="link-list min-list">
            <?php foreach ($relatedPrograms as $relatedProgram) : ?>
                <li><a href="<?php echo get_the_permalink($relatedProgram) ?>"><?php echo get_the_title($relatedProgram) ?></a></li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>

</div>



<?php get_footer() ?>