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
--Modulo V insertar datos en tablas
USE HospitalDB
GO

-- ====================================================================
--  DESACTIVAR LLAVES FORÁNEAS TEMPORALMENTE PARA EVITAR ERRORES
-- ====================================================================
ALTER TABLE Clinico.Pacientes NOCHECK CONSTRAINT ALL;
ALTER TABLE RRHH.Medicos NOCHECK CONSTRAINT ALL;
ALTER TABLE Gestion.Citas NOCHECK CONSTRAINT ALL;
ALTER TABLE Gestion.Habitaciones NOCHECK CONSTRAINT ALL;
ALTER TABLE Clinico.Tratamientos NOCHECK CONSTRAINT ALL;
ALTER TABLE Clinico.Medicamentos NOCHECK CONSTRAINT ALL;
GO


-- INSERCIÓN DE DATOS


-- Insertar 5 especialidades médicas
INSERT INTO RRHH.Especialidades (IdEspecialidad, nombre, descripcion)
VALUES 
(1, 'Cardiología', 'Especialistas en el corazón y sistema circulatorio.'),
(2, 'Pediatría', 'Atención médica para bebés, niños y adolescentes.'),
(3, 'Neurología', 'Tratamientos del sistema nervioso central y periférico.'),
(4, 'Dermatología', 'Cuidado y enfermedades de la piel.'),
(5, 'Ginecología', 'Salud del sistema reproductor femenino.');
GO

-- Insertar 10 médicos (Médicos especialistas)
INSERT INTO RRHH.Medicos (IdMedico, nombre, apellido, Especialidad, correo, fecha_contratacion, edad, salario, Citas)
VALUES 
(1, 'Carlos', 'Mendoza', 1, 'carlos.mendoza@hospital.com', '2015-03-12', 45, 3500.00, 1),
(2, 'Laura', 'Gutiérrez', 2, 'laura.gutierrez@hospital.com', '2018-07-19', 38, 3200.00, 2),
(3, 'Ricardo', 'Alvarado', 3, 'ricardo.alvarado@hospital.com', '2012-11-01', 50, 4200.00, 3),
(4, 'Patricia', 'Luna', 4, 'patricia.luna@hospital.com', '2020-05-24', 34, 2900.00, 4),
(5, 'Sergio', 'Rojas', 5, 'sergio.rojas@hospital.com', '2016-01-15', 42, 3600.00, 5),
(6, 'Elena', 'Salazar', 1, 'elena.salazar@hospital.com', '2019-09-10', 39, 3400.00, 6),
(7, 'Mauricio', 'Bermúdez', 2, 'mauricio.bermudez@hospital.com', '2021-02-28', 31, 3000.00, 7),
(8, 'Diana', 'Castillo', 3, 'diana.castillo@hospital.com', '2014-06-05', 47, 4100.00, 8),
(9, 'Roberto', 'Soto', 4, 'roberto.soto@hospital.com', '2017-08-12', 41, 3100.00, 9),
(10, 'Gabriela', 'Paz', 5, 'gabriela.paz@hospital.com', '2022-10-01', 29, 2800.00, 10);
GO

-- Insertar 20 pacientes con TODOS los campos (incluyendo los alterados del Módulo III)
INSERT INTO Clinico.Pacientes (IdPaciente, nombre, apellido, edad, correo, fecha_registro, IdCitas, Tratamientos, telefono, direccion, tipo_sangre, fecha_nacimiento)
VALUES 
(1, 'Pedro', 'García', 30, 'pedro.garcia@hospital.com', '2026-01-15', 1, 1, '5551234', 'Calle Falsa 123', 'O+', '1996-05-10'),
(2, 'María', 'López', 25, 'maria.lopez@hospital.com', '2026-03-22', 2, 2, '5555678', 'Avenida Central 456', 'A+', '2001-11-15'),
(3, 'Juan', 'Martínez', 45, 'juan.martinez@hospital.com', '2026-02-10', 3, 3, '5559012', 'Barrio Lindo Casa 7', 'B+', '1981-02-28'),
(4, 'Ana', 'Rodríguez', 18, 'ana.rodriguez@hospital.com', '2026-05-14', 4, 4, '5553456', 'Residencial El Sol Q-12', 'O-', '2008-09-05'),
(5, 'Luis', 'Sánchez', 60, 'luis.sanchez@hospital.com', '2026-01-30', 5, 5, '5557890', 'Calle Comercio 789', 'AB+', '1966-04-12'),
(6, 'Carmen', 'Pérez', 33, 'carmen.perez@hospital.com', '2026-04-05', 6, 6, '5552345', 'Avenida Bolívar 101', 'A-', '1993-12-20'),
(7, 'Carlos', 'Gómez', 52, 'carlos.gomez@hospital.com', '2026-03-19', 7, 7, '5556789', 'Calle Los Pinos 44', 'O+', '1974-08-14'),
(8, 'Elena', 'Fernández', 29, 'elena.fernandez@hospital.com', '2026-05-12', 8, 8, '5550123', 'Urbanización Primavera Bloque C', 'B-', '1997-01-30'),
(9, 'Jorge', 'Díaz', 37, 'jorge.diaz@hospital.com', '2026-04-25', 9, 9, '5554567', 'Calle Del Río 88', 'O+', '1989-06-18'),
(10, 'Lucía', 'Álvarez', 71, 'lucia.alvarez@hospital.com', '2026-02-03', 10, 10, '5558901', 'Avenida Las Flores 234', 'A+', '1955-10-22'),
(11, 'Ricardo', 'Torres', 22, 'ricardo.torres@hospital.com', '2026-01-20', 11, 1, '5551122', 'Barrio San José Calle 3', 'O-', '2004-03-11'),
(12, 'Sofía', 'Ruiz', 41, 'sofia.ruiz@hospital.com', '2026-03-15', 12, 2, '5553344', 'Residencial Altamira N-5', 'AB-', '1985-07-07'),
(13, 'Andrés', 'Ramírez', 50, 'andres.ramirez@hospital.com', '2026-02-28', 13, 3, '555566', 'Calle Principal 500', 'B+', '1976-11-02'),
(14, 'Valeria', 'González', 27, 'valeria.gonzalez@hospital.com', '2026-04-18', 14, 4, '5557788', 'Avenida del Valle 77', 'O+', '1999-05-25'),
(15, 'Alejandro', 'Muñoz', 65, 'alejandro.munoz@hospital.com', '2026-01-30', 15, 5, '5559900', 'Calle de la Amargura 13', 'A+', '1961-09-14'),
(16, 'Gabriela', 'Castro', 31, 'gabriela.castro@hospital.com', '2026-05-22', 1, 6, '5551212', 'Urbanización El Prado Casa 40', 'O+', '1995-02-17'),
(17, 'Manuel', 'Herrera', 48, 'manuel.herrera@hospital.com', '2026-03-11', 2, 7, '5553434', 'Callejón Oscuro 9', 'B+', '1978-10-09'),
(18, 'Isabel', 'Morales', 35, 'isabel.morales@hospital.com', '2026-04-05', 3, 8, '5555656', 'Avenida de la Amistad 88', 'A-', '1991-08-24'),
(19, 'Francisco', 'Flores', 58, 'francisco.flores@hospital.com', '2026-02-14', 4, 9, '5557878', 'Barrio Central Calle Principal', 'O-', '1968-12-01'),
(20, 'Daniela', 'Jiménez', 24, 'daniela.jimenez@hospital.com', '2026-05-27', 5, 10, '5559090', 'Residencial Los Arcos B-8', 'AB+', '2002-04-15');
GO

--  Insertar 15 citas (Citas con fecha actual y Citas futuras)
INSERT INTO Gestion.Citas (IdCita, IdPaciente, IdMedico, fecha_cita, IdEspecialidad, estado, costo_consulta)
VALUES 
-- Citas con Fecha Actual (Usa GETDATE())
(1, 1, 1, GETDATE(), 1, 'Completada', 45.00),
(2, 2, 2, GETDATE(), 2, 'Completada', 55.00),
(3, 3, 3, GETDATE(), 3, 'Completada', 40.00),
(4, 4, 4, GETDATE(), 4, 'Completada', 60.00),
(5, 5, 5, GETDATE(), 5, 'Completada', 50.00),
-- Citas Futuras
(6, 6, 6, '2026-07-10 08:00:00', 1, 'Programada', 45.00),
(7, 7, 7, '2026-07-11 09:30:00', 2, 'Programada', 55.00),
(8, 8, 8, '2026-07-12 10:45:00', 3, 'Programada', 40.00),
(9, 9, 9, '2026-07-13 13:15:00', 4, 'Programada', 60.00),
(10, 10, 10, '2026-07-14 15:00:00', 5, 'Programada', 50.00),
(11, 11, 1, '2026-08-01 09:00:00', 1, 'Programada', 45.00),
(12, 12, 2, '2026-08-02 11:30:00', 2, 'Programada', 55.00),
(13, 13, 3, '2026-08-03 08:30:00', 3, 'Programada', 40.00),
(14, 14, 4, '2026-08-04 10:00:00', 4, 'Programada', 60.00),
(15, 15, 5, '2026-08-05 16:00:00', 5, 'Programada', 50.00);
GO

--  Insertar 10 habitaciones (Habitaciones ocupadas y Habitaciones disponibles)
INSERT INTO Gestion.Habitaciones (numero_habitacion, piso, IdPaciente, TipoHabitacion, EstadoHabitacion, IdEspecialidad, DescripcionHabitacion, PrecioHabitacion, disponibilidad)
VALUES 
-- Habitaciones Ocupadas (disponibilidad = 0)
(101, 1, 1, 'PAME', 'Ocupada', 1, 'Habitación de cuidados intensivos coronarios.', 150.00, 0),
(102, 1, 2, 'SemiPrivada', 'Ocupada', 2, 'Habitación compartida área pediatría.', 90.00, 0),
(103, 1, 3, 'Privada', 'Ocupada', 3, 'Habitación suite neurología.', 200.00, 0),
(104, 1, 4, 'Publica', 'Ocupada', 4, 'Pabellón general dermatología.', 45.00, 0),
(201, 2, 5, 'PAME', 'Ocupada', 5, 'Aislamiento ginecología.', 150.00, 0),
-- Habitaciones Disponibles (disponibilidad = 1)
(202, 2, NULL, 'SemiPrivada', 'Disponible', 1, 'Equipada con monitor cardíaco.', 90.00, 1),
(203, 2, NULL, 'Privada', 'Disponible', 2, 'Decoración infantil.', 200.00, 1),
(204, 2, NULL, 'Publica', 'Disponible', 3, 'Área común de recuperación.', 45.00, 1),
(301, 3, NULL, 'SemiPrivada', 'Disponible', 4, 'Luminosa y ventilada.', 90.00, 1),
(302, 3, NULL, 'Privada', 'Disponible', 5, 'Cama articulada y baño privado.', 200.00, 1);
GO

-- Insertar 20 medicamentos
INSERT INTO Clinico.Medicamentos (IdMedicamento, nombre, descripcion, precio, stock, NeedReceta)
VALUES 
(1, 'Paracetamol', 'Analgésico y antipirético.', 2.50, 500, 0),
(2, 'Amoxicilina', 'Antibiótico de amplio espectro.', 12.00, 200, 1),
(3, 'Ibuprofeno', 'Antiinflamatorio no esteroideo.', 4.00, 400, 0),
(4, 'Omeprazol', 'Protector gástrico.', 6.50, 350, 0),
(5, 'Losartán', 'Tratamiento para la hipertensión.', 18.00, 150, 1),
(6, 'Metformina', 'Antidiabético oral.', 14.50, 250, 1),
(7, 'Atorvastatina', 'Para reducir el colesterol.', 22.00, 180, 1),
(8, 'Salbutamol', 'Broncodilatador para el asma.', 9.00, 120, 1),
(9, 'Loratadina', 'Antihistamínico para alergias.', 5.00, 300, 0),
(10, 'Clonazepam', 'Ansiolítico anticonvulsivo.', 25.00, 90, 1),
(11, 'Diclofenaco', 'Analgésico potente.', 5.50, 210, 0),
(12, 'Fluoxetina', 'Antidepresivo.', 30.00, 100, 1),
(13, 'Aspirina', 'Antiagregante plaquetario.', 3.00, 600, 0),
(14, 'Enalapril', 'Inhibidor para la presión.', 11.00, 140, 1),
(15, 'Azitromicina', 'Antibiótico macrólido.', 16.00, 85, 1),
(16, 'Cetirizina', 'Antialérgico de segunda generación.', 7.00, 190, 0),
(17, 'Tramadol', 'Analgésico opioide.', 35.00, 70, 1),
(18, 'Ranitidina', 'Reductor de ácido gástrico.', 4.50, 100, 0),
(19, 'Sertralina', 'Inhibidor de la recaptación de serotonina.', 28.00, 110, 1),
(20, 'Insulina Glargina', 'Tratamiento diabetes tipo 1 y 2.', 45.00, 60, 1);
GO

-- Insertar 10 tratamientos (Tratamientos activos y Tratamientos finalizados)
INSERT INTO Clinico.Tratamientos (IdTratamiento, IdPaciente, IdMedico, Medicamentos, motivo, guia_medicamentos, fecha_inicio, fecha_fin, total)
VALUES 
-- Tratamientos Activos (Fecha fin en el futuro)
(1, 1, 1, 5, 'Hipertensión severa.', 'Tomar 1 tableta diaria por las mañanas.', '2026-06-01', '2026-12-01', 150.00),
(2, 2, 2, 2, 'Infección respiratoria.', 'Tomar cada 8 horas por 7 días.', '2026-06-05', '2026-06-12', 45.00),
(3, 3, 3, 10, 'Episodios de ansiedad generalizada.', 'Media tableta antes de dormir.', '2026-05-20', '2026-11-20', 210.00),
(4, 4, 4, 9, 'Dermatitis alérgica crónica.', 'Una toma cada 24 horas.', '2026-06-02', '2026-07-02', 35.00),
(5, 5, 5, 6, 'Control de Diabetes Tipo 2.', '1 tableta con el almuerzo.', '2026-04-15', '2026-10-15', 180.00),
-- Tratamientos Finalizados (Fecha fin en el pasado)
(6, 6, 6, 1, 'Fiebre Dengue clásica.', 'Paracetamol cada 6 horas por 5 días.', '2026-05-01', '2026-05-06', 20.00),
(7, 7, 7, 3, 'Esguince de tobillo izquierdo.', 'Ibuprofeno cada 8 horas por 3 días.', '2026-04-10', '2026-04-13', 15.00),
(8, 8, 8, 4, 'Gastritis aguda por estrés.', 'Omeprazol en ayunas por 14 días.', '2026-03-01', '2026-03-15', 50.00),
(9, 9, 9, 11, 'Dolor lumbar mecánico.', 'Diclofenaco cada 12 horas por 5 días.', '2026-05-10', '2026-05-15', 30.00),
(10, 10, 10, 15, 'Faringoamigdalitis bacteriana.', 'Azitromicina una diaria por 3 días.', '2026-02-18', '2026-02-21', 48.00);
GO


-- ====================================================================
--  REACTIVAR TODAS LAS LLAVES FORÁNEAS Y REVISAR INTEGRIDAD
-- ====================================================================
ALTER TABLE Clinico.Pacientes CHECK CONSTRAINT ALL;
ALTER TABLE RRHH.Medicos CHECK CONSTRAINT ALL;
ALTER TABLE Gestion.Citas CHECK CONSTRAINT ALL;
ALTER TABLE Gestion.Habitaciones CHECK CONSTRAINT ALL;
ALTER TABLE Clinico.Tratamientos CHECK CONSTRAINT ALL;
ALTER TABLE Clinico.Medicamentos CHECK CONSTRAINT ALL;
GO


--Modulo VI UPDATE
-- Actualizar teléfono de un paciente.
UPDATE Clinico.Pacientes
SET telefono = '555-9999'
WHERE IdPaciente = 1;
GO

-- Actualizar dirección de un paciente.
UPDATE Clinico.Pacientes
SET direccion = 'Nueva Avenida Principal #45'
WHERE IdPaciente = 2;
GO

-- Actualizar salario de un médico.
UPDATE RRHH.Medicos
SET salario = 3800.00
WHERE IdMedico = 1;
GO

-- Actualizar turno de un médico.
UPDATE RRHH.Medicos
SET turno = 'Nocturno'
WHERE IdMedico = 2;
GO

-- Cambiar estado de una cita.
UPDATE Gestion.Citas
SET estado = 'Completada'
WHERE IdCita = 6;
GO

-- Actualizar costo de consulta.
UPDATE Gestion.Citas
SET costo_consulta = 65.00
WHERE IdCita = 7;
GO

-- Actualizar nombre de especialidad.
UPDATE RRHH.Especialidades
SET nombre = 'Cardiología Avanzada'
WHERE IdEspecialidad = 1;
GO

-- Actualizar disponibilidad de habitación.
UPDATE Gestion.Habitaciones
SET disponibilidad = 0, EstadoHabitacion = 'Ocupada'
WHERE numero_habitacion = 202;
GO

-- Actualizar tratamiento activo.
UPDATE Clinico.Tratamientos
SET guia_medicamentos = 'Tomar 1 tableta cada 12 horas en lugar de cada 24.'
WHERE IdTratamiento = 1;
GO

-- Actualizar medicamento.
UPDATE Clinico.Medicamentos
SET precio = 3.10, stock = 480
WHERE IdMedicamento = 1;
GO

-- Actualizar correo de médico.
UPDATE RRHH.Medicos
SET correo = 'nuevo.correo.medico@hospital.com'
WHERE IdMedico = 3;
GO

-- Actualizar fecha de cita.
UPDATE Gestion.Citas
SET fecha_cita = '2026-08-15 10:30:00'
WHERE IdCita = 8;
GO

-- Actualizar experiencia del médico.
UPDATE RRHH.Medicos
SET experiencia = 12
WHERE IdMedico = 4;
GO

-- Actualizar tipo de sangre.
UPDATE Clinico.Pacientes
SET tipo_sangre = 'A-'
WHERE IdPaciente = 4;
GO

-------------------------------------------
--Modulo VII DELETE
-------------------------------------------
-- Eliminar un paciente específico.
DELETE FROM Clinico.Pacientes
WHERE IdPaciente = 20;
GO

-- Eliminar una cita.
DELETE FROM Gestion.Citas
WHERE IdCita = 15;
GO

-- Eliminar un medicamento.
DELETE FROM Clinico.Medicamentos
WHERE IdMedicamento = 20;
GO

-- Eliminar una habitación.
DELETE FROM Gestion.Habitaciones
WHERE numero_habitacion = 302;
GO

-- Eliminar un tratamiento.
DELETE FROM Clinico.Tratamientos
WHERE IdTratamiento = 10;
GO

-- Eliminar citas canceladas.
DELETE FROM Gestion.Citas
WHERE estado = 'Cancelada';
GO

-- Eliminar pacientes sin citas.
-- (Elimina pacientes cuyo ID no figure en ninguna fila de la tabla Citas)
DELETE FROM Clinico.Pacientes
WHERE IdPaciente NOT IN (
    SELECT DISTINCT IdPaciente 
    FROM Gestion.Citas 
    WHERE IdPaciente IS NOT NULL
);
GO

DELETE FROM Gestion.Habitaciones
WHERE EstadoHabitacion = 'Disponible' OR IdPaciente IS NULL;
GO

DELETE FROM Clinico.Medicamentos
WHERE deleted_at IS NOT NULL; -- O si existiera la columna: fecha_vencimiento < GETDATE()
GO

DELETE FROM Clinico.Pacientes
WHERE nombre LIKE '%Prueba%' OR apellido LIKE '%Prueba%';
GO

--Modulo VIII Finalización de la base de datos y consultas de prueba

-- Mostrar todos los pacientes.
SELECT * FROM Clinico.Pacientes;
GO

-- Mostrar todos los médicos.
SELECT * FROM RRHH.Medicos;
GO

-- Mostrar todas las especialidades.
SELECT * FROM RRHH.Especialidades;
GO

-- Mostrar todas las citas.
SELECT * FROM Gestion.Citas;
GO

-- Mostrar pacientes ordenados por apellido.
SELECT * FROM Clinico.Pacientes
ORDER BY apellido ASC;
GO

-- Mostrar médicos ordenados por salario (de mayor a menor).
SELECT * FROM RRHH.Medicos
ORDER BY salario DESC;
GO

SELECT * FROM Gestion.Citas
WHERE fecha_cita  = '2026-06-08';
GO

-- Mostrar habitaciones disponibles.
SELECT * FROM Gestion.Habitaciones
WHERE disponibilidad = 1;
GO

-- Mostrar cantidad de pacientes registrados.
SELECT COUNT(*) AS TotalPacientes 
FROM Clinico.Pacientes;
GO

-- Mostrar cantidad de citas por médico.
-- (Agrupa las citas y cuenta cuántas tiene asignadas cada IdMedico)
SELECT IdMedico, COUNT(*) AS CantidadCitas
FROM Gestion.Citas
GROUP BY IdMedico;
GO