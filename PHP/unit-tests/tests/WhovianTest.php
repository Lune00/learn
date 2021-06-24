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

    public function testSaysDoctorName()
    {
        $whovian = new Whovian('David Tennant');
        $this->assertEquals('The best doctor is David Tennant', $whovian->say());
    }

    //Creer une fonction Fournisseur de données (d'opinions)
    //à passer à testRespondToInAgreement

    public function testRespondToInAgreement()
    {
        $whovian = new Whovian('David Tennant');
        $opinion = 'David Tennant is the best doctor, period';
        $this->assertEquals('I agree !', $whovian->respondTo($opinion));
    }

    /**
     * @expectedException Exception
     */
    public function testRespondToInDisagreement(){

        $this->expectException(Exception::class);
        $whovian = new Whovian('David Tennant');
        $opinion = 'No way. Matt Smith was awesome';
        $whovian->respondTo($opinion);
    }

}
