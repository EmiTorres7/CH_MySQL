DELIMITER //
CREATE TRIGGER trg_control_cupo_clase
BEFORE INSERT ON reservas 
FOR EACH ROW
BEGIN 
	DECLARE cupo INT;
    DECLARE reservas_actuales INT;
    
    -- Para obtener el cupo máximo de la clase
    SELECT cupo_maximo
    INTO cupo
    FROM clases
    WHERE id_clase = NEW.id_clase;
    
    -- contar las reservas actuales para esa clase
    SELECT COUNT(*)
    INTO reservas_actuales
    FROM reservas
    WHERE id_clase = NEW.id_clase;
    
    -- para validar el cupo
    IF reservas_actuales >= cupo THEN
		SIGNAL SQLSTATE '45000'
        SET message_text = 'No se puede reservar: la clase ya alcanzó el cupo máximo';
        END IF;
	END //
    DELIMITER //;
    
DELIMITER //
CREATE TRIGGER trg_activar_cliente_pago
AFTER INSERT ON pagos
FOR EACH ROW
BEGIN
    UPDATE clientes
    SET estado = 'Activo'
    WHERE id_cliente = NEW.id_cliente;
END//

DELIMITER //;
    
-- prueba para reservar una clase llena, me debería fallar.
INSERT INTO reservas(id_cliente, id_clase, fecha_reserva, horario)
VALUES (1,1,curdate(), '08:00:00');    

-- Registrar un pago y verificar estado
INSERT INTO pagos (id_cliente, id_membresia, fecha_pago, metodo_pago)
VALUES (3, 1, CURDATE(), 'Tarjeta');

SELECT estado FROM clientes WHERE id_cliente = 3;




    