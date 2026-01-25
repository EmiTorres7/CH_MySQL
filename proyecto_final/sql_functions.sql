DELIMITER //
CREATE FUNCTION calcular_edad_cliente(param_id_cliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE edad INT;
    SELECT 
		TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())
	INTO edad
    FROM clientes
    WHERE id_cliente = param_id_cliente;
    RETURN edad;
END //
DELIMITER ;

SELECT nombre, apellido, calcular_edad_cliente(id_cliente) AS edad_cliente
FROM clientes;

DELIMITER //
CREATE FUNCTION clases_reservadas_cliente(param_id_cliente INT)
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE total_reservas INT;
    SELECT count(*)
    into total_reservas
    FROM reservas
    WHERE id_cliente = param_id_cliente;
    
    RETURN total_reservas;
END //
DELIMITER //;

SELECT nombre, apellido, clases_reservadas_cliente(id_cliente) AS clases_reservadas
FROM clientes;



