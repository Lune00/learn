<?php

//Load CSS/JS files
function university_files(){
    //Load CSS main theme file, using get_stylesheet_uri()
    wp_enqueue_style('university_main_styles',get_stylesheet_uri());
}


//ALLOWS to use WP hooks  : add_action(hookName, function name to call)
add_action('wp_enqueue_scripts','university_files');