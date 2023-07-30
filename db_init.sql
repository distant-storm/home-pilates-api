SET foreign_key_checks = 0;
DROP TABLE IF EXISTS pilates_exercise_body_part;
DROP TABLE IF EXISTS body_part;
DROP TABLE IF EXISTS pilates_exercise;
SET foreign_key_checks = 1;

CREATE TABLE pilates_exercise
(
    name varchar(255) NOT NULL,
    label varchar(255),
    image varchar(1024),
    time int,
    description varchar(255),
    reps int,
    isWarmup boolean,
    isCooldown boolean,
    step1 varchar(255),
    step2 varchar(255),
    step3 varchar(255),
    step4 varchar(255),
    step5 varchar(255),
    step6 varchar(255),
    step7 varchar(255),
    step8 varchar(255),
    step9 varchar(255),
    step10 varchar(255),
    PRIMARY KEY (name)
);

CREATE TABLE body_part
(
    name varchar(255) NOT NULL,
    label varchar(255) NOT NULL,
    PRIMARY KEY (name)
);

CREATE TABLE pilates_exercise_body_part
(
    id int NOT NULL AUTO_INCREMENT,
    pilates_exercise varchar(255) NOT NULL,
    body_part varchar(255) NOT NULL,
    FOREIGN KEY (pilates_exercise) REFERENCES pilates_exercise(name),
    FOREIGN KEY (body_part) REFERENCES body_part(name),
    PRIMARY KEY (id)
);
