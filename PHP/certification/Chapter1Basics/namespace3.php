<?php

// namespace A;
// function hello(){echo __NAMESPACE__;}
// namespace B;
// function hello(){echo __NAMESPACE__;}
// namespace C;
// \B\hello();
// echo __NAMESPACE__;


namespace A;
$closure = function() { echo __NAMESPACE__; };
namespace B;
$closure = function() { echo __NAMESPACE__; };
namespace C;
$closure();