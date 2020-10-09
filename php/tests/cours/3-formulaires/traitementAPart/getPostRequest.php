<?php
if (isset($_GET['nom']))
    echo '$_GET[\'nom\'] -> ' . $_GET['nom'] . '<br>';
if (isset($_POST['nom']))
    echo '$_POST[\'nom\'] -> ' . $_POST['nom'] . '<br>';
if (isset($_REQUEST['nom']))
    echo '$_REQUEST[\'nom\'] -> ' . $_REQUEST['nom'] . '<br>';
