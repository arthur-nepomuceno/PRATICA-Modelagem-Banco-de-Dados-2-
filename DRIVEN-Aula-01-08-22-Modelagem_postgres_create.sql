CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"email" varchar(255) NOT NULL UNIQUE,
	"password" varchar(255) NOT NULL,
	"cpf" integer NOT NULL UNIQUE,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" double NOT NULL,
	"mainPhotoId" integer NOT NULL UNIQUE,
	"size" TEXT NOT NULL,
	"categoryId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productCategories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "productCategories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"productId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"totalValue" double NOT NULL,
	"status" TEXT NOT NULL,
	"date" DATE NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productPhotos" (
	"id" serial NOT NULL,
	"uri" varchar(255) NOT NULL,
	"categoryId" integer NOT NULL,
	"isMainPhoto" BOOLEAN NOT NULL DEFAULT 'false',
	CONSTRAINT "productPhotos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("mainPhotoId") REFERENCES "productPhotos"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("categoryId") REFERENCES "productCategories"("id");


ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "productPhotos" ADD CONSTRAINT "productPhotos_fk0" FOREIGN KEY ("categoryId") REFERENCES "productCategories"("id");






