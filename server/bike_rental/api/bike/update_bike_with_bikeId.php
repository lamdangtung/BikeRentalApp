<?php
    header("Access-Control-Allow-Origin:*");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type,Access-Control-Allow-Methods.Authoriztion,X-Requested-With");
    include_once("../../configs/db.php");
    include_once("../../models/bike.php");
    include_once("../../models/rental_invoice.php");
    $db = new DB();
    $connect = $db->connect();

??
