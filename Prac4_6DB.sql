use master --Ponemos en uso master para poder eliminar la base de datos
Go

Alter database HospitalDB set single_user with rollback immediate
Go

--Eliminamos la base de datos si ya existe
Drop database if exists HospitalDB
Go

--Creamos la base de datos
CREATE DATABASE HospitalDB
GO

--Mostrar todas las bases de datos existentes
select * from sys.databases
Go

--Seleccionamos la base de datos que acabamos de crear
USE HospitalDB
Go

--Creamos los esquemas para organizar nuestras tablas
create schema Clinico
Go

create schema RRHH
Go

Create schema Gestion
Go
/*
--Creamos la tabla Pacientes
Create table Clinico.Pacientes(
IdPaciente int,
nombre varchar (50) not null,
apellido varchar(50) not null,
edad int not null,
correo varchar(100),
fecha_registro datetime default getdate(),
IdCitas int,
Tratamientos int,

--Campos de auditoría
created_at DATETIME DEFAULT GETDATE(),
updated_at DATETIME DEFAULT GETDATE(), 
deleted_at DATETIME NULL,

--restricciones
constraint PK_Pacientes primary key (IdPaciente),
constraint UQ_Correo unique (correo),
constraint CHK_Edad check (edad >= 0 and edad <= 120),
constraint FK_Citas foreign key (IdCitas) references Gestion.Citas(IdCita),
constraint FK_Tratamientos foreign key (Tratamientos) references Clinico.Tratamientos(IdTratamiento)

);
GO

--Creamos la tabla Medicos
Create table RRHH.Medicos(
IdMedico int,
nombre varchar(50) not null,
apellido varchar(50) not null,
Especialidad int not null,
correo varchar(100),
fecha_contratacion datetime,
edad int,
salario decimal(10,2),
Citas int,

--Campos de auditoría
created_at DATETIME DEFAULT GETDATE(),
updated_at DATETIME DEFAULT GETDATE(), 
deleted_at DATETIME NULL

--restricciones
constraint PK_Medicos primary key (IdMedico),
constraint UQ_CorreoMedico unique (correo),
constraint CHK_Edad check (edad >= 0 and edad <= 120),
constraint CHK_Salario check (salario >= 0),
constraint FK_Especialidad foreign key (Especialidad) references RRHH.Especialidades(IdEspecialidad),
constraint FK_CitasMedico foreign key (Citas) references Gestion.Citas(IdCita)
);
Go

--Creamos la tabla Especialidades
Create table RRHH.Especialidades(
IdEspecialidad int,
nombre varchar(50),
descripcion varchar(255),

--Campos de auditoría
createdat DATETIME DEFAULT GETDATE(),
updatedat DATETIME DEFAULT GETDATE(), 
deletedat DATETIME NULL 

--Restricciones
constraint PK_Especialidades primary key (IdEspecialidad)

);
Go

--Creamos la tabla Citas
Create table Gestion.Citas(
IdCita int,
IdPaciente int,
IdMedico int,
fecha_cita datetime,
IdEspecialidad int,

--Campos de auditoría
created_at DATETIME DEFAULT GETDATE(),
updated_at DATETIME DEFAULT GETDATE(), 
deleted_at DATETIME NULL,

--restricciones
constraint PK_Citas primary key (IdCita),
constraint FK_PacienteCita foreign key (IdPaciente) references Clinico.Pacientes(IdPaciente),
constraint FK_MedicoCita foreign key (IdMedico) references RRHH.Medicos(IdMedico),
constraint FK_EspecialidadCita foreign key (IdEspecialidad) references RRHH.Especialidades(IdEspecialidad)
);
Go

--Creamos la tabla Habitaciones
Create table Gestion.Habitaciones(
numero_habitacion int,
piso int,
IdPaciente int,
TipoHabitacion varchar(50),
EstadoHabitacion varchar(20),
IdEspecialidad int,
DescripcionHabitacion varchar(255),
PrecioHabitacion decimal(10,2),

--Campos de auditoría
created_at DATETIME DEFAULT GETDATE(),
updated_at DATETIME DEFAULT GETDATE(), 
deleted_at DATETIME NULL,

constraint PK_Habitaciones primary key (numero_habitacion),
constraint FK_PacienteHabitacion foreign key (IdPaciente) references Clinico.Pacientes(IdPaciente),
constraint FK_EspecialidadHabitacion foreign key (IdEspecialidad) references RRHH.Especialidades(IdEspecialidad),
constraint CHK_EstadoHabitacion check (EstadoHabitacion in ('Disponible', 'Ocupada', 'En Mantenimiento')),
constraint CHK_TipoHabitacion check (TipoHabitacion in ('PAME', 'SemiPrivada', 'Publica')),
constraint CHK_PrecioHabitacion check (PrecioHabitacion >= 0)
);
Go

--Creamos la tabla Tratamientos
Create table Clinico.Tratamientos(
IdTratamiento int,
IdPaciente int,
IdMedico int,
Medicamentos int,
motivo varchar(255),
guia_medicamentos varchar(555),
fecha_inicio datetime,
fecha_fin datetime,
total decimal(10,2),

--Campos de auditoría
created_at DATETIME DEFAULT GETDATE(),
updated_at DATETIME DEFAULT GETDATE(), 
deleted_at DATETIME NULL,

constraint PK_Tratamientos primary key (IdTratamiento),
constraint FK_PacienteTratamiento foreign key (IdPaciente) references Clinico.Pacientes(IdPaciente),
constraint FK_MedicoTratamiento foreign key (IdMedico) references RRHH.Medicos(IdMedico),
constraint FK_MedicamentosTratamiento foreign key (Medicamentos) references Clinico.Medicamentos(IdMedicamento),
constraint CHK_TotalTratamiento check (total >= 0)

);
Go

--Creamos la tabla Medicamentos
Create table Clinico.Medicamentos(
IdMedicamento int,
nombre varchar(50),
descripcion varchar(255),
precio decimal(10,2),
stock int,
NeedReceta bit,

--Campos de auditoría
created_at DATETIME DEFAULT GETDATE(),
updated_at DATETIME DEFAULT GETDATE(), 
deleted_at DATETIME NULL 

--restricciones
constraint PK_Medicamentos primary key (IdMedicamento),
constraint CHK_PrecioMedicamento check (precio >= 0),
constraint CHK_StockMedicamento check (stock >= 0)
);
Go

Lo dejo como comentario para mejorar el orden y se logre una ejecucion correcta, ya que hay relaciones entre tablas y se deben crear en un orden específico.
*/

--Creamos la tabla Especialidades
Create table RRHH.Especialidades(
IdEspecialidad int,
nombre varchar(50),
descripcion varchar(255),

--Campos de auditoría
createdat DATETIME DEFAULT GETDATE(),
updatedat DATETIME DEFAULT GETDATE(), 
deletedat DATETIME NULL 

--Restricciones
constraint PK_Especialidades primary key (IdEspecialidad)

);
Go

--Creamos la tabla Medicamentos
Create table Clinico.Medicamentos(
IdMedicamento int,
nombre varchar(50),
descripcion varchar(255),
precio decimal(10,2),
stock int,
NeedReceta bit,

--Campos de auditoría
created_at DATETIME DEFAULT GETDATE(),
updated_at DATETIME DEFAULT GETDATE(), 
deleted_at DATETIME NULL 

--restricciones
constraint PK_Medicamentos primary key (IdMedicamento),
constraint CHK_PrecioMedicamento check (precio >= 0),
constraint CHK_StockMedicamento check (stock >= 0)
);
Go

--Creamos la tabla Pacientes
Create table Clinico.Pacientes(
IdPaciente int,
nombre varchar (50) not null,
apellido varchar(50) not null,
edad int not null,
correo varchar(100),
fecha_registro datetime default getdate(),
IdCitas int,
Tratamientos int,

--Campos de auditoría
created_at DATETIME DEFAULT GETDATE(),
updated_at DATETIME DEFAULT GETDATE(), 
deleted_at DATETIME NULL,

--restricciones
constraint PK_Pacientes primary key (IdPaciente),
constraint UQ_Correo unique (correo),
constraint CHK_Edad check (edad >= 0 and edad <= 120)
);
GO

--Creamos la tabla Medicos
Create table RRHH.Medicos(
IdMedico int,
nombre varchar(50) not null,
apellido varchar(50) not null,
Especialidad int not null,
correo varchar(100),
fecha_contratacion datetime,
edad int,
salario decimal(10,2),
Citas int,

--Campos de auditoría
created_at DATETIME DEFAULT GETDATE(),
updated_at DATETIME DEFAULT GETDATE(), 
deleted_at DATETIME NULL

--restricciones
constraint PK_Medicos primary key (IdMedico),
constraint UQ_CorreoMedico unique (correo),
constraint CHK_Edad check (edad >= 0 and edad <= 120),
constraint CHK_Salario check (salario >= 0),
constraint FK_Especialidad foreign key (Especialidad) references RRHH.Especialidades(IdEspecialidad)
);
Go

--Creamos la tabla Citas
Create table Gestion.Citas(
IdCita int,
IdPaciente int,
IdMedico int,
fecha_cita datetime,
IdEspecialidad int,

--Campos de auditoría
created_at DATETIME DEFAULT GETDATE(),
updated_at DATETIME DEFAULT GETDATE(), 
deleted_at DATETIME NULL,

--restricciones
constraint PK_Citas primary key (IdCita),
constraint FK_PacienteCita foreign key (IdPaciente) references Clinico.Pacientes(IdPaciente),
constraint FK_MedicoCita foreign key (IdMedico) references RRHH.Medicos(IdMedico),
constraint FK_EspecialidadCita foreign key (IdEspecialidad) references RRHH.Especialidades(IdEspecialidad)
);
Go

--Creamos la tabla Habitaciones
Create table Gestion.Habitaciones(
numero_habitacion int,
piso int,
IdPaciente int,
TipoHabitacion varchar(50),
EstadoHabitacion varchar(20),
IdEspecialidad int,
DescripcionHabitacion varchar(255),
PrecioHabitacion decimal(10,2),

--Campos de auditoría
created_at DATETIME DEFAULT GETDATE(),
updated_at DATETIME DEFAULT GETDATE(), 
deleted_at DATETIME NULL,

constraint PK_Habitaciones primary key (numero_habitacion),
constraint FK_PacienteHabitacion foreign key (IdPaciente) references Clinico.Pacientes(IdPaciente),
constraint FK_EspecialidadHabitacion foreign key (IdEspecialidad) references RRHH.Especialidades(IdEspecialidad),
constraint CHK_EstadoHabitacion check (EstadoHabitacion in ('Disponible', 'Ocupada', 'En Mantenimiento')),
constraint CHK_TipoHabitacion check (TipoHabitacion in ('PAME', 'SemiPrivada', 'Publica')),
constraint CHK_PrecioHabitacion check (PrecioHabitacion >= 0)
);
Go

--Creamos la tabla Tratamientos
Create table Clinico.Tratamientos(
IdTratamiento int,
IdPaciente int,
IdMedico int,
Medicamentos int,
motivo varchar(255),
guia_medicamentos varchar(555),
fecha_inicio datetime,
fecha_fin datetime,
total decimal(10,2),

--Campos de auditoría
created_at DATETIME DEFAULT GETDATE(),
updated_at DATETIME DEFAULT GETDATE(), 
deleted_at DATETIME NULL,

constraint PK_Tratamientos primary key (IdTratamiento),
constraint FK_PacienteTratamiento foreign key (IdPaciente) references Clinico.Pacientes(IdPaciente),
constraint FK_MedicoTratamiento foreign key (IdMedico) references RRHH.Medicos(IdMedico),
constraint FK_MedicamentosTratamiento foreign key (Medicamentos) references Clinico.Medicamentos(IdMedicamento),
constraint CHK_TotalTratamiento check (total >= 0)

);
Go

-----------------------------------------------------------------------
--Agrego Claves Foraneas faltantes para evitar errores de integridad referencial--
-----------------------------------------------------------------------
-- Claves foráneas pendientes en la tabla Pacientes
ALTER TABLE Clinico.Pacientes 
    ADD CONSTRAINT FK_Citas FOREIGN KEY (IdCitas) REFERENCES Gestion.Citas(IdCita);
GO

ALTER TABLE Clinico.Pacientes 
    ADD CONSTRAINT FK_Tratamientos FOREIGN KEY (Tratamientos) REFERENCES Clinico.Tratamientos(IdTratamiento);
GO

-- Clave foránea pendiente en la tabla Medicos
ALTER TABLE RRHH.Medicos 
    ADD CONSTRAINT FK_CitasMedico FOREIGN KEY (Citas) REFERENCES Gestion.Citas(IdCita);
GO

--Modulo III - Modificacion de estructura de tablas (ALTER TABLE)
use HospitalDB
Go
--Agregar columna teléfono a Pacientes.
ALTER TABLE Clinico.Pacientes
ADD telefono varchar(8);
go

--Agregar columna dirección a Pacientes.
ALTER TABLE Clinico.Pacientes
ADD direccion varchar(255);
go

--Agregar columna género.
ALTER TABLE Clinico.Pacientes
ADD genero varchar(10);
go

--Agregar columna tipo_sangre.
ALTER TABLE Clinico.Pacientes
ADD tipo_sangre varchar(3);
go

--Agregar columna fecha_nacimiento.
ALTER TABLE Clinico.Pacientes
ADD fecha_nacimiento datetime;
go

-- Modificar tamaño del campo nombre
ALTER TABLE Clinico.Pacientes
ALTER COLUMN nombre varchar(100) not null;
GO

-- Modificar tamaño del campo dirección
ALTER TABLE Clinico.Pacientes
ALTER COLUMN direccion varchar(500);
GO

-- Agregar columna experiencia a Médicos
ALTER TABLE RRHH.Medicos
ADD experiencia int;
GO

-- Agregar columna turno a Médicos
ALTER TABLE RRHH.Medicos
ADD turno varchar(20);
GO

-- Agregar columna observaciones
ALTER TABLE Gestion.Citas
ADD observaciones varchar(1000);
GO

-- Eliminar columna observaciones
ALTER TABLE Gestion.Citas
DROP COLUMN observaciones;
GO

-- Agregar columna estado a Citas
ALTER TABLE Gestion.Citas
ADD estado varchar(30);
GO

-- Agregar columna costo_consulta
ALTER TABLE Gestion.Citas
ADD costo_consulta decimal(10,2);
GO

-- Modificar tipo de dato del costo
ALTER TABLE Gestion.Citas
ALTER COLUMN costo_consulta MONEY;
GO

-- Agregar columna disponibilidad a Habitaciones
ALTER TABLE Gestion.Habitaciones
ADD disponibilidad BIT DEFAULT 1;
GO

--Modulo  IV (DROP)


--  Eliminar una tabla temporal.
DROP TABLE IF EXISTS #TablaTemporalPacientes;
GO

-- Eliminar una restricción CHECK.
ALTER TABLE Gestion.Habitaciones
DROP CONSTRAINT CHK_PrecioHabitacion;
GO

--  Eliminar una restricción UNIQUE.
ALTER TABLE Clinico.Pacientes
DROP CONSTRAINT UQ_Correo;
GO

--  Eliminar una columna.
ALTER TABLE Clinico.Pacientes
DROP COLUMN genero;
GO

--  Eliminar una tabla de pruebas.
DROP TABLE IF EXISTS Clinico.TablaPruebas;
GO

--  Crear y eliminar una tabla Auditoria.
CREATE TABLE Gestion.Auditoria (
    IdAuditoria INT IDENTITY(1,1) PRIMARY KEY,
    Accion VARCHAR(50),
    Fecha DATETIME DEFAULT GETDATE()
);
GO
DROP TABLE IF EXISTS Gestion.Auditoria;
GO

--  Crear y eliminar una tabla Logs.
CREATE TABLE Gestion.Logs (
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(MAX),
    FechaLog DATETIME DEFAULT GETDATE()
);
GO
DROP TABLE IF EXISTS Gestion.Logs;
GO

-- Eliminar una FOREIGN KEY.
ALTER TABLE Gestion.Habitaciones
DROP CONSTRAINT FK_EspecialidadHabitacion;
GO

--  Eliminar una tabla MedicamentosPrueba.
DROP TABLE IF EXISTS Clinico.MedicamentosPrueba;
GO

--  Eliminar una base de datos de pruebas.
USE master
GO
DROP DATABASE IF EXISTS HospitalDB_Pruebas;
GO

-----------------------------------------------------------------------
-----------------------------------------------------------------------