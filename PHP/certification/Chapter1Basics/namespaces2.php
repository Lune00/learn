<?php

namespace my\name {
    function foo()
    {
        echo 'my\name'. "__NAMESPACE__". __NAMESPACE__ ."\n";
    };
}

namespace exec {

    function foo()
    {
        echo 'exec'. "__NAMESPACE__". __NAMESPACE__ ."\n";
    }

    \my\name\foo();
    foo();
}

namespace exec2 {

    // function foo()
    // {
    //     echo 'exec2'. "__NAMESPACE__". __NAMESPACE__ ."\n";
    // }
    // foo();
    use function my\name\foo as otherFoo;
    otherFoo();
    // use my\name as bar; //aliasing

    // \my\name\foo();
    // bar\foo();
}
