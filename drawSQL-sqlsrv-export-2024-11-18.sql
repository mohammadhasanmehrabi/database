CREATE TABLE "coustomers"(
    "email" TEXT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "CustomerID" INT NOT NULL,
    "address" TEXT NOT NULL,
    "phone" INT NOT NULL
);
CREATE INDEX "coustomers_name_index" ON
    "coustomers"("name");
ALTER TABLE
    "coustomers" ADD CONSTRAINT "coustomers_customerid_primary" PRIMARY KEY("CustomerID");
CREATE TABLE "factor"(
    "quantity" INT NOT NULL,
    "CustomerID" INT NOT NULL,
    "SaleID" INT NOT NULL,
    "total-price" INT NOT NULL,
    "ProductID" INT NOT NULL,
    "factorID" INT NOT NULL
);
ALTER TABLE
    "factor" ADD CONSTRAINT "factor_factorid_primary" PRIMARY KEY("factorID");
CREATE TABLE "sells"(
    "TotalAmount" INT NOT NULL,
    "CustomerID" INT NOT NULL,
    "SaleDate" INT NOT NULL,
    "SaleID" INT NOT NULL
);
ALTER TABLE
    "sells" ADD CONSTRAINT "sells_saleid_primary" PRIMARY KEY("SaleID");
CREATE TABLE "product"(
    "ProductID" INT NOT NULL,
    "category" VARCHAR(255) NOT NULL,
    "mojodi" INT NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "product" ADD CONSTRAINT "product_productid_primary" PRIMARY KEY("ProductID");
CREATE INDEX "product_name_index" ON
    "product"("name");
ALTER TABLE
    "sells" ADD CONSTRAINT "sells_customerid_foreign" FOREIGN KEY("CustomerID") REFERENCES "coustomers"("CustomerID");
ALTER TABLE
    "factor" ADD CONSTRAINT "factor_saleid_foreign" FOREIGN KEY("SaleID") REFERENCES "sells"("SaleID");
ALTER TABLE
    "factor" ADD CONSTRAINT "factor_productid_foreign" FOREIGN KEY("ProductID") REFERENCES "product"("ProductID");
ALTER TABLE
    "factor" ADD CONSTRAINT "factor_customerid_foreign" FOREIGN KEY("CustomerID") REFERENCES "coustomers"("CustomerID");