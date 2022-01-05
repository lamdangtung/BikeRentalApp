<?php
    header("Access-Control-Allow-Origin:*");
    header("Content-Type: application/json; charset=UTF-8");
    include_once("../../configs/db.php");
    include_once("../../models/parking.php");
    include_once("../../models/bike.php");


    $db = new DB();
    $connect = $db->connect();

    $parking = new Parking($connect);
    $all_parking = $parking->getAllParking();
    $num = $all_parking->rowCount();

    $bike = new Bike($connect);

    if($num > 0){
        $parking_array = [];
        $parking_array["data"] = [];

        while($row = $all_parking->fetch(PDO::FETCH_ASSOC)){
            extract($row);

            $parking_item = array(
                "id" => $id,
                "name" => $name,
                "address" => $address,
                "area" => $area,
                "num_single" => $num_single,
                "num_couple" => $num_couple,
                "num_electric" => $num_electric,
                "num_free_single" => $bike->getNumFreeSingleBikeByParkingId($id),
                "num_free_couple" =>$bike->getNumFreeCoupleBikeByParkingId($id),
                "num_free_electric" => $bike->getNumFreeElectricBikeByParkingId($id)
            );
            array_push(
                $parking_array["data"],$parking_item
            );
        }
    echo json_encode($parking_array,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }

?>