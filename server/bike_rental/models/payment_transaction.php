<?php
class PaymentTransaction{
    private $conn;

    public $id;
    public $content;
    public $createdAt;
    public $bikeId;
    public $method;
    public $invoiceId;
    


    public function __construct($conn){
        $this->conn = $conn;
    }

    public function createPaymentTransaction(){
        $query = "INSERT INTO payment_transaction SET id=:id, content=:content, createdAt=:createdAt,method=:method,invoiceId=:invoiceId,bikeId=:bikeId";
        $stmt = $this->conn->prepare($query);
        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->content = htmlspecialchars(strip_tags($this->content));
        $this->createdAt = htmlspecialchars(strip_tags($this->createdAt));
        $this->method = htmlspecialchars(strip_tags($this->method));
        $this->invoiceId = htmlspecialchars(strip_tags($this->invoiceId));
        $this->bikeId = htmlspecialchars(strip_tags($this->bikeId));

        $stmt->bindParam(":id",$this->id);
        $stmt->bindParam(":content",$this->content);
        $stmt->bindParam(":createdAt",$this->createdAt);
        $stmt->bindParam(":method",$this->method);
        $stmt->bindParam(":invoiceId",$this->invoiceId);
        $stmt->bindParam(":bikeId",$this->bikeId);
        if($stmt->execute()){
            return true;
        }
        printf("Error: %s,\n", $stmt->error);
        return false;
    }
}

?>
