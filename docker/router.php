<?php

if (file_exists('./public/' . $_SERVER["REQUEST_URI"])) {
    return false;    // serve the requested resource as-is.
}
$functionIterator = new GlobIterator(__DIR__ . '/../functions/*.php');
$functions = [];
foreach ($functionIterator as $record) {
    $functions['/.pamstack/functions/' . substr($record->getFilename(), 0, -4)] = realpath($record->getPathName());
}

if (array_key_exists($_SERVER['REQUEST_URI'], $functions)) {
    $func = require($functions[$_SERVER['REQUEST_URI']]);
    $ret = $func();

    http_response_code($ret['status']);
    header('Content-Type: application/json');
    echo $ret['body'];
    exit();
}
