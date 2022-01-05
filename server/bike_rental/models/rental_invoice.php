<?php

class RentalInvoice{
    private $conn;
    public $id;
    public $totalPrice;
    public $bikeId;
    public $createdAt;

    public function __construct($conn){
        $this->conn = $conn;
    }

    public function createRentalInvoice(){
        $query = "INSERT INTO rental_invoice SET totalPrice=:totalPrice, bikeId=:bikeId, createdAt=:createdAt";
        $stmt = $this->conn->prepare($query);
        $this->totalPrice = htmlspecialchars(strip_tags($this->totalPrice));
        $this->bikeId = htmlspecialchars(strip_tags($this->bikeId));
        $this->createdAt = htmlspecialchars(strip_tags($this->createdAt));

        $stmt->bindParam(":totalPrice",$this->totalPrice);
        $stmt->bindParam(":bikeId",$this->bikeId);
        $stmt->bindParam(":createdAt",$this->createdAt);
        if($stmt->execute()){
            $this->id = $this->conn->lastInsertId();
            return true;
        }
        printf("Error: %s,\n", $stmt->error);
        return false;
    }
}

?>