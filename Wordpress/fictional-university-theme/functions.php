<?php

//Load CSS/JS files
function university_files()
{

    //Load font from googlefont
    wp_enqueue_style('font_google', '//fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i|Roboto:100,300,400,400i,700,700i');
    //Load font awesome from a CDN
    wp_enqueue_style('font_awesome', '//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');
    //Load CSS main theme file, using get_stylesheet_uri()
    wp_enqueue_style('university_main_styles', get_stylesheet_uri());
    //Load JS
    wp_enqueue_script('main-univeristy-javascript', get_theme_file_uri('/js/scripts-bundled.js'), NULL, '1.0', true);
}


//ALLOWS to use WP hooks  : add_action(hookName, function name to call)
add_action('wp_enqueue_scripts', 'university_files');


function university_features(){

    add_theme_support('title-tag');
}


add_action('after_setup_theme','university_features');