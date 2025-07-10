create database GestionEmpleados;
GO
use GestionEmpleados;
GO

create table Departamentos(
 DepartamentoId int identity(1,1) primary key,
 Nombre nvarchar(100) not null,
 Descripcion nvarchar(255) not null
);
GO
create table Empleados(
  EmpleadoID int identity(1,1) primary key,
  PrimerNombre nvarchar(50) not null,
  PrimerApellido nvarchar(50) not null,
  Correo nvarchar(100) not null,
  Salario decimal(10,2),
  DepartamentoId int foreign key (DepartamentoId) references Departamentos (DepartamentoId),
  FechaIngreso datetime default GETDATE()
);
--registro en tablas
insert into Departamentos (Nombre, Descripcion) values
('Sistemas', 'Analistas, programadores,soporte ti'),
('RRHH', 'gerentes, auxiliares, dotacion de personal');

insert into Empleados(PrimerNombre, PrimerApellido, Correo, Salario, DepartamentoId) values
('Karla', 'Brenes', 'kbrenesc@castrocarazo.ac.cr', 1000, 1),
('Allen', 'Villalobos', 'avillalobos@castrocarazo.ac.cr',2500, 2),
('Joseph', 'Brenes', 'jbrenesc@castrocarazo.ac.cr', 1000, 1),
('Marcos', 'Villalobos', 'mvillalobos@castrocarazo.ac.cr',2500, 2);

--procedimientos 
create procedure sp_ObtenerTodosEmpleados
as 
begin
select e.EmpleadoID, e.PrimerNombre, e.PrimerApellido, e.Correo, e.Salario, e.FechaIngreso, d.Nombre
from Empleados e, Departamentos d
where e.DepartamentoId = d.DepartamentoId
order by e.PrimerApellido asc, e.PrimerNombre asc; 
end;
GO

create procedure sp_ObtenerTodosDepartamentos
as 
begin
select d.DepartamentoId , d.Nombre, d.Descripcion
from   Departamentos d ; 
end;

create procedure sp_CrearEmpleados
@PrimerNombre nvarchar(50), 
@PrimerApellido nvarchar(50), 
@Correo  nvarchar(100), 
@DepartamentoId int, 
@Salario decimal(10,2)
as 
begin 

insert into Empleados(PrimerNombre, PrimerApellido, Correo, Salario, DepartamentoId) values
(@PrimerNombre, @PrimerApellido, @Correo, @Salario, @DepartamentoId);

end;

insert into Empleados(PrimerNombre, PrimerApellido, Correo, Salario, DepartamentoId) values
('Tatiana', 'Brenes', 'tbrenesc@castrocarazo.ac.cr', 1000, 1)