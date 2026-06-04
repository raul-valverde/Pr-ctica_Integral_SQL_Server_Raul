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