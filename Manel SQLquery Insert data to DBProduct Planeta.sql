
--Script SQL para inserción de datos en la tabla de la base de datos DB_Products

--NOTA: Todos los comentarios en código se harán por norma en Inglés esto unifica el trabajo en equipos internacionales así como los
-- nombres de las bases de datos, las tablas y campos 

IF EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'DB_Products' )
	BEGIN
	use DB_Products
	--Creating Table Product
	IF NOT EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'Product' )
		BEGIN
		CREATE TABLE Product(
		Product_ID INT PRIMARY KEY IDENTITY (1, 1),
		Product_Name NVARCHAR(100) NOT NULL,
		Product_REF NVARCHAR(100) NOT NULL,
		Product_ProductSectorIDCODE INT NULL,
		Product_Creation_Date DATETIME NOT NULL
		);
		END 
	ELSE
		BEGIN
		--Create registers on Table Product
		IF (NOT (SELECT Count(*) FROM Product) = 0 )
			BEGIN
				
			DECLARE @PRODUCT_FIELDS table(
					ROWID							INT NOT NULL identity(1,1), --Product_ID
					Product_Name					NVARCHAR(100),
					Product_REF						NVARCHAR(100),
					Product_Price					FLOAT,
					Product_Creation_Date			DATETIME
					);  

			--Libros
			--IF (NOT (SELECT Count(*) FROM Product) = 0  )
				--BEGIN
				INSERT INTO @PRODUCT_FIELDS VALUES ('El asesino sangriento del Planeta Perdido', 'REF-1', 20.4, GETDATE());
				INSERT INTO @PRODUCT_FIELDS VALUES ('EL llanero solitario', 'REF-2', 10.4, GETDATE());
				INSERT INTO @PRODUCT_FIELDS VALUES ('La abuela y el sobrino', 'REF-3', 30, GETDATE());
				INSERT INTO @PRODUCT_FIELDS VALUES ('Navidades sangrientas', 'REF-4', 40, GETDATE());
				--END 
			END
		END
	END 
