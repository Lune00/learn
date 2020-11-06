<?php get_header(); ?>

<!-- points to the id of the current post -->
<?php the_ID(); ?>

<?php while (have_posts()) : the_post(); ?>

    <div class="page-banner">
        <div class="page-banner__bg-image" style="background-image: url(<?php echo get_theme_file_uri('/images/ocean.jpg') ?>);"></div>
        <div class="page-banner__content container container--narrow">
            <h1 class="page-banner__title"><?php echo the_title() ?></h1>
            <div class="page-banner__intro">
                <p>TODO : REPLACE ME LATER</p>
            </div>
        </div>
    </div>

    <p>Powered by single-program.php</p>

    <div class="container container--narrow page-section">
        <div class="metabox metabox--position-up metabox--with-home-link">
            <p><a class="metabox__blog-home-link" href="<?php echo get_post_type_archive_link('program') ?>"><i class="fa fa-home" aria-hidden="true"></i> All programs</a>
        </div>
        <div class="generic-content"><?php the_content(); ?></div>


        <!-- Custom query to fetch related events (many-to-many relationship) -->
        <?php
        $today = date('Ymd');
        $upcomingEvents = new WP_Query(array(
            'posts_per_page' => -1,
            'post_type' => 'event',
            'orderby' => 'meta_value_num',
            'meta_key' => 'event_date',
            'order' => 'ASC',
            'meta_query' => array(
                array(
                    'key' => 'event_date',
                    'compare' => '>=',
                    'value' => $today,
                    'type' => 'numeric'
                ),
                array(
                    'key' => 'related_programs',
                    'compare' => 'LIKE',
                    'value' => '"' . get_the_ID() . '"'
                )
            )
        ));
        ?>


        <hr class="section-break">
        <h2 class="headline headline--medium">Upcoming Events</h2>


        <?php if ($upcomingEvents) : ?>
            <?php while ($upcomingEvents->have_posts()) : $upcomingEvents->the_post(); ?>



                <?php the_ID(); ?>
                <?php get_template_part('template-parts/content', get_post_type()) ?>
        <?php endwhile;
        endif; ?>

        <!-- points to the id of the current post which is the last event id -->
        <?php the_ID(); ?>

        <?php wp_reset_postdata();  ?>

        <!-- points to the id of the current post, wp_reset_postdata() make the $post global object points to the main query (based on the slug) -->
        <?php the_ID(); ?>

        <!-- Custom query to fetch associated professors -->
        <?php
        $relatedProfessors = new WP_Query(array(
            'posts_per_page' => -1,
            'post_type' => 'professor',
            'orderyby' => 'title',
            'order' => 'ASC',
            'meta_query' => array(
                array(
                    'key' => 'related_programs',
                    'compare' => 'LIKE',
                    'value' => '"' . get_the_ID() . '"'
                )
            )
        ));
        ?>

        <hr class="section-break">
        <h2 class="headline headline--medium">Related Professors</h2>
        <ul class="professor-cards">
            <?php if ($relatedProfessors) : while ($relatedProfessors->have_posts()) : $relatedProfessors->the_post(); ?>
                    <li class='professor-card__list-item'>
                        <a class='professor-card' href="<?php the_permalink(); ?>">

                        <img class='professor-card__image' src="<?php the_post_thumbnail_url('professorLandscape');?>" alt="">
                        <span class='prefessor-card__name'><?php the_title(); ?></span>
                        </a>
                    </li>
            <?php endwhile;
            endif; ?>
        </ul>

        <?php wp_reset_postdata(); ?>



    </div>

<?php endwhile;
get_footer(); ?>