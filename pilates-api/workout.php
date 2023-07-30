<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
class PilatesExercise
{
}

class PilatesWorkout
{
}

class workout
{
}

function calcWorkoutRuntime( $workoutList )
{
  $runningTime = 0;
  for ( $i=0; $i < count($workoutList); $i++ )
  {
    $runningTime += (int)$workoutList[$i]['time'];
  }

  return $runningTime;
}

function fillAllotedTime($workoutPool, $maxAllotedTime )
{
  $workoutList = [];
  
  shuffle($workoutPool);
  $workoutList = [];

  for( $i=0; $i < count($workoutPool); $i++ )
  {
    if ( calcWorkoutRuntime($workoutList) >= $maxAllotedTime )
    {
      break;
    }
    else{
      $workoutList[] = $workoutPool[$i];
    }
  }

  return $workoutList;
}

function gerneateWorkout($pilatesExerciseList, $workoutTime )
{
  $runningWorkoutTime = 0;
  $warmupPercentage = 5;
  $cooldownPercentage = 0;
  $mainWorkoutPercentage = (100 - $warmupPercentage - $cooldownPercentage);
  $workoutList = [];

  $workoutTimeInSeconds = ($workoutTime * 60);
  $warmupTime = floor( ( $workoutTimeInSeconds / 100 ) * $warmupPercentage);
  $mainsTime = floor( ($workoutTimeInSeconds / 100 ) * $mainWorkoutPercentage);
  $workoutList = fillAllotedTime($pilatesExerciseList->warmUps, $warmupTime );
  $workoutList = array_merge( $workoutList, fillAllotedTime($pilatesExerciseList->mains, $mainsTime ) );


  error_log( "Generated workout for $workoutTimeInSeconds seconds had $warmupTime warmup seconds ($warmupPercentage%) and $mainsTime main seconds ($mainWorkoutPercentage%)", 0 );
  return $workoutList;
}


$database = new Database();
$conn = $database->getConnection();

if ($conn == null) {
  echo "Database connection failed";
}

if (isset($_GET['workoutTime'])) {
  $workoutTime = (int) $_GET['workoutTime'];
}
else
{
  $workoutTime = 60;
}

$sql = "SELECT * FROM pilates_exercise";


$pilatesExercises = array();
$r = 0;
$result = $conn->query($sql);
$storedRows = array();

if ($result->num_rows > 0)
{
  // output data of each row
  while ($row = $result->fetch_assoc()) {
    $pilatesExercise = new PilatesExercise();
    $pilatesExercise = $row;
    $bodyPartSql = "SELECT pebp.*, bp.label FROM pilates_exercise_body_part ri INNER JOIN body_part bp ON bp.name = pebp.body_part';";

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
  $warmUps = [];
  $worouts = [];

  $filteredList = [];

  /* Build two lists, warm ups and main workouts*/
  foreach ($pilatesExercises as $pilatesExercise) {
    if ( (int) $pilatesExercise['isWarmup'] ) {
        $warmUps[] = $pilatesExercise;
      }
      else
      {
        $filteredList[] = $pilatesExercise;
      }
    }
    $PilatesWorkout = new PilatesExercise();
    $PilatesWorkout->warmUps = $warmUps;
    $PilatesWorkout->mains = $filteredList;

    /* Based on our workout time, create a random workout */
    $exerciseList = gerneateWorkout($PilatesWorkout, $workoutTime);

    $Workout = new Workout();
    $Workout->exercises = $exerciseList;

    print json_encode($Workout);

} else {
  echo "0 results";
}

$conn->close();
