<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
class Recipe
{
}

$database = new Database();
$conn = $database->getConnection();

if ($conn == null) {
  echo "Database connection failed";
}

/* Query params*/
$recipeId = $_GET['recipeId'];

/* Are we getting one or many reicpes*/
if ($recipeId) {
  $sql = "SELECT * FROM recipe r WHERE r.id='$recipeId'";
}

$recipes = array();
$r = 0;
$result = $conn->query($sql);
$storedRows = array();

if ($result->num_rows > 0) {
  // output data of each row
  while ($row = $result->fetch_assoc()) {
    $recipe = new Recipe();

    $recipeObj->recipe = json_encode($row);
    $recipe->recipeData = $row;

    /* Fetch Ingredients*/
    $ingredientSql = "SELECT ri.*, i.label, mt.abbrivation FROM recipe_ingredient ri INNER JOIN ingredient i ON i.id = ri.ingredientId INNER JOIN measurement_type mt ON i.measurementTypeId=mt.name WHERE ri.recipeId='$recipeId';";
    $result2 = $conn->query($ingredientSql);
    $ingredients = array();
    $i = 0;

    if ($result2->num_rows > 0) {
      // output data of each row
      while ($row2 = $result2->fetch_assoc()) {
        $ingredients[$i] = $row2;
        $i++;
      }
      $recipe->ingredients = $ingredients;
    }

    $recipes[$r] = $recipe;
    $r++;
  }

  print json_encode($recipes);
} else {
  echo "0 results";
}
$conn->close();
