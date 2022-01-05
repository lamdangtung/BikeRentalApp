<?php

class Bike{
    private $conn;

    public $id;
    public $category;
    public $barcode;
    public $isRented;
    public $deposite;
    public $licenseplate;
    public $parkingId;
    public $rentalPrice;
    public $battery;
    public function __construct($conn){
        $this->conn = $conn;
    }

    public function getAllBikeByParkingId($parking_Id){
        $query = "SELECT * FROM bike WHERE parkingId =? AND isRented=0";
        // this->conn->execute("set names utf8");
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1,$parking_Id);
        $stmt->execute();
        return $stmt;
    }

    public function getNumFreeSingleBikeByParkingId($parking_Id){
        $query = "SELECT * FROM bike WHERE parkingId =? AND isRented=0 AND category=\"XE_DAP_DON\" ";
        // this->conn->execute("set names utf8");
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1,$parking_Id);
        $stmt->execute();
        return $stmt->rowCount();
    }

    public function getNumFreeCoupleBikeByParkingId($parking_Id){
        $query = "SELECT * FROM bike WHERE parkingId =? AND isRented=0 AND category=\"XE_DAP_DOI\" ";
        // this->conn->execute("set names utf8");
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1,$parking_Id);
        $stmt->execute();
        return $stmt->rowCount();
    }

    public function getNumFreeElectricBikeByParkingId($parking_Id){
        $query = "SELECT * FROM bike WHERE parkingId =? AND isRented=0 AND category=\"XE_DAP_DIEN\" ";
        // this->conn->execute("set names utf8");
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1,$parking_Id);
        $stmt->execute();
        return $stmt->rowCount();
    }

    public function updateRentStatusBikeWithBikeId($bikeId,$rentStatus){
        $query = "UPDATE bike SET isRented=:isRented WHERE id=:id";
        // this->conn->execute("set names utf8");
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":id",$bikeId);
        $stmt->bindParam(":isRented",$rentStatus);
        if($stmt->execute()){
            return true;
        }
        printf("Error: %s,\n", $stmt->error);
        return false;
    }

    public function updateParkingIdBikeWithBikeId($bikeId,$parkingId){
        $query = "UPDATE bike SET parkingId=:parkingId WHERE id=:id";
        // this->conn->execute("set names utf8");
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":id",$bikeId);
        $stmt->bindParam(":parkingId",$parkingId);
        if($stmt->execute()){
            return true;
        }
        printf("Error: %s,\n", $stmt->error);
        return false;
    }

    public function getRentBike($rentalInvoiceId){
        $query = "SELECT bike.id,category,barcode,isRented,deposite,licenseplate,parkingId,rentalPrice,battery,rental_invoice.id as invoiceId,rental_invoice.createdAt,rental_invoice.totalPrice,rental_invoice.bikeId FROM bike,rental_invoice WHERE rental_invoice.bikeId=bike.id AND rental_invoice.id =?";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1,$rentalInvoiceId);
        $stmt->execute();
        return $stmt;
    }

}


?>
