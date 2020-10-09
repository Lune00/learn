<?php
echo '<h5>Mise en forme avec <a href="http://php.net/manual/fr/function.sprintf.php"><code>sprintf()</code></a></h5>';
echo '<p>Mise en forme d\'une date : ' . sprintf('%02d/%02d/%04d', 1, 1, 1981) . '</p>';

echo '<h5>Mise en forme avec <a href="http://php.net/manual/fr/function.number-format.php"><code>number_format()</code></a></h5>';
$x = 1234.567;
echo "<p><code>number_format($x)</code> = " . number_format($x) . '<br>';
echo "<code>number_format($x,1)</code> = " . number_format($x, 1) . '<br>';
echo "<code>number_format($x,2,',',' ')</code> = " . number_format($x, 2, ',', ' ') . '</p>';
