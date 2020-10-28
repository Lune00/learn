<?php

function university_post_types()
{
    register_post_type('event', array(
        'show_in_rest' => true,
        'public' => true,
        'has_archive' => true,
        'supports' => array(
            'title', 'editor','excerpt'
        ),
        'rewrite' => array('slug' => 'events'),
        'labels' => array(
            'name' => 'Events',
            'add_new_item' => 'Add new Event',
            'edit_item' => 'Edit Event',
            'all_items' => 'All Events',
            'singular_name' => 'Event   '
        ),
        'menu_icon' => 'dashicons-calendar-alt'
    ));
}
add_action('init', 'university_post_types');