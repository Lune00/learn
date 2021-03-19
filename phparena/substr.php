<?php 

$value = " AND (((cdf_posts.post_title LIKE '{63cfe751272e7376e802bec8e09e4b3c8a13bb971a634c7344de9452d0254b6d}a{63cfe751272e7376e802bec8e09e4b3c8a13bb971a634c7344de9452d0254b6d}') OR (cdf_posts.post_excerpt LIKE '{63cfe751272e7376e802bec8e09e4b3c8a13bb971a634c7344de9452d0254b6d}a{63cfe751272e7376e802bec8e09e4b3c8a13bb971a634c7344de9452d0254b6d}') OR (cdf_posts.post_content LIKE '{63cfe751272e7376e802bec8e09e4b3c8a13bb971a634c7344de9452d0254b6d}a{63cfe751272e7376e802bec8e09e4b3c8a13bb971a634c7344de9452d0254b6d}')))  AND ( 
  ( cdf_postmeta.meta_key = 'membership_community' AND cdf_postmeta.meta_value LIKE '{63cfe751272e7376e802bec8e09e4b3c8a13bb971a634c7344de9452d0254b6d}a{63cfe751272e7376e802bec8e09e4b3c8a13bb971a634c7344de9452d0254b6d}' )
) AND cdf_posts.post_type = 'membership' AND (cdf_posts.post_status = 'publish' OR cdf_posts.post_status = 'acf-disabled' OR cdf_posts.post_status = 'future' OR cdf_posts.post_status = 'draft' OR cdf_posts.post_status = 'pending' OR cdf_posts.post_status = 'private')";


$position = strpos($value, 'membership_community');
//Substr jusqu a membership_community
$sub = substr($value, 0, $position);
//Substr a partir de membership community
$sub2 = substr($value, $position );
//Cherche la position de AND
$positionAND = strripos($sub, 'AND');


$position_last_opening = strripos($sub,'))');
$position_closing_meta_group = strpos($sub2, ')') +  $position;

//Replace AND par OR
$new_value = substr_replace($value, 'OR ', $positionAND , 3 );
$new_value = substr_replace($new_value, ' ', $position_last_opening, 2);
$new_value = substr_replace($new_value, '))', $position_closing_meta_group, 2);

// echo $sub;
// echo $positionAND;


echo "\n";
echo $sub2;
echo "\n";
echo 'to remove = ', $position_last_opening;
echo "\n";
echo 'to add = ', $position_closing_meta_group;
echo "\n";
echo $value;
echo "\n";
echo $new_value;