     <?php
class Parking{
    private $conn;

    public $id;
    public $name;
    public $address;
    public $area;
    public $num_single;
    public $num_couple;
    public $num_electric;

    public function __construct($conn){
        $this->conn = $conn;
    }

    public function getAllParking(){
        $query = "SELECT * FROM parking";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

}
?>