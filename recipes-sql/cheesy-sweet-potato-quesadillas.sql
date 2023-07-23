/************************************************************************* RECIPE*/
INSERT INTO recipe (id, name, description, cookingTime, recipeNumber, image) VALUES 
( 
'CSPQ-001',
'Cheesy Sweet Potato Quesadillas',
'with rocket salad',
40,
19,
'cheesy-sweet-potato-quesadillas.png');

/************************************************************************* RECIPE INGREDIENTS
INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPR-001','onion',true, 1, null
);*/

/************************************************************************* RECIPE STEPS
INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    1, 1, 'Preheat Oven', null,
    'Preheat your oven to 200&#8451c',
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );*/
