<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
include_once '../config/database.php';
class Recipe
{
}

function connectDb()
{
  $GLOBALS['database'] = new Database();
  $conn = $GLOBALS['database']->getConnection();

  if ($conn == null) {
    echo "Database connection failed";
    return null;
  }
  else
  {
    return $conn;
  }
}

function closeConnection($conn) {
  if ( $conn != null )
  {
    $conn->close();
  }

}
function setDay( $conn, $day, $recipeId )
{
  /* If no day set up then create*/
  if( ($plannerDay = getPlannerDay($conn, $day)) == null )
  {
    createPlannerDay($conn, $day, $recipeId, 2 );
  }
  else
  {
    updatePlannerDay($conn, $day, $recipeId, 2 );
  }
  
 /*  $sql = "SELECT * FROM planner p" .
  " LEFT JOIN recipe r ON p.recipeId=r.id " .
  " WHERE p.day >= CAST('2022-10-17' AS DATE)" .
  " AND p.day <= CAST('2022-10-23' AS DATE)";

   "WHERE p.day=$recipeId"; 

  $recipes = array();
  $r = 0;
  $result = $conn->query($sql);
  $storedRows = array();

  if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
      $recipe = new Recipe();

      //$recipe->recipe = json_encode($row);
      $recipe->day = $row['day'];
      $recipe->recipeData = $row;
      $recipeId = $row['recipeId'];
      
      $ingredientSql = "SELECT ri.*, i.label FROM recipe_ingredient ri INNER JOIN ingredient i ON i.id = ri.ingredientId WHERE ri.recipeId=$recipeId";

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
  } */
}

function getPlannerDay( $conn, $day )
{
  $sql = "SELECT * FROM planner p" .
  " LEFT JOIN recipe r ON p.recipeId=r.id " .
  " WHERE p.day=CAST( '$day' AS DATE)";

  $r = 0;
  $result = $conn->query($sql);
  if ( $result )
  {
    if ($result->num_rows > 0)
    {
      $plannerDay = $result->fetch_assoc();
      return $plannerDay;
    }
    else
    {
      return null;
    }
  }
  else
  {
    echo $conn->error;
  }
}

function createPlannerDay( $conn, $day, $recipeId, $portions) {

  $sql = "INSERT INTO planner (day, recipeId, portions) VALUES (CAST( '$day' AS DATE), '$recipeId', $portions)";

  if ($conn->query($sql) === TRUE) {
    echo "Created";
  } else {
    echo "Error creating record: " . $conn->error;
  }
}

function updatePlannerDay($conn, $day, $recipeId, $portions) {

  $sql = "UPDATE planner SET recipeId='$recipeId', portions=$portions WHERE day='$day'";
  echo $sql;
  if ($conn->query($sql) === TRUE) {
    echo "Updated";
  } else {
    echo "Error creating record: " . $conn->error;
  }
}

function clearWeek( $conn, $startDate, $endDate )
{
  $sql = "DELETE FROM planner WHERE day >= DATE('$startDate') AND day <= DATE('$endDate')";

  if ($conn->query($sql) === TRUE) {
    echo "Cleared";
  } else {
    echo "Error creating record: " . $conn->error;
  }
}

function clearDay( $conn, $date )
{
  $sql = "DELETE FROM planner WHERE day=DATE('$date')";
  if ($conn->query($sql) === TRUE) {
    echo "Cleared";
  } else {
    echo "Error creating record: " . $conn->error;
  }
}

function getWeekPlan($conn, $startDate, $endDate)
{
  $sql = "SELECT * FROM planner p" .
    " LEFT JOIN recipe r ON p.recipeId=r.id " .
    " WHERE p.day >= CAST( '$startDate' AS DATE)" .
    " AND p.day <= CAST( '$endDate' AS DATE)";

  /* "WHERE p.day=$recipeId"; */

  $recipes = array();
  $r = 0;
  $result = $conn->query($sql);
  $storedRows = array();

  if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
      $recipe = new Recipe();

      //$recipe->recipe = json_encode($row);
      $recipe->day = $row['day'];
      $recipe->recipeData = $row;
      $recipeId = $row['recipeId'];
      /* Fetch Ingredients*/
      $ingredientSql = "SELECT ri.*, i.label FROM recipe_ingredient ri INNER JOIN ingredient i ON i.id = ri.ingredientId WHERE ri.recipeId='$recipeId'";

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
}


$conn = connectDb();
$postData = new StdClass();

/* Query params*/
$action = $_GET['action'];

 // Takes raw data from the request
 $json = file_get_contents('php://input');

 // Converts it into a PHP object
 $postData = json_decode($json);

switch ($action) {
  case 'getWeek':
    getWeekPlan($conn, $postData->startDate, $postData->endDate ); 
    break;
  case 'setDay':
    if ( isset($postData->day) && isset($postData->recipeId) )
    {
      setDay( $conn, $postData->day, $postData->recipeId );
    }
  break;
  case 'clearWeek':
    if ( isset($postData->startDate) && isset($postData->endDate) )
    {
      clearWeek( $conn, $postData->startDate, $postData->endDate);
    }
  break;
  case 'clearDay':
    if ( isset($postData->date) )
    {
      clearDay( $conn, $postData->date);
    }
   break;
}


closeConnection($conn);
