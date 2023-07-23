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
