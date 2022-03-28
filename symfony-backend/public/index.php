<?php

use App\Kernel;

require_once dirname(__DIR__).'/vendor/autoload_runtime.php';
//allow access from local
header('Access-Control-Allow-Origin:'.rtrim($_SERVER['HTTP_REFERER'], '/'));
header('Access-Control-Allow-Origin:*');
header('Access-Control-Allow-Headers:*');
header('Access-Control-Allow-Credentials:true');
header('Access-Control-Allow-Headers:*');
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    die();
}

return function (array $context) {
    return new Kernel($context['APP_ENV'], (bool) $context['APP_DEBUG']);
};


