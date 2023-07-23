/************************************************************************* RECIPE*/
INSERT INTO recipe (id, name, description, cookingTime, recipeNumber, image) VALUES 
( 
'SPR-001',
'Sweet Potato Risotta',
'with Brazil Nut Drizzle',
45,
2,
'sweet-potato-risotto.jpg');

/************************************************************************* RECIPE INGREDIENTS*/
INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPR-001','onion',true, 1, null
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPR-001','courgette',true, 1, null
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPR-001','sweet-potato',true, 200, 'grams'
);
INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPR-001','flat-leaf-parsley',true, 1, 'bunch'
);
INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPR-001','brazil-nuts',true, 15, 'grams'
);
INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPR-001','water',true, 750, 'millilitres'
);
INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPR-001','vegetable-stock',true, 1, null
);
INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPR-001','garlic-clove',true, 2, null
);
INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPR-001','arborio-rice',true, 175, 'grams'
);
INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPR-001','hard-italian-cheese',true, 40, 'grams'
);
INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPR-001','unsalted-butter',true, 15, 'grams'
);


/************************************************************************* RECIPE STEPS
INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    1, 1, 'Preheat Oven', null,
    'Preheat your oven to 200&#8451c',
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );*/
