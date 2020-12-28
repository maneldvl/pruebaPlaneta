
--Script SQL para creación de la base de datos y las tablas dentro de la Base de datos, bastará con ejecutarlo
--La estructura creada para el Producto es la siguiente

--NOTA: Todos los comentarios en código se harán por norma en Inglés esto unifica el trabajo en equipos internacionales así como los
-- nombres de las bases de datos, las tablas y campos 

IF NOT EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'DB_Products' )
	BEGIN
	CREATE DATABASE DB_Products
	
	END
ELSE
	BEGIN --Start Create Tables on Database DB_Products
	use DB_Products

	
	--Creating Table T_Product
	IF NOT EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'Product' )
		BEGIN
		CREATE TABLE T_Product(
		Product_ID INT PRIMARY KEY IDENTITY (1, 1),
		Product_Name NVARCHAR(100) NOT NULL,
		Product_REF NVARCHAR(100) NOT NULL,
		Product_ProductSectorIDCODE INT NULL,
		Product_Creation_Date DATETIME NOT NULL
		);
	
		END 

	END --End Create Tables on Database DB_Products
