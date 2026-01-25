DROP DATABASE IF EXISTS crossfit_box; 
CREATE DATABASE crossfit_box;
USE crossfit_box;

CREATE TABLE clientes (
id_cliente INT auto_increment PRIMARY KEY,
nombre VARCHAR(25) NOT NULL,
apellido VARCHAR(25) NOT NULL,
dni VARCHAR(25) NOT NULL,
fecha_nacimiento DATE,
telefono INT,
fecha_registro DATE NOT NULL,
estado VARCHAR(25) NOT NULL -- Activo / Inactivo
); 

CREATE TABLE entrenadores (
id_entrenador INT auto_increment PRIMARY KEY,
nombre VARCHAR(25) NOT NULL,
apellido VARCHAR(25) NOT NULL,
especialidad VARCHAR(50),
telefono INT,
fecha_alta DATE
);

CREATE TABLE wods (
id_wod INT auto_increment PRIMARY KEY,
tipo VARCHAR(25) NOT NULL, -- AMRAP, EMOM, FOR TIME
descripcion_clase TEXT(100) NOT NULL,
duracion TIME
);

CREATE TABLE clases (
id_clase INT auto_increment PRIMARY KEY,
id_entrenador INT,
id_wod INT,
tipo_clase VARCHAR(50) NOT NULL,
fecha DATE NOT NULL,
hora TIME NOT NULL,
cupo_maximo INT NOT NULL,
FOREIGN KEY (id_entrenador) REFERENCES entrenadores(id_entrenador),
foreign key (id_wod) references wods_detalle(id_wod)
);

CREATE TABLE inscripciones (
id_inscripcion INT auto_increment PRIMARY KEY,
id_cliente INT,
fecha_inscripcion DATE,
foreign key (id_cliente) references clientes(id_cliente)
);

CREATE TABLE reservas (
id_reserva INT auto_increment PRIMARY KEY,
id_cliente INT,
id_clase INT,
fecha_reserva DATE,
horario TIME NOT NULL,
foreign key (id_cliente) references clientes(id_cliente),
foreign key (id_clase) references clases(id_clase)
);

-- Sugerencia: definir qué planes existen, crear una tabla planes_membresía que actúa como un catálogo de planes
CREATE TABLE planes_membresia (
	id_plan INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT(100), 
    precio INT NOT NULL,
    duracion_dias INT NOT NULL,
    limite_clases INT NOT NULL -- 0 o 100 si es ilimitado
);

-- sugerencia: crear una tabla cliente_membresias, tabla intermedia que asocia al cliente con el plan y su fecha de vencimiento
CREATE TABLE cliente_membresias (
	id_cliente_membresia INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_plan INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado VARCHAR(25) DEFAULT 'Activa',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_plan) REFERENCES planes_membresia(id_plan)
);

-- sugerencia: debería alterar la tabla pagos para que cada pago quede asociado a una membresía específica
/*ALTER TABLE pagos
ADD COLUMN id_cliente_membresia INT,
ADD FOREIGN KEY (id_cliente_membresia)
REFERENCES cliente_membresias(id_cliente_membresia);
*/

CREATE TABLE pagos (
id_pago INT auto_increment PRIMARY KEY,
id_cliente INT,
id_plan INT,
fecha_pago DATE NOT NULL,
metodo_pago VARCHAR(25) NOT NULL,
foreign key (id_cliente) references clientes(id_cliente),
foreign key (id_plan) references planes_membresia(id_plan)
);

CREATE TABLE entrenador_cliente (
id_entrenador INT NOT NULL,
id_cliente INT NOT NULL,
PRIMARY KEY (id_entrenador, id_cliente),
foreign key(id_entrenador) REFERENCES entrenadores(id_entrenador),
foreign key(id_cliente) REFERENCES clientes(id_cliente)
);  


