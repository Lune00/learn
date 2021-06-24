# PHP UNIT starter pack

Dépôt starter pack [ici](https://github.com/Lune00/learn/tree/master/PHP/unit-tests)
Un simple projet starter avec une configuration classique de PHPUNIT.

## Architecture classique d'un projet PHP

- src/
- tests/
    - boostrap.php
- vendor/
- composer.json
- composer.lock
- phpunit.xml
- README.md

## Fichier de configuration ``phpunit.xml``


<?xml version="1.0" encoding="UTF-8"?>
<phpunit bootrasp="tests/bootstrap.php">

    <testsuites>
        <testsuite name="whovian">
            <directory suffix="Test.php">tests</directory>
        </testsuite>
    </testsuites>

    <filter>
        <whitelist>
            <directory>src</directory>
        </whitelist>
    </filter>
</phpunit>
