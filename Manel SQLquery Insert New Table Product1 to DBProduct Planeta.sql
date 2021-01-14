
--Script SQL para inserción de datos en las tablas de la base de datos

--NOTA: Todos los comentarios en código se harán por norma en Inglés esto unifica el trabajo en equipos internacionales así como los
-- nombres de las bases de datos, las tablas y campos 

IF EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'DBProducts' )
	BEGIN
	use DBProducts
	--Creating Table Product
	IF NOT EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'Product' )
		BEGIN
		CREATE TABLE Product(
		Product_ID INT PRIMARY KEY IDENTITY (1, 1),
		Product_Name NVARCHAR(100) NOT NULL,
		Product_REF NVARCHAR(100) NOT NULL,
		Product_Price FLOAT NULL,
		Product_Creation_Date DATETIME NOT NULL
		);
		END 
	

	--Create registers on Table Product
	IF ((SELECT Count(*) FROM dbo.Product) = 0 )
		BEGIN
		
		--Books
				
		INSERT INTO dbo.Product
		(Product_Name, Product_REF, Product_Price, Product_Creation_Date)
		VALUES ('El asesino sangriento del Planeta Perdido', 'REF-1', 20.4, GETDATE());

		INSERT INTO dbo.Product 
		(Product_Name, Product_REF, Product_Price, Product_Creation_Date)
		VALUES ('EL llanero solitario', 'REF-2', 10.4, GETDATE());

		INSERT INTO dbo.Product 
		(Product_Name, Product_REF, Product_Price, Product_Creation_Date)
		VALUES ('La abuela y el sobrino', 'REF-3', 30, GETDATE());

		INSERT INTO dbo.Product 
		(Product_Name, Product_REF, Product_Price, Product_Creation_Date)
		VALUES ('Navidades sangrientas', 'REF-4', 40, GETDATE());
			
		END
END	
