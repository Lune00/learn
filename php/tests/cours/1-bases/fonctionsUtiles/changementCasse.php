<?php
$x = 'bOnJoUr eT bIeNvEnUe à EnI éCoLe InFoRmAtIqUe';
echo "<p><code>strtolower('$x')</code> = " . strtolower($x) . '<br>';
echo "<code>strtoupper('$x')</code> = " . strtoupper($x) . '<br>';
echo "<code>ucwords('$x')</code> = " . ucwords($x) . '<br>';
echo "<code>ucwords(strtolower('$x'))</code> = " . ucwords(strtolower($x)) . ' </p>';
