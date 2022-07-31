/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 15.2 		*/
/*  Created On : 31-июл-2022 14:56:33 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Drop Tables */

DROP TABLE IF EXISTS "Contract" CASCADE
;

DROP TABLE IF EXISTS contract_contractor CASCADE
;

DROP TABLE IF EXISTS "Contract_topic" CASCADE
;

DROP TABLE IF EXISTS "Contractor" CASCADE
;

DROP TABLE IF EXISTS "Object" CASCADE
;

DROP TABLE IF EXISTS "Object_type" CASCADE
;

DROP TABLE IF EXISTS "Request" CASCADE
;

DROP TABLE IF EXISTS "Request_contract" CASCADE
;

DROP TABLE IF EXISTS request_implementer CASCADE
;

DROP TABLE IF EXISTS "Request_source" CASCADE
;

DROP TABLE IF EXISTS "Request_status" CASCADE
;

DROP TABLE IF EXISTS "Work_type" CASCADE
;

/* Create Tables */

CREATE TABLE "Contract"
(
	"Date" date NULL,
	"Description" varchar NULL,
	"Due_to" date NULL,
	"Number" varchar NULL,
	"Sum" numeric NULL,
	"ContractID" varchar NOT NULL,
	"Contract_topicID" varchar NULL
)
;

CREATE TABLE contract_contractor
(
	"ContractorID" varchar NULL,
	"ContractID" varchar NULL
)
;

CREATE TABLE "Contract_topic"
(
	"Topic_name" varchar NULL,
	"Contract_topicID" varchar NOT NULL
)
;

CREATE TABLE "Contractor"
(
	"Name" varchar NULL,
	"ContractorID" varchar NOT NULL
)
;

CREATE TABLE "Object"
(
	"Address" varchar NULL,
	"Name" varchar NULL,
	"ObjectID" varchar NOT NULL,
	"Object_typeID" varchar NULL
)
;

CREATE TABLE "Object_type"
(
	"Object_type_name" varchar NULL,
	"Object_typeID" varchar NOT NULL
)
;

CREATE TABLE "Request"
(
	"Number" varchar NULL,
	"Registration_date" date NULL,
	"RequestID" varchar NOT NULL,
	"ContractorID" varchar NULL,
	"ObjectID" varchar NULL,
	"Request_sourceID" varchar NULL,
	"Work_typeID" varchar NULL,
	"Request_statusID" varchar NULL
)
;

CREATE TABLE "Request_contract"
(
	"Is_active" boolean NULL,
	"Request_contractID" varchar NOT NULL,
	"ContractID" varchar NULL,
	"RequestID" varchar NULL
)
;

CREATE TABLE request_implementer
(
	"ContractorID" varchar NULL,
	"RequestID" varchar NULL
)
;

CREATE TABLE "Request_source"
(
	"Source_name" varchar NULL,
	"Request_sourceID" varchar NOT NULL
)
;

CREATE TABLE "Request_status"
(
	"Status_name" varchar NULL,
	"Request_statusID" varchar NOT NULL
)
;

CREATE TABLE "Work_type"
(
	"Work_type_name" varchar NULL,
	"Work_typeID" varchar NOT NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE "Contract" ADD CONSTRAINT "PK_Contract"
	PRIMARY KEY ("ContractID")
;

ALTER TABLE "Contract_topic" ADD CONSTRAINT "PK_Contract_topic"
	PRIMARY KEY ("Contract_topicID")
;

ALTER TABLE "Contractor" ADD CONSTRAINT "PK_Contractor"
	PRIMARY KEY ("ContractorID")
;

ALTER TABLE "Object" ADD CONSTRAINT "PK_Object"
	PRIMARY KEY ("ObjectID")
;

ALTER TABLE "Object_type" ADD CONSTRAINT "PK_Object_type"
	PRIMARY KEY ("Object_typeID")
;

ALTER TABLE "Request" ADD CONSTRAINT "PK_Request"
	PRIMARY KEY ("RequestID")
;

ALTER TABLE "Request_contract" ADD CONSTRAINT "PK_Request_contract"
	PRIMARY KEY ("Request_contractID")
;

ALTER TABLE "Request_source" ADD CONSTRAINT "PK_Request_source"
	PRIMARY KEY ("Request_sourceID")
;

ALTER TABLE "Request_status" ADD CONSTRAINT "PK_Request_status"
	PRIMARY KEY ("Request_statusID")
;

ALTER TABLE "Work_type" ADD CONSTRAINT "PK_Work_type"
	PRIMARY KEY ("Work_typeID")
;

/* Create Foreign Key Constraints */

ALTER TABLE "Contract" ADD CONSTRAINT "FK_Contract_Contract_topic"
	FOREIGN KEY ("Contract_topicID") REFERENCES "Contract_topic" ("Contract_topicID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE contract_contractor ADD CONSTRAINT "FK_contract_contractor_contractor"
	FOREIGN KEY ("ContractorID") REFERENCES "Contractor" ("ContractorID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE contract_contractor ADD CONSTRAINT "FK_contract_contractor_contract"
	FOREIGN KEY ("ContractID") REFERENCES "Contract" ("ContractID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Object" ADD CONSTRAINT "FK_Object_Object_type"
	FOREIGN KEY ("Object_typeID") REFERENCES "Object_type" ("Object_typeID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Request" ADD CONSTRAINT "FK_request_customer"
	FOREIGN KEY ("ContractorID") REFERENCES "Contractor" ("ContractorID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Request" ADD CONSTRAINT "FK_Request_Object"
	FOREIGN KEY ("ObjectID") REFERENCES "Object" ("ObjectID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Request" ADD CONSTRAINT "FK_Request_Request_source"
	FOREIGN KEY ("Request_sourceID") REFERENCES "Request_source" ("Request_sourceID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Request" ADD CONSTRAINT "FK_Request_Work_type"
	FOREIGN KEY ("Work_typeID") REFERENCES "Work_type" ("Work_typeID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Request" ADD CONSTRAINT "FK_Request_Request_status"
	FOREIGN KEY ("Request_statusID") REFERENCES "Request_status" ("Request_statusID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Request_contract" ADD CONSTRAINT "FK_Request_contract_Contract"
	FOREIGN KEY ("ContractID") REFERENCES "Contract" ("ContractID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Request_contract" ADD CONSTRAINT "FK_Request_contract_Request"
	FOREIGN KEY ("RequestID") REFERENCES "Request" ("RequestID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE request_implementer ADD CONSTRAINT "FK_request_implementer_contractor"
	FOREIGN KEY ("ContractorID") REFERENCES "Contractor" ("ContractorID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE request_implementer ADD CONSTRAINT "FK_request_implementer_request"
	FOREIGN KEY ("RequestID") REFERENCES "Request" ("RequestID") ON DELETE No Action ON UPDATE No Action
;

/* Create Table Comments, Sequences for Autonumber Columns */

COMMENT ON TABLE "Request"
	IS 'Договор'
;
