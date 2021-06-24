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

    public function testRespondToInAgreement()
    {
        $whovian = new Whovian('David Tennant');
        $opinion = 'David Tennant is the best doctor, period';
        $this->assertEquals('I agree !', $whovian->respondTo($opinion));
    }


    public function testRespondToInDisagreement()
    {

        $this->expectException(Exception::class);
        $whovian = new Whovian('David Tennant');
        $opinion = 'No way. Matt Smith was awesome';
        $whovian->respondTo($opinion);
    }

    //Fonction Data Provider
    //Renvoie un tableau de tableaux. Chaque tableau est un jeu
    //de données passé en paramètre a la fonction qui s'en servira
    //de dataProvider. Si la fonction à tester n'a besoin que d'un paramètre
    //on retourne des tableaux à un élément

    /**
     * Data provider
     */
    public function opinionsDisagreementProvider()
    {
        return array(
            ['No man, David was a great one'],
            ['A duck !'],
            ['Tennant, Really ?'],
            [false]
        );
    }

    /**
     * @dataProvider opinionsDisagreementProvider
     */
    public function testRespondToDisagreement($opinion)
    {
        $this->expectException(Exception::class);
        $whovian = new Whovian('David Tennant');
        $whovian->respondTo($opinion);
    }



    public function opinionAgreementProvider()
    {
        return array(
            ['David Tennant is so cool'],
            ['Have you seen David Tennant ?'],
        );
    }

    /**
     * @dataProvider opinionAgreementProvider
     */
    public function testRespondToAgreement($opinion)
    {
        $whovian = new Whovian('David Tennant');
        $this->assertEquals('I agree !', $whovian->respondTo($opinion));
    }
}
