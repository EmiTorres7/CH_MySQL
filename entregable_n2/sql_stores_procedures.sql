-- registrar una clase sólo si el cliente está activo y si la clase existe
DELIMITER //
CREATE PROCEDURE registrar_reserva_cliente (
	IN pr_id_cliente INT,
    IN pr_id_clase INT,
    IN pr_fecha DATE,
    IN pr_horario TIME
)
BEGIN
	DECLARE estado_cliente VARCHAR(50);
	-- quiero obtener el estado del cliente
    SELECT estado 
    INTO estado_cliente
    FROM clientes 
    WHERE id_cliente = pr_id_cliente;
    
    -- quiero validar que el cliente esté activo
    IF estado_cliente <> 'Activo' THEN
		SIGNAL SQLSTATE '45000'
        SET message_text = 'El cliente no está activo y no puede reservar clases';
	ELSE
		INSERT INTO reservas (id_cliente, id_clase, fecha_reserva, horario)
        VALUES (pr_id_cliente, pr_id_clase, pr_fecha, pr_horario);
	END IF;
END //
DELIMITER //;

CALL registrar_reserva_cliente(1, 3, curdate(), '18:00:00');

SELECT * FROM clientes
WHERE id_cliente = 1;




