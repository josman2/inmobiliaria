/*punto 1*/
select * from Propietarios where Tipo_Cuenta = 'independiente' AND Correo like '%.org';

/*punto 2*/
SELECT DISTINCT Barrio 
FROM Sedes;

/*punto 3*/
SELECT Id_Arrendatarios, COUNT(*) AS total_contratos
FROM contratos
GROUP BY Id_Arrendatarios
HAVING COUNT(*) > 2;

/*punto 4*/
SELECT *
FROM Inmuebles
WHERE Valor_Arriendo > 25000000
  AND Valor_Arriendo <= 50000000
  AND Disponibilidad = 'si'
  AND barrio = 'BuenosAires';

/*punto 5*/
SELECT Contratos.Id_Contratos, Contratos.Valor_Arriendo, 
       CONCAT(Propietarios.Nombre, ' ', Propietarios.Apellido) AS Nombre_propietario,
       CONCAT(Arrendatarios.Nombres, ' ', Arrendatarios.Apellidos) AS Nombre_arrendatario,
FROM Contratos
JOIN Propietarios ON Contratos.Id_Cedula_propietario = Propietarios.Id_Cedula_propietario,
JOIN Arrendatarios ON Contratos.Id_Arrendatarios = Arrendatarios.Id_Arrendatarios,
ORDER BY Contratos.Valor_Arriendo DESC
LIMIT 15;
