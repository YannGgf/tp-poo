<?php

define ('DB_HOST', 'database');
define ('DB_USER', 'admin');
define ('DB_PASS', 'admin');
define ('DB_NAME', 'ma_base_de_donnees');


$mysqli = @mysqli_connect(DB_HOST, 
    DB_USER, 
    DB_PASS, 
    DB_NAME);

    if(!$mysqli) {
        die('erreur 2: ' . mysqli_connect_error());
    }


    mysqli_query($mysqli, "SET NAMES UTF8");