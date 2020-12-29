
--Script SQL para creación de la base de datos y la tabla dentro de la Base de datos, bastará con ejecutarlo en el entorno del IIS local
--La estructura creada para el Producto es la siguiente

--NOTA: Todos los comentarios en código se harán por norma en Inglés esto unifica el trabajo en equipos internacionales así como los
-- nombres de las bases de datos, las tablas y campos 


IF NOT EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'DB_Products' )
	BEGIN
	CREATE DATABASE DB_Products
	END

