<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
include_once '../config/database.php';
class Response
{
}

function collateNewIngredient(&$ingredientList, $ingredientObj)
{
  $ingredientFound=FALSE;

  foreach( $ingredientList as $key => $ingredient ) {
    if ( $ingredient['ingredientId'] == $ingredientObj['ingredientId'])
    {
      $ingredientList[$key]['amount'] = ($ingredient['amount'] * 2);
      $ingredientFound=TRUE;
    }
  }

  if ( !$ingredientFound )
  {
    $ingredientList[] = $ingredientObj;
  }
}

function getPlanner($conn, $startDate, $endDate)
{
  $sql = "SELECT * FROM planner p" .
    " LEFT JOIN recipe r ON p.recipeId=r.id " .
    " WHERE p.day >= CAST('$startDate' AS DATE)" .
    " AND p.day <= CAST('$endDate' AS DATE)";

  /* "WHERE p.day=$recipeId"; */
  $r = 0;
  $result = $conn->query($sql);
  $storedRows = array();
  $response = new Response();

  $response->ingredients = [];
  $ingredientList = [];

  if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {

      //$recipe->recipe = json_encode($row);
      $recipeId = $row['recipeId'];
      /* Fetch Ingredients*/
      $ingredientSql = "SELECT ri.*, i.label,mt.abbriviation FROM recipe_ingredient ri INNER JOIN ingredient i ON i.id = ri.ingredientId LEFT JOIN measurement_type mt ON ri.measurementTypeId=mt.name" .
        " WHERE ri.recipeId='$recipeId'";

      $result2 = $conn->query($ingredientSql);
      //$ingredients = array();
      $i = 0;

      if ($result2->num_rows > 0) {
        // output data of each row
        while ($row2 = $result2->fetch_assoc()) {
          collateNewIngredient($ingredientList, $row2);
          /* $ingredients[$i] = $row2;
          $i++; */
        }
      }
    }
    $response->ingredients = array_merge($response->ingredients, $ingredientList);

    print json_encode($response);
  } else {
    echo "0 results";
  }
}

$database = new Database();
$conn = $database->getConnection();

if ($conn == null) {
  echo "Database connection failed";
}

/* Query params*/
$action = $_GET['action'];

 // Takes raw data from the request
 $json = file_get_contents('php://input');

 // Converts it into a PHP object
 $postData = json_decode($json);

switch ($action) {
  case 'getWeek':
    getPlanner($conn, $postData->startDate, $postData->endDate);
    break;
}




$conn->close();
