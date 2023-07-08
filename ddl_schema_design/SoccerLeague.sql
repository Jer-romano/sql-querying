-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1jf4Zd
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP DATABASE IF EXISTS league_db;
CREATE DATABASE league_db;
\c league_db

CREATE TABLE "Teams" (
    "id" SERIAL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "coach" varchar(30)  NOT NULL,
    "email" varchar(50)  NOT NULL,
    "ranking" int   NOT NULL
);

CREATE TABLE "Goals" (
    "id" SERIAL PRIMARY KEY,
    "playerID" int NOT NULL,
    "teamID" int  NOT NULL,
    "gameID" int  NOT NULL,
    "minute" int  NOT NULL
);

CREATE TABLE "Games" (
    "id" SERIAL PRIMARY KEY,
    "team1" int  NOT NULL,
    "team1_score" int  NOT NULL,
    "team2" int  NOT NULL,
    "team2_score" int  NOT NULL,
    "ref1" int  NOT NULL,
    "ref2" int,
    "seasonID" int  NOT NULL
);

CREATE TABLE "Referees" (
    "id" SERIAL PRIMARY KEY,
    "name" varchar(50) NOT NULL
);

CREATE TABLE "Players" (
    "id" SERIAL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "teamID" int  NOT NULL
);

CREATE TABLE "Season" (
    "id" SERIAL PRIMARY KEY,
    "year" int  NOT NULL,
    "start_date" date NOT NULL,
    "end_date" date  NOT NULL
);

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_playerID" FOREIGN KEY("playerID")
REFERENCES "Players" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_teamID" FOREIGN KEY("teamID")
REFERENCES "Teams" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_gameID" FOREIGN KEY("gameID")
REFERENCES "Games" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_team1" FOREIGN KEY("team1")
REFERENCES "Teams" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_team2" FOREIGN KEY("team2")
REFERENCES "Teams" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_ref1" FOREIGN KEY("ref1")
REFERENCES "Referees" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_ref2" FOREIGN KEY("ref2")
REFERENCES "Referees" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_seasonID" FOREIGN KEY("seasonID")
REFERENCES "Season" ("id");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_teamID" FOREIGN KEY("teamID")
REFERENCES "Teams" ("id");

CREATE INDEX "idx_Teams_name"
ON "Teams" ("name");

CREATE INDEX "idx_Referees_name"
ON "Referees" ("name");

CREATE INDEX "idx_Players_name"
ON "Players" ("name");

