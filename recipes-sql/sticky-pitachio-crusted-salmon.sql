/************************************************************************* RECIPE*/
INSERT INTO recipe (id, name, description, cookingTime, recipeNumber, image) VALUES 
( 
'SPCS-001',
'Sticky Pistachio Crusted Salmon',
'with herby feta bulgur wheat, roasted red pepper and rocket',
35,
28,
'sticky-pistachio-crusted-salmon.jpg');

/************************************************************************* RECIPE INGREDIENTS*/
INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPCS-001','mint',true, 0.5, 'bunch'
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPCS-001','bell-pepper',true, 0.5, null
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPCS-001','echalion-shallot',true, 0.5, null
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPCS-001','cumin-seeds',true, 0.5, null
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId, recipeSpecificIngredientText) VALUES
(
    'SPCS-001',null,false, 120, 'millilitres', 'water for the bulgur'
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPCS-001','bulgur-wheat',true, 60, 'grams'
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPCS-001','vegetable-stock',true, 5, 'grams'
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount) VALUES
(
    'SPCS-001','salmon-fillet',true, 1
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPCS-001','ground-coriander',true, 1, 'sachet'
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPCS-001','pistachios',true, 12.5, 'grams'
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPCS-001','feta-cheese',true, 50, 'grams'
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPCS-001','rocket',true, 20, 'grams'
);

INSERT INTO recipe_ingredient( recipeId, ingredientId, mainIngredient, amount, measurementTypeId) VALUES
(
    'SPCS-001','honey',true, 1, 'sachet'
);

/************************************************************************* RECIPE STEPS*/
INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    1, 1, 'Preheat Oven', null,
    'Preheat your oven to 200&#8451c',
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    2, 1,'Pick mint leaves', null, 
    'Pick mint leaves from stalks and roughly chop', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    3, 1,'Slice Shallot', null, 
    'Halve peel and thinly slice the shallot', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    4, 1,'Slice Pepper', null, 
    'Halve the pepper and discard the core and seeds. Slice into thin strips', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    5, 2, 'Heat cumin seeds', null, 
    'Pop a saucepan over medium-high heat and add the cumin seeds (no oil). Stir and toast until fragrant, 1 min', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    6, 2,'Add oil and shallot', null, 
    'Add a drizzle of oil and the shallot and cook until the shallot is tender, 3-4 mins', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    7, 2, 'Add water and bring to boil', null, 
    'Pour the water ( See ingridents for amount ) for the bulgur wheat into the saucepan with the cumin and shallot and bring to the boil.', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    8, 2, 'Stir in vegitable stock paste and bulgar wheat', null, 
    'Stir in the vegetable stock paste and bulgar wheat, bring back up the boil and simmer for 1 min.', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

  INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    9, 2,'Pop lid on pan and leave to rest', null, 
    'Pop a lid on the pan and remove from the heat. Leave to the side for 12-15 mins or until ready to serve', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

  INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    10, 3,'Prep the salmon', null, 
    'Line a baking tray with baking paper and drizzle with oil.  Place the salmon on one side of the tray skin-side down.  Drizzle over a little oil and season with salt and pepper.  Sprinked the ground coriander onto the flesh side.', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

  INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    11, 3,'Add peppers and cook', null, 
    'Pop the pepper onto the other side of the tray and drizzle with oil. Roast until the salmon is cooked, 12-15 minutes and the peppers have softened and charred.', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

  INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    12, 4,'Chop pistachios', null, 
    'Whilst the salmon and peppers cook, remove the pistachios from their shells.  Discard the shells and finely chop the pistachios.  Use a pestle and mortar if you have one.', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

  INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    13, 4, 'Break feta into chunks', null, 
    'Break the feta into small chunks', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

  INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    14, 5, 'Fold in feta and mint', null, 
    'When the bulgur wheat is ready, use a fork to fluff it up. Fold in the feta and mint, taking care not to break up the feta too much.', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

  INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    15, 5, 'Plating up', null, 
    'Once the peppers are cooked stir them into the bulgur, season to taste, share between bowls and arrange rocket on top', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

  INSERT INTO recipe_step(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    16, 6, 'Add the salmon with honey and pistachios', null, 
    'When the salmon is cooked, remove from the oven and drizzle on the honey. Spread across the fish with the back of a spoon and then sprinkle the pistachios onto the salmon. Place on top of the rocket', 
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

/*********************************************************************LONG RECIPE STEPS*/
INSERT INTO recipe_step_long(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    1, 1, 'Prep Time', 'SPCS-001-step-01.webp',
    'Preheat your oven to 200&#8451c.<br />Pick the <b>mint leaves</b> from their stalks and roughly chop (discard stalks).<br />   Halve, peel and thinly slice the shallot.<br />  Halve the <b>pepper</b> and discard the core and seeds.<br /> Slice into thin strips.',
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

  INSERT INTO recipe_step_long(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    2, 1, 'Cook the bulgur', 'SPCS-001-step-02.webp',
    'Pop a saucepan over medium-high heat and add the cumin seeds (no oil).<br />'
    'Stir and toast until fragrant, 1 min.<br />'
    'Add a drizzle of oil and the shallot and cook until the shallot is tender, 3-4 mins.<br />'
    'Pour the water for the bulgur wheat ( see ingredients for amount ) into the saucepan with the cumin and shallot and bring to the boil.<br />'
    'Stir in the vegetables stock paste and bulgur wheat, bring back up to the boil and simmer for 1min.<br />'
    'Pop lid on the pan and remove from the heat.  Leave to the side for 12-15 mins or until ready to serve.',
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

  INSERT INTO recipe_step_long(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    3, 1, 'Salmon Time', 'SPCS-001-step-03.webp',
    'Line a backing tray with baking paper and drizzle with oil.  Place the salmon on one side of the tray skin-side down.  Drizzle over a little oil and season with salt and papper.  Sprinkle the ground coriander onto the flesh side.  Pop the ppper onto the other side of the tray and drizzle with oil.  Season wtih salt and pepper and roast until the salmon is cooked, 12-15 mins, and the peppers have softened and charred.  IMPORTANT: wash your hands after touching raw fish. The salmon is cooked when opaque all the way through.',
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

    INSERT INTO recipe_step_long(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    4, 1, 'Pistachio & Feta', 'SPCS-001-step-04.webp',
    'While the salmon and peppers cook, remove the pistachios from their shells.  Discard the shells and finley chop the pistachios.  TIP: Use a pestle and mortar if you have one. BReak the feta into small chunks',
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

      INSERT INTO recipe_step_long(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    5, 1, 'Finish Off', 'SPCS-001-step-05.webp',
    'When the bulgur wheat is ready, use a fork to fluff it up.  Fold in the feta and mint, taking care not to break up the feta too much.  Once the pppers are cooked, stir them into the bulgur, season to taste with salt and pepper if necessary. share the bulgur between your bowls arranging the rocket on top.',
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );

       INSERT INTO recipe_step_long(
  stepNum, stepGroup, stepTitle, stepImage, stepInstruction, recipeId, genericRecipeStep, instructionVar1, instructionVar2,
  instructionVar3,instructionVar4, instructionVar5, timerVar1, timerVar2, timerVar3, timerVar4, timerVar5 ) VALUES
  (
    6, 1, 'Serve', 'SPCS-001-step-06.webp',
    'When the salmon is cooked, remove from the oven and drizzle on the honey.  TIP: if your honey has harded pop it in a bowl of hot water for 1 min.  Spread the honey across the fish witht he back of a spoon and then sprinkle the pistachios inton the salmon.  Carefully place on top of the layer of rocket and dig in.',
    'SPCS-001',null, null,null,null,null,null,null,null,null,null,null
  );