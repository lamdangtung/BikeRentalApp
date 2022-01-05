<?php
    header("Access-Control-Allow-Origin:*");
    header("Content-Type: application/json; charset=UTF-8");
    include_once("../../configs/db.php");
    include_once("../../models/bike.php");

    $db = new DB();
    $connect = $db->connect();

    $bike = new Bike($connect);
    $parkingId = isset($_GET["parkingId"]) ? $_GET["parkingId"] : die();
    $all_bike = $bike->getAllBikeByParkingId($parkingId);
    $num = $all_bike->rowCount();
    if($num > 0){
        $bike_array = [];
        $bike_array["data"] = [];
        while($row = $all_bike->fetch(PDO::FETCH_ASSOC)){
            extract($row);
    
            $bike_item = array(
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
            array_push(
                $bike_array["data"],$bike_item
            );
        }
        echo json_encode($bike_array,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }
?>
