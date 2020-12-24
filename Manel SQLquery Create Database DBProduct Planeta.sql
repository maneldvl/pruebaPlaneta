
--Script SQL para creación de la base de datos y las tablas dentro de la Base de datos, bastará con ejecutarlo
--La estructura creada para el Producto es la siguiente

--NOTA: Todos los comentarios en código se harán por norma en Inglés esto unifica el trabajo en equipos internacionales así como los
-- nombres de las bases de datos, las tablas y campos 

--Table : T_Product
--Product_PKID (PK int, Not Null)
--Product_ProductSectorIDCODE (FK int, Not Null)
--Product_ProductCategoryIDCODE (FK int, Not Null)
--Product_Name (nvarchar(100), Not Null)
--Product_REF (nvarchar(100), Not Null)
--Product_BARCODE (nvarchar(100), Not Null)
--Product_Creation_Date (datetime, not NULL)
--Product_Updated_Date (datetime, not NULL)

--Table : T_ProductSector
--ProductSector_PKID (PK int, Not Null)
--ProductSector_IDCODE (int, Not Null)
--ProductSector_Name (nvarchar(100), Not Null)
--ProductSector_Updated_Date (datetime, not NULL)

--Table : T_ProductCategory
--ProductCategory_PKID (PK int, Not Null)
--ProductCategory_IDCODE (int, Not Null)
--ProductCategory_Name (nvarchar(100), Not Null)
--ProductCategory_Updated_Date (datetime, not NULL)


IF NOT EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'DB_Products' )
	BEGIN
	CREATE DATABASE DB_Products
	END
ELSE
	BEGIN --Start Create Tables on Database DB_Products
	use DB_Products

		--Creating Table T_ProductSector
	IF NOT EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'T_ProductSector' )
		BEGIN
		CREATE TABLE T_ProductSector(
		ProductSector_ID INT PRIMARY KEY IDENTITY (1, 1),
		ProductSector_IDCODE INT NOT NULL,
		ProductSector_Name NVARCHAR(100) NOT NULL,
		ProductSector_Updated_Date DATETIME NOT NULL
		);
		END

	--Creating Table T_ProductCategory
	IF NOT EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'T_ProductCategory' )
		BEGIN
		CREATE TABLE T_ProductCategory(
		ProductCategory_ID INT PRIMARY KEY IDENTITY (1, 1),
		ProductCategory_IDCODE INT NOT NULL,
		ProductCategory_Name NVARCHAR(100) NOT NULL,
		ProductCategory_Updated_Date DATETIME NOT NULL
			);
		END

	--Creating Table T_Product
	IF NOT EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'T_Product' )
		BEGIN
		CREATE TABLE T_Product(
		Product_ID INT PRIMARY KEY IDENTITY (1, 1),
		Product_Name NVARCHAR(100) NOT NULL,
		Product_REF NVARCHAR(100) NOT NULL,
		Product_BARCODE NVARCHAR(100) NOT NULL,
		Product_Creation_Date DATETIME NOT NULL,
		Product_Updated_Date DATETIME NOT NULL,
		Product_ProductSectorIDCODE INT NULL,
		Product_ProductCategoryIDCODE INT NULL
		--CONSTRAINT fk_T_ProductSector FOREIGN KEY (Product_ProductSectorIDCODE) REFERENCES T_ProductSector (ProductSector_IDCODE),
		--CONSTRAINT fk_T_ProductCategory FOREIGN KEY (Product_ProductCategoryIDCODE) REFERENCES T_ProductCategory (ProductCategory_IDCODE)
		);
		END 

	END --End Create Tables on Database DB_Products
