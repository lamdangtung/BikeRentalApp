<?php
    header("Access-Control-Allow-Origin:*");
    header("Content-Type: application/json; charset=UTF-8");
    include_once("../../configs/db.php");
    include_once("../../models/bike.php");

    $db = new DB();
    $connect = $db->connect();

    $bike = new Bike($connect);
    $invoiceId = isset($_GET["invoiceId"]) ? $_GET["invoiceId"] : die();
    $rent_bike = $bike->getRentBike($invoiceId);
    $num = $rent_bike->rowCount();
    if($num > 0){
        $rent_bike_json = [];
        $rent_bike_json["rent_bike"] = [];
        while($row = $rent_bike->fetch(PDO::FETCH_ASSOC)){
            extract($row);
    
            $rent_bike_json["rent_bike"] = array(
                "id" => $id,
                "category" => $category,
                "barcode" => $barcode,
                "isRented" => $isRented,
                "deposite" => $deposite,
                "licenseplate" => $licenseplate,
                "parkingId" => $parkingId,
                "rentalPrice" => $rentalPrice,
                "battery" => $battery,
            );
            $rent_bike_json["rental_invoice"] = array(
                "invoiceId" => $invoiceId,
                "createdAt" => $createdAt,
                "totalPrice" => $totalPrice,
                "bikeId" => $bikeId,
            );
        }
        echo json_encode($rent_bike_json,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }
?>