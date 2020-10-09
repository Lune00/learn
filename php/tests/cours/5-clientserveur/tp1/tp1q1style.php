<style type="text/css">
    * {
        <?php
        foreach (array('background', 'color') as $propriete) {
            if (!isset($$propriete) && isset($_COOKIE[$propriete])) {
                $$propriete = filter_input(INPUT_COOKIE, $propriete,
                        FILTER_SANITIZE_SPECIAL_CHARS);
            }
            if (isset($$propriete)) {
                echo $propriete . ' : ' . $$propriete . ';';
            }
        }
        ?>
    }
</style>
