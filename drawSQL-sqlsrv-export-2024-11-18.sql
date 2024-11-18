CREATE TABLE "coustomers"(
    "email" BIGINT NOT NULL,
    "name" BIGINT NOT NULL,
    "cid" BIGINT NOT NULL,
    "address" BIGINT NOT NULL,
    "phone" BIGINT NOT NULL
);
CREATE INDEX "coustomers_name_index" ON
    "coustomers"("name");
ALTER TABLE
    "coustomers" ADD CONSTRAINT "coustomers_cid_primary" PRIMARY KEY("cid");
CREATE TABLE "factor"(
    "quantity" BIGINT NOT NULL,
    "cid" BIGINT NOT NULL,
    "sid" BIGINT NOT NULL,
    "total-price" BIGINT NOT NULL,
    "pid" BIGINT NOT NULL,
    "fid" BIGINT NOT NULL
);
ALTER TABLE
    "factor" ADD CONSTRAINT "factor_fid_primary" PRIMARY KEY("fid");
CREATE TABLE "sells"(
    "TotalAmount" BIGINT NOT NULL,
    "cid" BIGINT NOT NULL,
    "sdate" BIGINT NOT NULL,
    "sid" BIGINT NOT NULL
);
ALTER TABLE
    "sells" ADD CONSTRAINT "sells_sid_primary" PRIMARY KEY("sid");
CREATE TABLE "product"(
    "pid" BIGINT NOT NULL,
    "category" BIGINT NOT NULL,
    "mojodi" BIGINT NOT NULL,
    "name" BIGINT NOT NULL
);
ALTER TABLE
    "product" ADD CONSTRAINT "product_pid_primary" PRIMARY KEY("pid");
CREATE INDEX "product_name_index" ON
    "product"("name");
ALTER TABLE
    "factor" ADD CONSTRAINT "factor_fid_foreign" FOREIGN KEY("fid") REFERENCES "product"("pid");
ALTER TABLE
    "sells" ADD CONSTRAINT "sells_cid_foreign" FOREIGN KEY("cid") REFERENCES "coustomers"("cid");
ALTER TABLE
    "factor" ADD CONSTRAINT "factor_sid_foreign" FOREIGN KEY("sid") REFERENCES "sells"("sid");
ALTER TABLE
    "factor" ADD CONSTRAINT "factor_cid_foreign" FOREIGN KEY("cid") REFERENCES "coustomers"("cid");
ALTER TABLE
    "factor" ADD CONSTRAINT "factor_pid_foreign" FOREIGN KEY("pid") REFERENCES "product"("pid");