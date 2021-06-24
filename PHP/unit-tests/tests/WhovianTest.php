<?php

require dirname(__DIR__) . '/src/Whovian.php';

use PHPUnit\Framework\TestCase;

class WhovianTest extends TestCase
{
    public function testSetsDoctorWithConstructor()
    {
        $whovian = new Whovian('Peter Capaldi');
        $this->assertEquals('Peter Capaldi', $whovian->favoriteDoctor);
    }
}
