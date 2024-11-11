-- 作成
CREATE DATABASE auction;
\c auction

-- テストデータ生成
CREATE TABLE "auctions" (
	"auction_id" UUID NOT NULL UNIQUE,
	"created_at" TIMESTAMP NOT NULL,
	"updated_at" TIMESTAMP NOT NULL,
	"employee_id" UUID NOT NULL,
	"duration" INTERVAL NOT NULL,
	"begin_time" TIMESTAMP NOT NULL,
	PRIMARY KEY("auction_id")
);


CREATE TABLE "stocks" (
	"stock_id" UUID NOT NULL UNIQUE,
	"created_at" TIMESTAMP NOT NULL,
	"updated_at" TIMESTAMP NOT NULL,
	"auction_id" UUID NOT NULL,
	"vehicle_id" UUID NOT NULL,
	"sold_status_id" UUID NOT NULL,
	"begin_time" TIMESTAMP NOT NULL,
	PRIMARY KEY("stock_id")
);


CREATE TABLE "vehicles" (
	"vehicle_id" UUID NOT NULL UNIQUE,
	"created_at" TIMESTAMP NOT NULL,
	"update_at" TIMESTAMP NOT NULL,
	"series_id" UUID NOT NULL,
	"employee_id" UUID NOT NULL,
	PRIMARY KEY("vehicle_id")
);


CREATE TABLE "series" (
	"series_id" UUID NOT NULL UNIQUE,
	"name" VARCHAR(255),
	PRIMARY KEY("series_id")
);


CREATE TABLE "employees" (
	"employee_id" UUID NOT NULL UNIQUE,
	"name" VARCHAR(255) NOT NULL,
	"job_type_id" UUID NOT NULL,
	PRIMARY KEY("employee_id")
)
INSERT INTO "employees" ("employee_id","name","job_type_id") VALUES
(cd6c194b-aecb-8bac-c7cf-ad569ee9d5ea,'sample1',bf714521-b003-b0c0-1eeb-9ca10b102406),
(2c17a0db-6e8f-46cd-28d4-4b7e2f5ac535,'sample2',3af3d477-08b7-88b4-9209-085289b3200e),
(311c98c1-a4a7-bd35-47e6-6afd4164f746,'sample3',af86a3f5-58ea-86e1-89ce-9fcf543428a5),
(d010edab-2d99-5d27-d6a1-db89fabd7657,'sample4',a126cd31-2c67-c62d-b3db-2a26e59a7d6c),
(2ae3f345-6b17-7171-612d-de2f5a23cd98,'sample5',1b77802c-6db4-bf84-3d64-7fee92a6eb93);


CREATE TABLE "job_types" (
	"job_type_id" UUID NOT NULL UNIQUE,
	"name" VARCHAR(255) NOT NULL,
	PRIMARY KEY("job_type_id")
)
INSERT INTO "job_types" ("job_type_id","name") VALUES
(bf714521-b003-b0c0-1eeb-9ca10b102406,'車両調達担当者'),
(3af3d477-08b7-88b4-9209-085289b3200e,'経理'),
(af86a3f5-58ea-86e1-89ce-9fcf543428a5,'総務'),
(a126cd31-2c67-c62d-b3db-2a26e59a7d6c,'車両調達担当者'),
(1b77802c-6db4-bf84-3d64-7fee92a6eb93,'総務');

CREATE TABLE "notifications" (
	"notification_id" UUID NOT NULL UNIQUE,
	"title" VARCHAR(255) NOT NULL,
	"body" VARCHAR(255),
	"created_at" TIMESTAMP NOT NULL,
	"updated_at" TIMESTAMP NOT NULL,
	"employee_id" UUID NOT NULL,
	"deploy_schedule" TIMESTAMP,
	"deploy_status_id" UUID,
	PRIMARY KEY("notification_id")
)
INSERT INTO "notifications" ("notification_id","title","body","created_at","updated_at","employee_id","deploy_schedule","deploy_status_id") VALUES
(e0ad24ca-34d6-5c63-87d4-51ea39a597fe,"タイトル1","本文1",2024-11-5 12:00,2024-11-5 12:00,cd6c194b-aecb-8bac-c7cf-ad569ee9d5ea,2024-11-5 12:00,6200ea20-fd84-480e-d887-62b4b3c37876),
(4dd26aee-d823-a7c0-4f8b-3cab7428dd29,"タイトル2","本文2",2024-11-5 12:00,2024-11-5 12:00,2c17a0db-6e8f-46cd-28d4-4b7e2f5ac535,2024-11-5 12:00,3f6f6b72-dbbc-845d-f056-31ca0933d51c),
(93b2cc4f-af6f-02b4-3c6b-f63d6d3fe6f2,"タイトル3","本文3",2024-11-5 12:00,2024-11-5 12:00,311c98c1-a4a7-bd35-47e6-6afd4164f746,2024-11-5 12:00,5ffd534c-29c6-bca8-47ea-e685bf361e09),
(42402878-df77-9149-01e0-4139080f458c,"タイトル4","本文4",2024-11-5 12:00,2024-11-5 12:00,d010edab-2d99-5d27-d6a1-db89fabd7657,2024-11-5 12:00,9c079ce2-11f7-404e-0aac-f6667dbbf349),
(80eb70cf-1075-c29c-86b1-ed6d0e26dceb,"タイトル5","本文5",2024-11-5 12:00,2024-11-5 12:00,2ae3f345-6b17-7171-612d-de2f5a23cd98,2024-11-5 12:00,805fef9c-39c0-4840-ba2d-77a7b844e476);

CREATE TABLE "deploy_statuses" (
	"deploy_status_id" UUID NOT NULL UNIQUE,
	"name" VARCHAR(255) NOT NULL,
	PRIMARY KEY("deploy_status_id")
);


CREATE TABLE "contacts" (
	"contact_id" UUID NOT NULL UNIQUE,
	"customer_id" UUID NOT NULL,
	"title" VARCHAR(255) NOT NULL,
	"body" VARCHAR(255) NOT NULL,
	"employee_id" UUID,
	"created_at" TIMESTAMP,
	"updated_at" TIMESTAMP,
	PRIMARY KEY("contact_id")
);


CREATE TABLE "sold_statuses" (
	"sold_status_id" UUID NOT NULL UNIQUE,
	"name" VARCHAR(255) NOT NULL,
	PRIMARY KEY("sold_status_id")
);


CREATE TABLE "bids" (
	"bid_id" UUID NOT NULL UNIQUE,
	"customer_id" UUID NOT NULL,
	"stock_id" UUID NOT NULL,
	"price" NUMERIC,
	"created_at" TIMESTAMP,
	PRIMARY KEY("bid_id")
);


CREATE TABLE "customers" (
	"customer_id" UUID NOT NULL UNIQUE,
	"name" VARCHAR(255) NOT NULL,
	"email" VARCHAR(255) NOT NULL,
	"prefecture" VARCHAR(255),
	"city" VARCHAR(255),
	"address" VARCHAR(255),
	"post_code" VARCHAR(7),
	"password_hash" VARCHAR(255) NOT NULL,
	"created_at" TIMESTAMP,
	"updated_at" TIMESTAMP,
	PRIMARY KEY("customer_id")
);


ALTER TABLE "stocks"
ADD FOREIGN KEY("auction_id") REFERENCES "auctions"("auction_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "stocks"
ADD FOREIGN KEY("vehicle_id") REFERENCES "vehicles"("vehicle_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "vehicles"
ADD FOREIGN KEY("series_id") REFERENCES "series"("series_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "vehicles"
ADD FOREIGN KEY("employee_id") REFERENCES "employees"("employee_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "employees"
ADD FOREIGN KEY("job_type_id") REFERENCES "job_types"("job_type_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "auctions"
ADD FOREIGN KEY("employee_id") REFERENCES "employees"("employee_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "notifications"
ADD FOREIGN KEY("employee_id") REFERENCES "employees"("employee_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "notifications"
ADD FOREIGN KEY("deploy_status_id") REFERENCES "deploy_statuses"("deploy_status_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "contacts"
ADD FOREIGN KEY("employee_id") REFERENCES "employees"("employee_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "stocks"
ADD FOREIGN KEY("sold_status_id") REFERENCES "sold_statuses"("sold_status_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "bids"
ADD FOREIGN KEY("stock_id") REFERENCES "stocks"("stock_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "bids"
ADD FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "contacts"
ADD FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
