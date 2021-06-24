<h1>Hello Sanitize</h1>

<?php

$input = '<p><script>alert("You won!");</script></p>';
//Echappe les quotes simples et doubles
echo htmlentities($input, ENT_QUOTES, 'UTF-8') . PHP_EOL;

$str = 'Un \'apostrophe\' en <strong>gras</strong>';

// Affiche : Un 'apostrophe' en &lt;strong&gt;gras&lt;/strong&gt;
echo htmlentities($str);

// Affiche : Un &#039;apostrophe&#039; en &lt;strong&gt;gras&lt;/strong&gt;
echo htmlentities($str, ENT_QUOTES) . PHP_EOL;

//Filtres : FLAG et options

// https://www.php.net/manual/fr/function.filter-var.php
// https://www.php.net/manual/fr/filter.filters.validate.php
$options = array(
    'options' => array(
        'default' => 3, // valeur par défaut si le filtre échoue
        'min_range' => 5,
        'max_range' => 13
    )
);

echo 'Test 1 ' . filter_var(10, FILTER_VALIDATE_INT, $options) . PHP_EOL;
echo filter_var(1, FILTER_VALIDATE_INT, $options) . PHP_EOL;
echo filter_var('foo10', FILTER_VALIDATE_INT, $options) . PHP_EOL;

echo htmlentities("'Les simples quotes sont converties en htmlentities foo'", ENT_QUOTES) . PHP_EOL;
echo strip_tags("<p>Il y avait des balises HTML dans cette chaine<script></script>") . PHP_EOL;

function hashid()
{
    return sprintf(
        '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
        mt_rand(0, 0xffff),
        mt_rand(0, 0xffff),
        mt_rand(0, 0xffff),
        mt_rand(0, 0x0fff) | 0x4000,
        mt_rand(0, 0x3fff) | 0x8000,
        mt_rand(0, 0xffff),
        mt_rand(0, 0xffff),
        mt_rand(0, 0xffff)
    );
}

echo hashid() . PHP_EOL;
echo ctype_alnum(hashid()) ? 'yes' : 'nope' . PHP_EOL;
