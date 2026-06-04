--Verificamos que no exista una base de datos con el mismo nombre
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'HospitalDB')
BEGIN
    DROP DATABASE HospitalDB
    PRINT 'La base de datos ya existía y ha sido eliminada.'
END

--Creamos la base de datos
CREATE DATABASE HospitalDB
GO