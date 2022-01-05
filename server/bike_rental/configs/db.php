<?php
    class DB{
        private $servername = "localhost";
        private $username = "root";
        private $password = "";
        private $db = "bikerental";
        private $port = 5050;
        private $conn;
        public function connect(){
            $this->conn = null;
            try {
                $this->conn = new PDO("mysql:host=$this->servername;port=$this->port;dbname=$this->db", $this->username, $this->password);
                 // set the PDO error mode to exception
                $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                // echo "Connected successfully";
                
            } catch(PDOException $e) {
                // echo "Connection failed: " . $e->getMessage();
            }
            return $this->conn;
        }
    }
?>