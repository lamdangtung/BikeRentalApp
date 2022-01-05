<?php
    header("Access-Control-Allow-Origin:*");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type,Access-Control-Allow-Methods.Authoriztion,X-Requested-With");
    include_once("../../configs/db.php");
    include_once("../../models/bike.php");
    include_once("../../models/rental_invoice.php");
    include_once("../../models/payment_transaction.php");
    $db = new DB();
    $connect = $db->connect();
    $bike = new Bike($connect);
    $payment_transaction = new PaymentTransaction($connect);
    $data = json_decode(file_get_contents("php://input"));
    $payment_transaction->id = $data->id;
    $payment_transaction->content = $data->content;
    $payment_transaction->createdAt = $data->createdAt;
    $payment_transaction->method = $data->method;
    $payment_transaction->invoiceId = $data->invoiceId;
    $payment_transaction->bikeId = $data->bikeId;
    
    if($payment_transaction ->createPaymentTransaction()){
        if($data->content == "rent bike"){
            $bike->updateRentStatusBikeWithBikeId($payment_transaction->bikeId,1);
        }else if($data->content == "return bike"){
            $bike->updateRentStatusBikeWithBikeId($payment_transaction->bikeId,0);
        }
       $payment_transaction_json = [];
        $payment_transaction_json["message"] = "Payment Transaction Created";
        $payment_transaction_json["payment_transaction"] = array(
            "id" => $payment_transaction->id,
            "content" => $payment_transaction->content,
            "bikeId" => $payment_transaction->bikeId,
            "createdAt" => $payment_transaction->createdAt,
            "method" => $payment_transaction->method,
            "invoiceId" => $payment_transaction->invoiceId,
        );
       echo json_encode($payment_transaction_json,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }else{
        echo json_encode(array("message" => "Payment Transation Not Created"));
    }
?>