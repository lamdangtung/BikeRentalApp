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
    $bike = new Bike($connect);
    $rental_invoice = new RentalInvoice($connect);
    $data = json_decode(file_get_contents("php://input"));
    $rental_invoice->totalPrice = $data->totalPrice;
    $rental_invoice->bikeId = $data->bikeId;
    $rental_invoice->createdAt = $data->createdAt;
    if($data->parkingId != null){
        $bike->updateParkingIdBikeWithBikeId($data->bikeId,$data->parkingId);
    }
    
    if($rental_invoice->createRentalInvoice()){
       $rental_invoice_json = [];
        $rental_invoice_json["message"] = "Rental Invoice Created";
        $rental_invoice_item = array(
            "id" => $rental_invoice->id,
            "totalPrice" => $rental_invoice->totalPrice,
            "bikeId" => $rental_invoice->bikeId,
            "createdAt" => $rental_invoice->createdAt
        );
        $rental_invoice_json["rental_invoice"] = array(
            "id" => $rental_invoice->id,
            "totalPrice" => $rental_invoice->totalPrice,
            "bikeId" => $rental_invoice->bikeId,
            "createdAt" => $rental_invoice->createdAt
        );
       echo json_encode($rental_invoice_json,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }else{
        echo json_encode(array("message" => "Question Not Created"));
    }
?>