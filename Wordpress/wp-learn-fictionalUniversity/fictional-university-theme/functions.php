<?php


//Default page banner : si rien n'est donné
function pageBanner($args = NULL)
{

    if (!$args['title']) {
        $args['title'] = get_the_title(); // post title
    }

    if (!$args['subtitle']) {
        $args['subtitle'] = get_field('page_banner_subtitle'); //post subtitle
    }

    if (!$args['photo'] AND !is_archive() AND !is_home()) {
        if (get_field('page_banner_image')) {
            $args['photo'] = get_field('page_banner_image')['sizes']['pageBanner']; //post image
        } else {

            $args['photo'] = get_theme_file_uri('/images/ocean.jpg'); //defaut image
        }
    }

?>

    <div class="page-banner">
        <div class="page-banner__bg-image" style="background-image: url(<?php

                                                                        echo $args['photo'];
                                                                        ?>);"></div>
        <div class="page-banner__content container container--narrow">
            <h1 class="page-banner__title"><?php echo $args['title'] ?></h1>
            <div class="page-banner__intro">
                <?php echo  $args['subtitle'] ?>
            </div>
        </div>
    </div>
<?php
}




//Load CSS/JS files
function university_files()
{
    //Load font from googlefont
    wp_enqueue_style('font_google', '//fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i|Roboto:100,300,400,400i,700,700i');
    //Load font awesome from a CDN
    wp_enqueue_style('font_awesome', '//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');

    //Load CSS main theme file, using get_stylesheet_uri()
    //wp_enqueue_style('university_main_styles', get_stylesheet_uri());

    if (strstr($_SERVER['SERVER_NAME'], 'fictional-university.test')) {
        //JS & CSS are loaded from a localhost webserver (running with node with : npm run devFast)
        wp_enqueue_script('main-univeristy-javascript', 'http://localhost:3000/bundled.js', NULL, '1.0', true);
    } else {
        wp_enqueue_script('our-vendorrs-js', get_theme_file_uri('/bundled-assets/vendors~scripts.64e2c292d6fcbaf95af9.js'), NULL, '1.0', true);
        wp_enqueue_script('main-university.js', get_theme_file_uri('/bundled-assets/scripts.45ea6ed2b68bad1e9efb.js'), NULL, '1.0', true);
        wp_enqueue_style('our-main-style', get_theme_file_uri('bundled-assets/styles.bc49dbb23afb98cfc0f7.css'));
    }
}

//ALLOWS to use WP hooks  : add_action(hookName, function name to call)
add_action('wp_enqueue_scripts', 'university_files');

function university_features()
{
    //Dynamic wordpress menus :
    //                  (nom pour instancier menu, nom pour associer le menu dans le dashboard)  
    // register_nav_menu('header-menu-location', 'Header Menu Location2');
    // register_nav_menu('footer-menu-location-learn', 'Footer Menu Location Learn');
    // register_nav_menu('footer-menu-location-explore', 'Footer Menu Location Explore');
    add_theme_support('title-tag');
    add_theme_support('post-thumbnails');
    add_image_size('professorLandscape', 605, 300, true);
    add_image_size('professorPortrait', 480, 650, true);
    add_image_size('pageBanner', 1500, 350, true);
}


add_action('after_setup_theme', 'university_features');


function university_adjust_queries($query)
{
    //Dot not affect admin dashboard queries, only if the query is for a post_type archive of type 'event', query is  default query (based on the url)
    if (!is_admin() and is_post_type_archive('event') and $query->is_main_query()) {

        $today = date('Ymd');
        $query->set('posts_per_page', -1);
        $query->set('post_type', 'event');
        $query->set('orderby', 'meta_value_num');
        $query->set('meta_key', 'event_date');
        $query->set('order', 'ASC');
        $query->set('meta_query', array(
            array(
                'key' => 'event_date',
                'compare' => '>=',
                'value' => $today,
                'type' => 'numeric'
            )
        ));
    }

    if (!is_admin() and is_post_type_archive('program') and $query->is_main_query()) {
        $query->set('posts_per_page', -1);
        $query->set('orderby', 'title');
        $query->set('order', 'ASC');
    }
}



//Creation d'un form avec un select multiple avec des données de type program personalisé
add_action('pre_get_posts', 'university_adjust_queries');


//Forms

add_filter('gform_pre_render_1', 'populate_form_with_programs_availables');
function populate_form_with_programs_availables($form)
{
    //Id du form pour ajouter un event (voir dans le dashboard)
    $programChoicesFieldId = 19;

    foreach ($form['fields'] as $field) {

        if ($field->id == $programChoicesFieldId) {

            // print_r($field);
            $programs = new WP_Query(array(
                'posts_per_page' => -1,
                'post_type' => 'program',
                'orderby' => 'title',
                'order' => 'ASC'
            ));

            $choices = array();

            foreach ($programs->posts as $post) {
                $choices[] = array(
                    'text' => $post->post_title,
                    'value' => $post->ID,
                    'isSelected' => false
                );
            }
        }
    }

    $field->choices = $choices;

    return $form;
}

//On met un filtre sur le form ID=1 et le field ID=19 (selection des programs) [Comment mieux viser le field sans code en dur son ID??]
add_filter('gform_after_create_post_1', 'set_event_content', 10, 3);

function set_event_content($post_id, $entry, $form)
{

  // Checkboxes field id. Change this value to your field id number.
  $field_id = 19;
 
  // Get field object.
  $field = GFAPI::get_field( $form, $field_id );

  if ( $field->type == 'checkbox' ) {
      // Get a comma separated list of checkboxes checked
      $checked = $field->get_value_export( $entry );

      // Convert to array.
      $values = explode( ', ', $checked );

    //var_dump($values);

      update_post_meta( $post_id, 'related_programs', $values );
  }
}
