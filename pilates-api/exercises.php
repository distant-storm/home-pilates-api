<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
class PilatesExercise
{
}

function createRecipe($conn)
{
  // set parameters and execute
  $recipeName = $_POST["recipeName"];
  $description = "new Recipe";
  $cookingTime = 30;
  $recipeNumber = 2;
  $image = basename($_FILES["file"]["name"]);

    // prepare and bind
  $stmt = $conn->prepare("INSERT INTO recipe (name, description, cookingTime, recipeNumber, image) VALUES (?, ?, ?, ?, ?)");
  $stmt->bind_param( 'ssiis',$recipeName, $description, $cookingTime, $recipeNumber, $image );

  $stmt->execute();
  echo "New records created successfully";
  $stmt->close();

  $target_dir = "/var/www/html/images/";
  $target_file = $target_dir . basename($_FILES["file"]["name"]);
  $uploadOk = 1;
  $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
  // Check if image file is a actual image or fake image
  if(isset($_POST["recipeName"])) {

    if (is_uploaded_file($_FILES['file']['tmp_name'])) {

      $check = getimagesize($_FILES["file"]["tmp_name"]);
      if ($check !== false) {
        echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
      } else {
        echo "File is not an image.";
        $uploadOk = 0;
      }

      if (file_exists($target_file)) {
        echo "Sorry, file already exists.";
        $uploadOk = 0;
      }

      // Check file size
      if ($_FILES["file"]["size"] > (10 * 1048576)) {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
      }

      // Allow certain file formats
      if (
        $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif"
      ) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
      }

      // Check if $uploadOk is set to 0 by an error
      if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
        // if everything is ok, try to upload file
      } else {
        if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
          echo "The file " . htmlspecialchars(basename($_FILES["file"]["name"])) . " has been uploaded.";
        } else {
          echo "Sorry, there was an error uploading your file.\n";
        }
      }
    }
    else
    {
      echo "NO TMP FILE\n";
    }

  }
}

$database = new Database();
$conn = $database->getConnection();

if ($conn == null) {
  echo "Database connection failed";
}

/* Query params*/
if (isset($_GET['action'])) {
  $action = $_GET['action'];
}
else {
  $action = null;
}

 // Takes raw data from the request
 $json = file_get_contents('php://input');

 // Converts it into a PHP object
 $postData = json_decode($json);

switch ($action) {
  case 'create':
    createRecipe($conn);
    break;

  default:
    /* Query params*/
    if (isset($_GET['exerciseId'])) {
      $exerciseId = $_GET['exerciseId'];
    } else {
      $exerciseId = '';
    }

    if (isset($_GET['searchTerm'])) {
      $searchTerm = htmlspecialchars($_GET["searchTerm"]);
    }

    /* Are we getting one or many reicpes*/
    if ($exerciseId) {
      $sql = "SELECT * FROM pilates_exercise pe WHERE pe.id='$exerciseId'";
    } else {
      $sql = "SELECT * FROM pilates_exercise";
    }

    $pilatesExercises = array();
    $r = 0;
    $result = $conn->query($sql);
    $storedRows = array();

    if ($result->num_rows > 0) {
      // output data of each row
      while ($row = $result->fetch_assoc()) {
        $pilatesExercise = new PilatesExercise();
        $pilatesExercise->exerciseData = $row;

        /* Fetch Ingredients*/
        $bodyPartSql = "SELECT pebp.*, bp.label FROM pilates_exercise_body_part ri INNER JOIN body_part bp ON bp.name = pebp.body_part WHERE pebp.pilates_exercise='$exerciseId';";

        $result2 = $conn->query($bodyPartSql);
        $bodyParts = array();
        $i = 0;

        if ($result2 && $result2->num_rows > 0) {
          // output data of each row
          while ($row2 = $result2->fetch_assoc()) {
            $bodyParts[$i] = $row2;
            $i++;
          }
          $pilatesExercise->bodyParts = $bodyParts;
        }

        $pilatesExercises[$r] = $pilatesExercise;
        $r++;
      }

      /* Filter the results*/
      $filteredList = [];

      /* Filter Results*/
      if (isset($searchTerm)) {
        foreach ($pilatesExercises as $pilatesExercise) {
          $pattern = "/$searchTerm/i";
          $matches = preg_match_all($pattern, $pilatesExercise->exerciseData['name']);

          if ($matches > 0) {
            $filteredList[] = $pilatesExercise;
          }
        }
        print json_encode($filteredList);
      } else {
        print json_encode($pilatesExercises);
      }
    } else {
      echo "0 results";
    }
    break;
}



$conn->close();
