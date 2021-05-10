<?php
#Closure et fonction anonymes (même chose en PHP) (PHP 5.3 >)
#Sous le capot, ce sont des instances de la classe Closure

$closure = function ($name) {
    return sprintf('Hello %s', $name);
};

#On peut invoiquer la closure grace a la methode __invoke() (appelée qd une variable est suivie de "()")
echo $closure('Foo') . PHP_EOL;


#Attach state to closure avec 'use'
function enclosePerson($name)
{
    return function ($do_command) use ($name) {
        return sprintf('%s, %s', $do_command, $name);
    };
}

$a = enclosePerson('Bar');
echo $a("Va m'acheter du pain") . PHP_EOL;

#bindTo : bind a closure to object to access object's internal state
class cat
{
    public $name = 'Le chat';
    public function changeName($callBack)
    {
        //Bind
        $a = $callBack->bindTo($this, __CLASS__);
        $a();
    }
}
$cat = new Cat();
echo $cat->name . PHP_EOL;
$cat->changeName(function () {
    $this->name = 'Muté !';
});
echo $cat->name . PHP_EOL;
