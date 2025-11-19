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

CREATE TABLE wods_detalle (
id_wod INT auto_increment PRIMARY KEY,
tipo VARCHAR(25) NOT NULL, -- AMRAP, EMOM, FOR TIME
descripcion_clase TEXT(100) NOT NULL,
duracion TIME
);

ALTER TABLE wods_detalle RENAME TO wods;

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

CREATE TABLE membresias (
id_membresia INT auto_increment PRIMARY KEY,
id_cliente INT,
nombre VARCHAR(50) NOT NULL, 
descripcion TEXT(60),
precio INT NOT NULL,
duracion_dias INT NOT NULL,
limite_clases INT, -- 0 o 100 si es ilimitado
foreign key (id_cliente) references clientes(id_cliente)
);

CREATE TABLE pagos (
id_pago INT auto_increment PRIMARY KEY,
id_cliente INT,
id_membresia INT,
fecha_pago DATE NOT NULL,
metodo_pago VARCHAR(25) NOT NULL,
foreign key (id_cliente) references clientes(id_cliente),
foreign key (id_membresia) references membresias(id_membresia)
);

CREATE TABLE entrenador_cliente (
id_entrenador INT NOT NULL,
id_cliente INT NOT NULL,
PRIMARY KEY (id_entrenador, id_cliente),
foreign key(id_entrenador) REFERENCES entrenadores(id_entrenador),
foreign key(id_cliente) REFERENCES clientes(id_cliente)
);  


