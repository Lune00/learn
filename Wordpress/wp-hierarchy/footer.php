<?php wp_footer(); ?>
</body>

<nav>
    <?php
    $args = array(
        'theme_location' => 'footer-menu',
        'container_class' => 'toto'
    );
    wp_nav_menu($args);
    ?>
</nav>

</html>