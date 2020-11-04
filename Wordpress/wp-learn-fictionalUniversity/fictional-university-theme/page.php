<?php get_header();
while (have_posts()) {
  the_post();
?>

  <?php pageBanner(array(
    'subtitle' => 'My Subtitle',
    'title' => 'My Title'
  )); ?>

  <div class="container container--narrow page-section">

    <?php $parentId = wp_get_post_parent_id(get_the_ID()); ?>
    <?php if ($parentId) : ?>
      <div class="metabox metabox--position-up metabox--with-home-link">
        <p><a class="metabox__blog-home-link" href="<?php echo get_permalink($parentId); ?>"><i class="fa fa-home" aria-hidden="true"></i> Back to
            <?php echo get_the_title($parentId); ?></a> <span class="metabox__main">
            <?php the_title(); ?>
          </span></p>
      </div>
    <?php endif; ?>

    <!-- N'afficher que si la page est un parent ou un enfant. Il y a des pages qui ne sont ni enfants ni parents -->
    <?php
    $childrenPages = get_pages(array(
      'child_of' => get_the_ID()
    ));
    $isAParent = !empty($childrenPages);

    if ($parentId or $isAParent) : ?>
      <div class="page-links">
        <h2 class="page-links__title"><a href="<?php echo get_the_permalink($parentId) ?>"><?php echo get_the_title($parentId) ?></a></h2>
        <ul class="min-list">
          <?php
          // Si c'est une page enfant on affiche les enfants de son parent, si c'est une page parent on affiche les enfants de cette page 
          $childrenOf = $parentId;
          if (!$parentId)
            $childrenOf = get_the_ID();

          wp_list_pages(array(
            'title_li' => NULL,
            'child_of' =>  $childrenOf
          ))
          ?>
        </ul>
      </div>
    <?php endif; ?>

    <div class="generic-content">
      <?php echo the_content() ?>
    </div>

  </div>

<?php
}

get_footer();
?>