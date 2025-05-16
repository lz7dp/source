<?php
/* Database credentials. */
define('DB_SERVER', '*');
define('DB_USERNAME', '*');
define('DB_PASSWORD', '*');
define('DB_NAME', '*');

define('servername', '*');
define('username', '*');
define('password', '*');
define('dbname', '*');




/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
} else {
    echo "Connected successfully";
}

?>
