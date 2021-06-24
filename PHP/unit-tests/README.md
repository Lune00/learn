# PHP UNIT starter pack

Dépôt starter pack [ici](https://github.com/Lune00/learn/tree/master/PHP/unit-tests)
Un simple projet starter avec une configuration classique de PHPUNIT.


##  PHPUNIT 

Les tests PHPUNIT sont regroupés en *test cases*, et les test cases sont regroupés en *test suites*.

PHPUNIT lance tes *test suites* (des groupes de tests) grâce à son runner ``test``, dont le bin est situé dans ``vendor/bin``. 

### Test case

Un *test case* est une classe PHP qui étend la classe ``PHPUnit_Framework_TestCase``. Chaque test case contient des méthodes publiques **dont les noms commencent par ``test``**. Chacune de ces méthodes sont des tests unitaires. Chaque classe *test case* **doit avoir un nom qui finit par ``Test``, et chaque fichier contenant la classe doit avoir un nom qui finit par ``Test.php``**. 

Par exemple, la classe (*test case*) `FooTest` dans un fichier `FooTest.php` est valide.

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

Le runner PHPUnit ``test`` (dans vendor/bin) 

<?xml version="1.0" encoding="UTF-8"?>
<phpunit boostrap="tests/bootstrap.php">

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


``bootstrap`` est un attribut de l'élément XML ``<phpunit></phpunit>``. Il indique le path (relatif au fichier de configuration ``phpunit.xml``) vers un fichier (``bootstrap.php``) qui sera inclus **avant que le runner de PHPUNIT n'éxecute les tests**. Il nous permet d'autoloader les dépendances installées par Composer pour les rendre disponibles pour nos tests.

