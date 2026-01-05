CREATE VIEW vista_clientes_activos AS 
SELECT id_cliente, nombre, apellido, dni, fecha_registro
FROM clientes
WHERE estado = 'Activo';

SELECT * FROM vista_clientes_activos;

CREATE VIEW v_clases_completas AS
SELECT 
c.id_clase,
c.fecha,
c.hora,
c.tipo_clase,
c.cupo_maximo,
e.nombre AS nombre_entrenador,
e.apellido AS apellido_entrenador,
w.tipo AS tipo_wod,
w.duracion
FROM clases c
JOIN entrenadores e ON c.id_entrenador = e.id_entrenador
JOIN wods w ON c.id_wod = w.id_wod;

SELECT * FROM clases;
SELECT * FROM v_clases_completas;

SELECT * FROM reservas;

CREATE VIEW v_reservas_por_clase AS
SELECT 
c.id_clase,
c.fecha,
c.hora,
c.tipo_clase,
COUNT(r.id_reserva) AS cantidad_reservas
FROM clases c
LEFT JOIN reservas r ON c.id_clase = r.id_clase
group by
c.id_clase,
c.fecha,
c.hora,
c.tipo_clase;

select * FROM v_reservas_por_clase;

SELECT * FROM clientes;

CREATE VIEW v_clientes_membresias AS 
SELECT 
cl.id_cliente,
cl.nombre,
cl.apellido,
m.nombre AS nombre_membresia,
m.precio,
m.duracion_dias,
m.limite_clases
FROM clientes cl
JOIN membresias m ON cl.id_cliente = m.id_cliente;

SELECT * FROM v_clientes_membresias;

SELECT * FROM pagos;

CREATE VIEW v_pagos_clientes AS
SELECT 
p.id_pago,
cl.nombre,
cl.apellido,
m.nombre AS membresia,
p.fecha_pago,
p.metodo_pago,
m.precio AS precio_membresia
FROM pagos p
JOIN clientes cl ON p.id_cliente = cl.id_cliente
JOIN membresias m ON p.id_membresia = m.id_membresia;

SELECT * FROM v_pagos_clientes;

