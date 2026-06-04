--Verificamos que no exista una base de datos con el mismo nombre
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'HospitalDB')
BEGIN
    DROP DATABASE HospitalDB
    PRINT 'La base de datos ya existía y ha sido eliminada.'
END

--Creamos la base de datos
CREATE DATABASE HospitalDB
GO

--Mostrar todas las bases de datos existentes
select * from sys.databases

--Seleccionamos la base de datos que acabamos de crear
USE HospitalDB

--Creamos los esquemas para organizar nuestras tablas
create schema Clinico

create schema RRHH

Create schema Gestion

--Creamos la tabla Pacientes
Create table Clinico.Pacientes(
IdPaciente int,
nombre varchar(50),
apellido varchar(50),
edad int,
correo varchar(100),
fecha_registro datetime
);
GO

--Creamos la tabla Medicos
Create table RRHH.Medicos(
IdMedico int,
nombre varchar(50),
apellido varchar(50),
IdEspecialidad int,
correo varchar(100),
fecha_contratacion datetime,
edad int,
salario decimal(10,2)
);
Go

--Creamos la tabla Especialidades
Create table RRHH.Especialidades(
IdEspecialidad int,
nombre varchar(50),
descripcion varchar(255)
);
Go

--Creamos la tabla Citas
Create table Gestion.Citas(
IdCita int,
IdPaciente int,
IdMedico int,
fecha_cita datetime,
IdEspecialidad int
);

--Creamos la tabla Habitaciones
Create table Gestion.Habitaciones(
numero_habitacion int,
piso int,
IdPaciente int,
TipoHabitacion varchar(50),
EstadoHabitacion varchar(20),
IdEspecialidad int,
DescripcionHabitacion varchar(255),
PrecioHabitacion decimal(10,2)
);

--Creamos la tabla Tratamientos
Create table Clinico.Tratamientos(
IdTratamiento int,
IdPaciente int,
IdMedico int,
motivo varchar(255),
guia_medicamentos varchar(555),
fecha_inicio datetime,
fecha_fin datetime,
total decimal(10,2)
);

--Creamos la tabla Medicamentos
Create table Clinico.Medicamentos(
IdMedicamento int,
nombre varchar(50),
descripcion varchar(255),
precio decimal(10,2),
stock int,
IdTratamiento int,
NeedReceta bit
);
