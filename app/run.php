<?php

include_once(__DIR__ . DIRECTORY_SEPARATOR . "config.php");
include_once(__DIR__ . DIRECTORY_SEPARATOR . "dbconnect.php");
include_once(__DIR__ . DIRECTORY_SEPARATOR . "functions.php");
$directory = __DIR__ . DIRECTORY_SEPARATOR . "templates";

// get Kunden from database
$kundenResult = $mysqli->query("SELECT * FROM v_get_kunden;");
while ($kunde = $kundenResult->fetch_object()) {
    $kunde->vorname_erster_buchstabe = substr($kunde->firstname, 0, 1);
    $kunde->nachname_erster_buchstabe = substr($kunde->lastname, 0, 1);
    $kunde->nachname_erster_buchstabe_mit_punkt = substr($kunde->lastname, 0, 1) . ".";
    $kunden[] = $kunde;
}

if(is_dir($directory)) {
    $scan = scandir($directory);
    unset($scan[0], $scan[1]); //unset . and ..
    foreach($scan as $file) {
        if(!is_dir($directory."/".$file) and str_ends_with($file, ".php")) {
            include_once($directory."/".$file);
        }
    }
}

?>