<?php
$servername = "localhost";
$username = "root";
$password = "drummy";
$dbname = "drummys_kitchen";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// prepare and bind
$stmt = $conn->prepare("INSERT INTO ingredient (name) VALUES (?)");
$stmt->bind_param('s', $name);

// set parameters and execute
$name = "Tomato";
$lastname = "Doe";
$email = "john@example.com";
$stmt->execute();

$name = "Pepper";
$lastname = "Moe";
$email = "mary@example.com";
$stmt->execute();

$name = "Cucumber";
$lastname = "Dooley";
$email = "julie@example.com";
$stmt->execute();

echo "New records created successfully";

$stmt->close();
$conn->close();
?>