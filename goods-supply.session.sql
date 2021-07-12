/* Creating GOODS table */
DROP TABLE IF EXISTS "goods" CASCADE;
CREATE TABLE "goods" (
  "id" SERIAL PRIMARY KEY,
  "item_name" VARCHAR(256) NOT NULL CHECK("item_name" != '') UNIQUE,
  "price" INTEGER NOT NULL CHECK("price" > 0)
);
/* Creating ORDERS table */
DROP TABLE IF EXISTS "orders" CASCADE;
CREATE TABLE "orders" (
  "id" SERIAL PRIMARY KEY,
  "customer_name" VARCHAR(128) NOT NULL CHECK("customer_name" != ''),
  "customer_address" VARCHAR(256) NOT NULL CHECK("customer_address" != ''),
  "customer_phone" VARCHAR(16) NOT NULL CHECK("customer_phone" != ''),
  "contract_number" VARCHAR(512) NOT NULL CHECK("contract_number" != ''),
  "contract_date" DATE NOT NULL DEFAULT CURRENT_DATE,
  "product_name" TEXT REFERENCES "goods" ("item_name"),
  "product_quantity" INTEGER NOT NULL CHECK("product_quantity" > 0),
  UNIQUE ("product_name", "contract_number")
);
/* Create SHIPMENT table */
DROP TABLE IF EXISTS "shipment" CASCADE;
CREATE TABLE "shipment" (
  "id" SERIAL PRIMARY KEY,
  "order_id" INTEGER REFERENCES "orders" ("id"),
  "date" DATE NOT NULL DEFAULT CURRENT_DATE,
  "goods_quantity" INTEGER NOT NULL CHECK("goods_quantity" > 0),
  UNIQUE("order_id", "date")
);