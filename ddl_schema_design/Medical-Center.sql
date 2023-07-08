-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1jf4Zd
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP DATABASE IF EXISTS medcenter_db;
CREATE DATABASE medcenter_db;
\c medcenter_db

CREATE TABLE "patient" (
    "id" SERIAL PRIMARY KEY,
    "name" varchar(50)   NOT NULL,
    "address1" varchar(50)   NOT NULL,
    "phone" varchar(15)   NOT NULL,
    "dob" varchar(10)   NOT NULL
);

CREATE TABLE "doctor" (
    "id" SERIAL PRIMARY KEY,
    "name" varchar(50)  NOT NULL,
    "dept" varchar(25)  NOT NULL
);

CREATE TABLE "diagnosis" (
    "id" SERIAL PRIMARY KEY,
    "doctor_id" INTEGER REFERENCES doctor(id),
    "patient_id" INTEGER REFERENCES patient(id),
    "description" text   NOT NULL,
    "date" date   NOT NULL
);

CREATE TABLE "visits" (
    "id" SERIAL PRIMARY KEY,
    "doctor_id" INTEGER NOT NULL REFERENCES doctor(id),
    "patient_id" INTEGER REFERENCES patient(id),
    "date" date   NOT NULL,
    "diagnosis_id" INTEGER REFERENCES diagnosis(id),
    "dept" varchar(50)
);

INSERT INTO doctor(name, dept) VALUES ('John Smith', 'Cardiology');
INSERT INTO patient(name, address1, phone, dob)
 VALUES ('Alice Becker', '123 Chestnut St', '324-546-1111', '10-11-1992');
 INSERT INTO diagnosis(doctor_id, patient_id, description, date)
 VALUES (1, 1, 'Acute rheumatoid arthritis', '03-19-2020');

-- ALTER TABLE "visits" ADD CONSTRAINT "fk_visits_doctorID" FOREIGN KEY("doctorID")
-- REFERENCES "doctor" ("id");

-- ALTER TABLE "visits" ADD CONSTRAINT "fk_visits_patientID" FOREIGN KEY("patientID")
-- REFERENCES "patient" ("id");

-- ALTER TABLE "visits" ADD CONSTRAINT "fk_visits_diagnosisID" FOREIGN KEY("diagnosisID")
-- REFERENCES "diagnosis" ("id");

-- ALTER TABLE "diagnosis" ADD CONSTRAINT "fk_diagnosis_patientID" FOREIGN KEY("patientID")
-- REFERENCES "patient" ("id");

-- ALTER TABLE "diagnosis" ADD CONSTRAINT "fk_diagnosis_doctorID" FOREIGN KEY("doctorID")
-- REFERENCES "doctor" ("id");

CREATE INDEX "idx_patient_Name"
ON "patient" ("name");

CREATE INDEX "idx_doctor_Name"
ON "doctor" ("name");

