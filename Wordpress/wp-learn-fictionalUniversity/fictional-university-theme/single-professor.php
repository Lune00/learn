<?php get_header() ?>

<?php pageBanner(); ?>

<?php while (have_posts()) : the_post(); ?>

<p>Powered by single-professor.php</p>
<div class="container container--narrow page-section">

    <div class="generic-content">
        <div class="row group">
            <div class="one-third">
                <?php the_post_thumbnail('professorPortrait'); ?>
            </div>
            <div class="two-third">
                <?php the_content(); ?>
            </div>
        </div>
    </div>

    <?php
    $relatedPrograms = get_field('related_programs');
    // print_r($relatedPrograms);
    ?>

    <!-- Print related programs to the event if they exit -->
    <?php if ($relatedPrograms) : ?>
        <hr class="section-break">
        <h2 class="headline headline--medium">Subject(s) thaught</h2>
        <ul class="link-list min-list">
            <?php foreach ($relatedPrograms as $relatedProgram) : ?>
                <li><a href="<?php echo get_the_permalink($relatedProgram) ?>"><?php echo get_the_title($relatedProgram) ?></a></li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>

</div>



<?php endwhile;
get_footer(); ?>