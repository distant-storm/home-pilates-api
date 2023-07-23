<?php 
    class Database {

        private $configDir='../../../private/';

        public $conn;

        public function getConnection(){
            $config = parse_ini_file($this->configDir . "pilates-database.ini");
            $this->conn = null;            // Create connection
            $this->conn = new mysqli($config['hostname'], 
            $config['username'],$config['password'], $config['dbname']);
            // Check connection
            if ($this->conn->connect_error) {
                die("Connection failed: " . $this->conn->connect_error . "matt" . $config['hostname'] .
                $config['username'] . $config['password'] . $config['dbname']);
            }
            else {
                return $this->conn;
            }
        }
    }  
?>
