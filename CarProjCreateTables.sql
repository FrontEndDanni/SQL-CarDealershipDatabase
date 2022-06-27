CREATE TABLE "city" (
  "city_id" SERIAL,
  "city_name" VARCHAR(45),
  PRIMARY KEY ("city_id")
);

CREATE TABLE "address" (
  "address_id" SERIAL,
  "city_id" INTEGER,
  "postal_code" VARCHAR(45),
  "address_name" VARCHAR(45),
  PRIMARY KEY ("address_id"),
  CONSTRAINT "FK_address.city_id"
    FOREIGN KEY ("city_id")
      REFERENCES "city"("city_id")
);

CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(45),
  "last_name" VARCHAR(45),
  "email" VARCHAR(45),
  "address_id" INTEGER,
  "phone" VARCHAR(20),
  PRIMARY KEY ("customer_id"),
  CONSTRAINT "FK_Customer.address_id"
    FOREIGN KEY ("address_id")
      REFERENCES "address"("address_id")
);

CREATE TABLE "parts_inventory" (
  "part_id" SERIAL,
  "part_name" VARCHAR(45),
  "amount" NUMERIC(6, 2),
  PRIMARY KEY ("part_id")
);

CREATE TABLE "staff" (
  "staff_id" INTEGER,
  "first_name" VARCHAR(45),
  "last_name" VARCHAR(45),
  "email" VARCHAR(45),
  "password" VARCHAR(45),
  PRIMARY KEY ("staff_id")
);

CREATE TABLE "car" (
  "car_id" SERIAL,
  "serial_number" INTEGER,
  "make" VARCHAR(15),
  "model" VARCHAR(15),
  "year" DATE,
  "used_or_new" BOOLEAN,
  PRIMARY KEY ("car_id")
);

CREATE TABLE "parts_log" (
  "parts_log_id" SERIAL,
  "part_id" INTEGER,
  "mechanic_id" INTEGER,
  "invoice_id" INTEGER,
  PRIMARY KEY ("parts_log_id"),
  CONSTRAINT "FK_parts_log.part_id"
    FOREIGN KEY ("part_id")
      REFERENCES "parts_inventory"("part_id"),
  CONSTRAINT "FK_parts_log.invoice_id"
    FOREIGN KEY ("invoice_id")
      REFERENCES "invoice"("invoice_id")
);

CREATE TABLE "service" (
  "service_id" SERIAL,
  "service_type" VARCHAR(20),
  "amount" NUMERIC(6,2),
  PRIMARY KEY ("service_id")
);

CREATE TABLE "service_log" (
  "service_log_id" SERIAL,
  "service_id" INTEGER,
  "mechanic_id" INTEGER,
  "invoice_id" INTEGER,
  PRIMARY KEY ("service_log_id"),
  CONSTRAINT "FK_service_log.invoice_id"
    FOREIGN KEY ("invoice_id")
      REFERENCES "invoice"("invoice_id")
);


CREATE TABLE "invoice" (
  "invoice_id" SERIAL,
  "amount" NUMERIC(8,2),
  "date" DATE,
  "car_id" INTEGER,
  "customer_id" INTEGER,
  "staff_id" INTEGER,
  "ticket_id" INTEGER,
  PRIMARY KEY ("invoice_id"),
  CONSTRAINT "FK_invoice.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "Customer"("customer_id"),
  CONSTRAINT "FK_invoice.staff_id"
    FOREIGN KEY ("staff_id")
      REFERENCES "Staff"("staff_id"),
	CONSTRAINT "FK_invoice.car_id"
		FOREIGN KEY ("car_id")
			REFERENCES "Car"("car_id")
);

