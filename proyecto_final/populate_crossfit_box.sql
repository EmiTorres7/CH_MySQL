USE crossfit_box;

INSERT INTO clientes (nombre, apellido, dni, fecha_nacimiento, telefono, fecha_registro, estado) VALUES
('Juan', 'Pérez', '30123456', '1985-04-12', 1123456789, '2024-01-10', 'Activo'),
('María', 'Gómez', '28987654', '1982-09-30', 1134567890, '2024-01-15', 'Activo'),
('Carlos', 'Rodríguez', '33456789', '1990-06-21', 1145678901, '2024-02-01', 'Inactivo'),
('Lucía', 'Fernández', '35678901', '1995-11-05', 1156789012, '2024-02-10', 'Activo'),
('Martín', 'López', '31234567', '1988-03-18', 1167890123, '2024-02-20', 'Activo'),
('Ana', 'Martínez', '27890123', '1979-07-25', 1178901234, '2024-03-01', 'Inactivo'),
('Diego', 'Sánchez', '34567890', '1992-12-02', 1189012345, '2024-03-05', 'Activo'),
('Paula', 'Romero', '36789012', '1997-08-14', 1190123456, '2024-03-12', 'Activo'),
('Federico', 'Torres', '29876543', '1983-01-09', 1101234567, '2024-03-20', 'Inactivo'),
('Valentina', 'Álvarez', '38901234', '2000-05-27', 1112345678, '2024-04-01', 'Activo'),
('Santiago', 'Ruiz', '32345678', '1989-10-16', 1123456790, '2024-04-05', 'Activo'),
('Camila', 'Morales', '40123456', '2001-02-11', 1134567801, '2024-04-10', 'Activo'),
('Nicolás', 'Herrera', '31456789', '1987-06-03', 1145678012, '2024-04-15', 'Inactivo'),
('Florencia', 'Castro', '37654321', '1994-09-19', 1156789123, '2024-04-20', 'Activo'),
('Andrés', 'Silva', '29123498', '1981-12-28', 1167890234, '2024-04-25', 'Activo');

INSERT INTO entrenadores (nombre, apellido, especialidad, telefono, fecha_alta) VALUES
('Lucas', 'Méndez', 'CrossFit Nivel 2', 1161234567, '2023-05-01'),
('Agustín', 'Navarro', 'Levantamiento Olímpico', 1162345678, '2023-06-15'),
('Carolina', 'Ríos', 'Funcional y movilidad', 1163456789, '2023-07-10'),
('Matías', 'Herrera', 'Gimnásticos', 1164567890, '2023-08-01'),
('Florencia', 'Vega', 'Endurance', 1165678901, '2023-09-12'),
('Nicolás', 'Peralta', 'CrossFit Nivel 1', 1166789012, '2023-10-20');

INSERT INTO wods (tipo, descripcion_clase, duracion) VALUES
('AMRAP', 'AMRAP 20: burpees, box jumps y wall balls', '00:20:00'),
('EMOM', 'EMOM 12: deadlift pesado + double unders', '00:12:00'),
('FOR TIME', '21-15-9 thrusters y pull-ups', '00:15:00'),
('AMRAP', 'AMRAP 15: kettlebell swings y push-ups', '00:15:00'),
('EMOM', 'EMOM 16: squat clean + toes to bar', '00:16:00'),
('FOR TIME', 'Carrera 400m + 30 wall balls (3 rondas)', '00:18:00'),
('AMRAP', 'AMRAP 25: remo, lunges y sit-ups', '00:25:00'),
('EMOM', 'EMOM 10: snatch técnico', '00:10:00'),
('FOR TIME', '50 pull-ups + 50 push-ups + 50 squats', '00:20:00'),
('AMRAP', 'AMRAP 18: bike y dumbbell snatch', '00:18:00');

INSERT INTO clases (id_entrenador, id_wod, tipo_clase, fecha, hora, cupo_maximo) VALUES
(1, 1, 'CrossFit', '2024-04-01', '08:00:00', 15),
(2, 2, 'CrossFit', '2024-04-01', '09:00:00', 12),
(3, 3, 'Funcional', '2024-04-01', '18:00:00', 15),
(4, 4, 'CrossFit', '2024-04-02', '19:00:00', 14),
(5, 5, 'Endurance', '2024-04-02', '07:00:00', 12),
(6, 6, 'CrossFit', '2024-04-03', '20:00:00', 15),
(1, 7, 'CrossFit', '2024-04-03', '08:00:00', 15),
(2, 8, 'Técnica', '2024-04-04', '09:00:00', 10),
(3, 9, 'Funcional', '2024-04-04', '18:00:00', 15),
(4,10, 'CrossFit', '2024-04-05', '19:00:00', 14);

INSERT INTO inscripciones (id_cliente, fecha_inscripcion) VALUES
(1, '2024-01-10'),
(2, '2024-01-12'),
(4, '2024-01-20'),
(5, '2024-02-01'),
(7, '2024-02-10'),
(8, '2024-02-15'),
(9, '2024-03-01'),
(10, '2024-03-05'),
(11, '2024-03-10'),
(12, '2024-03-15');

INSERT INTO reservas (id_cliente, id_clase, fecha_reserva, horario) VALUES
(1, 1, '2024-04-01', '08:00:00'),
(2, 1, '2024-04-01', '08:00:00'),
(4, 2, '2024-04-01', '09:00:00'),
(5, 3, '2024-04-01', '18:00:00'),
(7, 4, '2024-04-02', '19:00:00'),
(8, 5, '2024-04-02', '07:00:00'),
(9, 6, '2024-04-03', '20:00:00'),
(10,7, '2024-04-03', '08:00:00'),
(11,8, '2024-04-04', '09:00:00'),
(12,9, '2024-04-04', '18:00:00'),
(1,10, '2024-04-05', '19:00:00'),
(2, 6, '2024-04-03', '20:00:00');

INSERT INTO entrenador_cliente (id_entrenador, id_cliente) VALUES
(1,1),
(1,2),
(2,4),
(2,5),
(3,7),
(3,8),
(4,9),
(4,10),
(5,11),
(5,12),
(6,1),
(6,2);

INSERT INTO planes_membresia (nombre, descripcion, precio, duracion_dias, limite_clases) VALUES
('Plan Básico', 'Acceso limitado a clases semanales', 12000, 30, 8),
('Plan Standard', 'Clases regulares sin restricción horaria', 18000, 30, 12),
('Plan Pro', 'Acceso completo a todas las clases', 25000, 30, 0),
('Plan Trimestral Básico', 'Plan básico por 3 meses', 32000, 90, 24),
('Plan Trimestral Pro', 'Plan pro por 3 meses', 65000, 90, 0),
('Plan Estudiante', 'Plan con descuento para estudiantes', 10000, 30, 8),
('Plan Mañana', 'Acceso solo en turno mañana', 14000, 30, 10),
('Plan Fin de Semana', 'Clases solo sábados y domingos', 9000, 30, 6),
('Plan Anual Pro', 'Acceso ilimitado por un año', 220000, 365, 0),
('Plan Recovery', 'Clases suaves y movilidad', 11000, 30, 6);

INSERT INTO cliente_membresias (id_cliente, id_plan, fecha_inicio, fecha_fin, estado) VALUES
(1, 1, '2025-01-01', '2025-01-31', 'Finalizada'),
(2, 3, '2025-01-10', '2025-02-09', 'Activa'),
(3, 2, '2025-01-05', '2025-02-04', 'Activa'),
(4, 6, '2025-01-15', '2025-02-14', 'Activa'),
(5, 5, '2024-11-01', '2025-01-29', 'Finalizada'),
(6, 8, '2025-01-20', '2025-02-19', 'Activa'),
(7, 4, '2024-12-01', '2025-02-28', 'Activa'),
(8, 7, '2025-01-12', '2025-02-11', 'Activa'),
(9, 9, '2025-01-01', '2025-12-31', 'Activa'),
(10, 10, '2025-01-18', '2025-02-17', 'Activa');

INSERT INTO pagos (id_cliente, id_plan, fecha_pago, metodo_pago) VALUES
(1, 1, '2025-01-01', 'Efectivo'),
(2, 3, '2025-01-10', 'Tarjeta'),
(3, 2, '2025-01-05', 'Transferencia'),
(4, 6, '2025-01-15', 'Tarjeta'),
(5, 5, '2024-11-01', 'Efectivo'),
(6, 8, '2025-01-20', 'Transferencia'),
(7, 4, '2024-12-01', 'Tarjeta'),
(8, 7, '2025-01-12', 'Efectivo'),
(9, 9, '2025-01-01', 'Transferencia'),
(10, 10, '2025-01-18', 'Tarjeta');
