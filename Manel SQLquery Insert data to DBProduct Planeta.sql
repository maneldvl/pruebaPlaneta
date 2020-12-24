
--Script SQL para inserción de datos en las tablas de la base de datos

--NOTA: Todos los comentarios en código se harán por norma en Inglés esto unifica el trabajo en equipos internacionales así como los
-- nombres de las bases de datos, las tablas y campos 

IF EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'DB_Products' )
	BEGIN
	use DB_Products
	
	--Insert data in Table T_ProductSector
	IF EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'T_ProductSector' )
		BEGIN
		
		DELETE FROM T_ProductSector;
		
		DECLARE @PRODUCT_SECTOR_FIELDS table(
				ROWID						INT NOT NULL identity(1,1), --ProductSector_ID
				ProductSector_IDCODE		INT NOT NULL,
				ProductSector_Name			VARCHAR(100), 
				ProductSector_Updated_Date  DATETIME
				);  

		--Example Insert Structure data in T_ProductSector
		--INSERT into @@PRODUCT_SECTOR_FIELDS VALUES (ProductSector_Name, ProductSector_IDCODE, ProductSector_Updated_Date);

		--INSERT NEW DATA HERE
		INSERT INTO @PRODUCT_SECTOR_FIELDS VALUES ('Libros',						10,GETDATE());
		INSERT INTO @PRODUCT_SECTOR_FIELDS VALUES ('Actualidad y entretenimiento',	20,GETDATE());
		INSERT INTO @PRODUCT_SECTOR_FIELDS VALUES ('Formación',						30,GETDATE());
		INSERT INTO @PRODUCT_SECTOR_FIELDS VALUES ('Librerías',						40,GETDATE());
		
		END

	--Creating Table T_ProductCategory
	IF EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'T_ProductCategory' )
		BEGIN
		--CREATE TABLE T_ProductCategory(
		--ProductCategory_ID INT PRIMARY KEY IDENTITY (1, 1),
		--ProductCategory_Name NVARCHAR(100) NOT NULL,
		--ProductCategory_Updated_Date DATETIME NOT NULL
		--	);
		DELETE FROM T_ProductCategory;
		
		DECLARE @PRODUCT_CATEGORY_FIELDS table(
				ROWID							INT NOT NULL identity(1,1), --ProductCategory_ID
				ProductSector_IDCODE			INT NOT NULL,
				ProductCategory_IDCODE			INT NOT NULL,
				ProductCategory_Name			VARCHAR(100), 
				ProductCategory_Updated_Date    DATETIME
				);  

		--Example Insert Structure data in T_ProductCategory
		--INSERT into @@PRODUCT_CATEGORY_FIELDS VALUES (ProductSector_IDCODE, ProductCategory_IDCODE, ProductCategory_Name, ProductCategory_Updated_Date);
		--Libros
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Libros de Texto ESO 1',		10, 10,		GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Novelas de Misterio',			10, 20,		GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Novelas de Aventuras',		10, 30,		GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Novelas de Terror',			10, 40,		GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Novelas de Western',			10, 50,		GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Novelas de Ciencia Ficción',	10, 100,	GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Novela Negra',				10, 110,	GETDATE());

		--Actualidad y entretenimiento
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Prensa',						20, 10,		GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('TV',							20, 20,		GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Radio',						20, 30,		GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('REvistas',					20, 40,		GETDATE());

		--Formación
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Formación Superior',			30, 10,		GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Educación',					30, 20,		GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Formación para Profesionales',30, 30,		GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Publicaciones',				30, 40,		GETDATE());

		--Librerías
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Tiendas de Libros',			40, 10,		GETDATE());
		INSERT INTO @PRODUCT_CATEGORY_FIELDS VALUES ('Clubes de lectura',			40, 20,		GETDATE());
	
		END

	--Creating Table T_Product
	IF NOT EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'T_Product' )
		BEGIN
		
		DELETE FROM T_Product;
		
		DECLARE @PRODUCT_FIELDS table(
				ROWID							INT NOT NULL identity(1,1), --Product_ID
				Product_ProductSectorIDCODE		INT NOT NULL,
				Product_ProductCategoryIDCODE	INT NOT NULL,
				Product_REF						NVARCHAR(100) NOT NULL,
				Product_BARCODE					NVARCHAR(100) NOT NULL,
				Product_Creation_Date			DATETIME NOT NULL,
				Product_Updated_Date			DATETIME NOT NULL
				);  

		--Example Insert Structure data in T_ProductCategory
		--INSERT into @CONTROLS_FORM VALUES (Product_ProductSectorIDCODE, ProductSector_IDCODE, ProductCategory_IDCODE, Product_REF, Product_BARCODE, Product_Creation_Date, Product_Updated_Date);
		--Libros
		INSERT INTO @PRODUCT_FIELDS VALUES (10, 40, 'REF-1', '978020137961', 'El asesino sangriento del Planeta Perdido 1',	GETDATE(),	GETDATE());
		INSERT INTO @PRODUCT_FIELDS VALUES (10, 40, 'REF-2', '978020137962', 'El asesino sangriento del Planeta Perdido 2',	GETDATE(),	GETDATE());
		INSERT INTO @PRODUCT_FIELDS VALUES (10, 40, 'REF-3', '978020137963', 'El asesino sangriento del Planeta Perdido 3',	GETDATE(),	GETDATE());
		INSERT INTO @PRODUCT_FIELDS VALUES (10, 40, 'REF-4', '978020137964', 'El asesino sangriento del Planeta Perdido 4',	GETDATE(),	GETDATE());
		INSERT INTO @PRODUCT_FIELDS VALUES (10, 40, 'REF-5', '978020137965', 'El asesino sangriento del Planeta Perdido 5',	GETDATE(),	GETDATE());
		INSERT INTO @PRODUCT_FIELDS VALUES (10, 40, 'REF-6', '978020137966', 'El asesino sangriento del Planeta Perdido 6',	GETDATE(),	GETDATE());
		
		END 

	END 
