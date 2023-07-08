-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1jf4Zd
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP DATABASE IF EXISTS craigslist_db;
CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE "users" (
    "id" SERIAL PRIMARY KEY,
    "username" varchar(30)  NOT NULL,
    "password" varchar(25)  NOT NULL,
    "email" varchar(30)  NOT NULL,
    "preferredRegionId" int
);

CREATE TABLE "regions" (
    "id" SERIAL PRIMARY KEY,
    "name" varchar(30)  NOT NULL
);

CREATE TABLE "posts" (
    "id" SERIAL PRIMARY KEY,
    "userID" int  NOT NULL,
    "title" varchar(50)   NOT NULL,
    "text" TEXT   NOT NULL,
    "regionID" int   NOT NULL,
    "category1" int   NOT NULL,
    "category2" int,
    "category3" int
);

CREATE TABLE "categories" (
    "id" SERIAL PRIMARY KEY,
    "name" varchar(25) NOT NULL
);

ALTER TABLE "users" ADD CONSTRAINT "fk_users_preferredRegionId" FOREIGN KEY("preferredRegionId")
REFERENCES "regions" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_userID" FOREIGN KEY("userID")
REFERENCES "users" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_regionID" FOREIGN KEY("regionID")
REFERENCES "regions" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_category1" FOREIGN KEY("category1")
REFERENCES "categories" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_category2" FOREIGN KEY("category2")
REFERENCES "categories" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_category3" FOREIGN KEY("category3")
REFERENCES "categories" ("id");

CREATE INDEX "idx_users_username"
ON "users" ("username");

CREATE INDEX "idx_users_password"
ON "users" ("password");

