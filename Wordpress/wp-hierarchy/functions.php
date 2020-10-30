<?php

//Add theme support
add_theme_support('title-tag');
add_theme_support('post-thumbnails');
add_theme_support('post_format', ['aside', 'gallery', 'link', 'images', 'quote', 'status', 'video', 'audio', 'chat']);
add_theme_support('html5');
add_theme_support('automatic-feed-links');
add_theme_support('custom-background');
add_theme_support('custom-logo');
add_theme_support('custom-header');
add_theme_support('customize-selective-refresh-widgets');
add_theme_support('starter-content'); //form demo

//Load CSS

function wphierarchy_enqueue_styles()
{
    //remove time() for production, only for dev (style is never cached because it changes all the time)
    wp_enqueue_style('main-css', get_stylesheet_directory_uri() . '/style.css', [], time());
}


add_action('wp_enqueue_scripts', 'wphierarchy_enqueue_styles');

//Register menu locations
register_nav_menus(
    array(
        'main-menu' => esc_html__('Main Menu','wphierarchy'),
        'footer-menu' => esc_html__('Footer Menu','wphierarchy'),
    )
);
