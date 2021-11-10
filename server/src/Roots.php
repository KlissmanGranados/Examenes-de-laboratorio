<?php

define('PATCH_APP','../app/');
define('PATCH_CONFIG','../config/');
define('PATCH_SRC','../src/');
define('PATCH_ROUTES','../routes/');
define('PATCH_VENDOR','../vendor/');
define('PATCH_VIEWS','../views/');


//server
$server = 'https://' . $_SERVER['HTTP_HOST']  . $_SERVER['PHP_SELF'];
putenv("HOST=$server");


//smtp
putenv("HOST_SMTP=smtp.gmail.com");
putenv("USER_SMTP={EMAIL}");
putenv("PASS_SMTP={PASS}");

//bdd - postgresql
putenv("{POSTGRESQL}");
