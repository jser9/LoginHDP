create database LoginHDP
use LoginHDP

CREATE TABLE Usuarios
(
id int IDENTITY(1000,1),
Usuario varchar(50),
Contrasenia varbinary(500)
)
/*encriptacion de login*/
create procedure SP_AgregarUsuario
@Usuario varchar(50),
@Contrasenia varchar(50),
@Patron varchar(50)
as
begin
insert into Usuarios(Usuario, Contrasenia) values (@Usuario,ENCRYPTBYPASSPHRASE(@Patron,@Contrasenia))
End

/*Validacion de usuario*/
create procedure SP_ValidarUsuario
@Usuario varchar(50),
@Contrasenia varchar(50),
@Patron varchar(50)
as
begin
select*from Usuarios where Usuario=@Usuario and CONVERT(varchar(50),DECRYPTBYPASSPHRASE(@Patron, Contrasenia))=@Contrasenia
end
/*verificamos la table usuario*/
select*from Usuarios 
SP_AgregarUsuario 'Daniel','uesdaniel','ferrari91'
