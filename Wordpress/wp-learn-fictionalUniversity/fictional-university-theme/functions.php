<?php

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
        wp_enqueue_script('our-vendorrs-js', get_theme_file_uri('/bundled-assets/vendors~scripts.8c97d901916ad616a264.js'), NULL, '1.0', true);
        wp_enqueue_script('main-university.js', get_theme_file_uri('/bundled-assets/scripts.bc49dbb23afb98cfc0f7.js'), NULL, '1.0', true);
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
}


add_action('after_setup_theme', 'university_features');

