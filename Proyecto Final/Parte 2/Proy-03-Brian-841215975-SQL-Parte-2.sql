-- ----------------------------------------------------------------
-- -   Author     : Brian J. Cruz Castro                          -
-- -   Num.Est    : 841-21-5975                                   -
-- -   Curso      : SICI-4030                                     -
-- -   Seccion    : LH1                                           -
-- -   Source     : ExamenPractico-1X-FORMATO-2023.sql            -
-- -   Comentario : Este script es para EL PROYECTO #3            -
-- ----------------------------------------------------------------
-- ----------------------------------------------------------------
-- -  EL SET ECHO ON permite ver la corrida en pantalla.         -
-- ----------------------------------------------------------------
SET ECHO ON
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Aqui se borran las tablas en caso de tener que volver a   -
-- -  crearlas, esta sub dividido por niveles.                    -
-- ----------------------------------------------------------------
-- NIVEL 3
DROP TABLE sesion;
DROP TABLE cliente;
DROP TABLE empleado;
-- NIVEL 2
DROP TABLE facilidad;
DROP TABLE horario;
DROP TABLE direccion;
DROP TABLE ciudad;
-- NIVEL 1
DROP TABLE estado;
DROP TABLE actividad;
DROP TABLE equipo;
DROP TABLE usuario;
DROP TABLE membresia;

-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla membresia nivel-1 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE membresia (
    tipo_pk                  VARCHAR2(2),
    titulo                   VARCHAR2(15)		NOT NULL,
    descripcion              VARCHAR2(50)		NOT NULL,
    costo_mensual            NUMBER(6,2)		NOT NULL,
CONSTRAINT membresia_tipo_pk 
    PRIMARY KEY(tipo_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla usuario    nivel-1(Indicar el nivel SIEMPRE)-
-- ----------------------------------------------------------------
CREATE TABLE usuario (
    id_pk                    NUMBER(8),
    nombre                   VARCHAR2(15)		NOT NULL,
    password                 VARCHAR2(8)		NOT NULL,
    fecha_acesso             DATE			NOT NULL,
    intento                  NUMBER(2)			NOT NULL,
    fecha_exp                DATE			NOT NULL,
    tipo                     VARCHAR2(2)		NOT NULL,
CONSTRAINT usuario_id_pk 
    PRIMARY KEY(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla equipo  nivel-1(Indicar el nivel SIEMPRE)-
-- ----------------------------------------------------------------
CREATE TABLE equipo (
    codigo_pk                VARCHAR2(6),
    nombre                   VARCHAR2(35)		NOT NULL,
    costo                    NUMBER(6,2)		NOT NULL,
    comentario               VARCHAR2(57),
CONSTRAINT equipo_codigo_pk 
    PRIMARY KEY(codigo_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla actividad nivel-1 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE actividad (
    codigo_pk                VARCHAR2(5),
    nombre                   VARCHAR2(25)		NOT NULL,
    descripcion              VARCHAR2(50)		NOT NULL,
    comentario               VARCHAR2(50),
CONSTRAINT actividad_codigo_pk 
    PRIMARY KEY(codigo_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla estado nivel-1 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE estado (
	id_pk                    NUMBER(8),
	nombre			 VARCHAR2(15)	    NOT NULL,
CONSTRAINT estado_id_pk
    PRIMARY KEY(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla ciudad nivel-2 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE ciudad (
	id_pk                   NUMBER(8),
	id_estado_fk1		NUMBER(8)           NOT NULL,
	nombre			VARCHAR2(15)        NOT NULL,
CONSTRAINT ciudad_id_pk
    PRIMARY KEY(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla direccion nivel-2 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE direccion (
        id_pk				NUMBER(8),
	linea_1     			VARCHAR2(50)		NOT NULL,
	linea_2      			VARCHAR2(50),
	urban_barrio    		VARCHAR(20),
	id_ciudad_fk1   		NUMBER(8)		NOT NULL,
	zipcode         		NUMBER(5)		NOT NULL,
CONSTRAINT direccion_id_pk
	PRIMARY KEY (id_pk),
CONSTRAINT direccion_id_ciudad_fk1
    FOREIGN KEY (id_ciudad_fk1)
	REFERENCES ciudad(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla horario nivel-2(Indicar el nivel SIEMPRE)   -
-- ----------------------------------------------------------------
CREATE TABLE horario (
    codigo_pk                VARCHAR2(10),
    codigo_actividad_fk      VARCHAR(5),
    cant_horas               NUMBER(2)		NOT NULL,
    lugar 		     VARCHAR2(35)	NOT NULL,
CONSTRAINT horario_codigo_pk 
    PRIMARY KEY(codigo_pk),
CONSTRAINT horario_codigo_actividad_fk
	FOREIGN KEY(codigo_actividad_fk)
	REFERENCES actividad(codigo_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla facilidad nivel-2 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE facilidad (
	id_pk 		    NUMBER(8),
	nombre		    VARCHAR2(30)			NOT NULL,
	id_direccion_fk1    NUMBER(8)				NOT NULL,
	telefono            VARCHAR(13),
	correo_electronico  VARCHAR(38),
CONSTRAINT facilidad_id_pk
	PRIMARY KEY(id_pk),
CONSTRAINT facilidad_id_direccion_fk1
	FOREIGN KEY (id_direccion_fk1)
	REFERENCES direccion(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla empleado nivel-3 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE empleado (
    numero_pk                NUMBER(8),
    id_facilidad_fk1         NUMBER(8)          NOT NULL,
    numero_empleado_fk2      NUMBER(8)		NOT NULL,
    nombre                   VARCHAR2(15)	NOT NULL,
    inicial                  CHAR(1),
    apellido_paterno         VARCHAR2(15)	NOT NULL,
    apellido_materno         VARCHAR2(15),
    id_direccion_fk3         NUMBER(8)          NOT NULL,
    fecha_nacimiento         DATE		NOT NULL,
    genero                   CHAR(1)		NOT NULL,
    celular                  VARCHAR2(13),
    email                    VARCHAR2(30),
    tipo                     CHAR(1)            NOT NULL,
    horas_trabajadas         NUMBER(5, 1),
    rate		     NUMBER(5, 1),
    numero_contrato	     NUMBER(5),
    fecha_contrato	     DATE,
    cantidad_contrato        NUMBER(2),
    salario_mensual          NUMBER(6, 2),
    bono                     NUMBER(6, 2),
CONSTRAINT empleado_numero_pk 
    PRIMARY KEY(numero_pk),
CONSTRAINT empleado_id_facilidad_fk1
	FOREIGN KEY(id_facilidad_fk1)
	REFERENCES facilidad(id_pk),
CONSTRAINT empleado_numero_empleado_fk2
	FOREIGN KEY(numero_empleado_fk2)
	REFERENCES empleado(numero_pk),
CONSTRAINT empleado_id_direccion_fk3
	FOREIGN KEY(id_direccion_fk3)
	REFERENCES direccion(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla cliente nivel-3 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE cliente (
    real_id_pk               NUMBER(8),
    tipo_membresia_fk1       VARCHAR(2)			NOT NULL,
    nombre                   VARCHAR2(15)		NOT NULL,
    inicial                  CHAR(1),
    apellido_paterno         VARCHAR2(15)		NOT NULL,
    apellido_materno         VARCHAR2(15),
    id_direccion_fk2         NUMBER(8)          	NOT NULL,
    fecha_nacimiento         DATE			NOT NULL,
    genero                   CHAR(1)			NOT NULL,
    celular                  VARCHAR2(13),
    email                    VARCHAR2(30),
CONSTRAINT cliente_numero_pk 
    PRIMARY KEY(real_id_pk),
CONSTRAINT cliente_tipo_membresia_fk1
    FOREIGN KEY (tipo_membresia_fk1) 
    REFERENCES membresia(tipo_pk),
CONSTRAINT cliente_id_direccion_fk2
	FOREIGN KEY (id_direccion_fk2)
	REFERENCES direccion(id_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Creacion tabla sesion nivel-3 (Indicar el nivel SIEMPRE)  -
-- ----------------------------------------------------------------
CREATE TABLE sesion (
    id_pk                    NUMBER(13),
    id_facilidad_fk1         NUMBER(8)          NOT NULL,
    real_id_cliente_fk2      NUMBER(8)		NOT NULL,
    numero_empleado_fk3      NUMBER(8)          NOT NULL,
    codigo_horario_fk4       VARCHAR2(10)	NOT NULL,
    codigo_equipo_fk5        VARCHAR2(6),
    status                   VARCHAR2(25)	NOT NULL,
    comentario               VARCHAR2(52),
CONSTRAINT sesion_id_pk 
    PRIMARY KEY(id_pk),
CONSTRAINT sesion_id_facilidad_fk1
	FOREIGN KEY (id_facilidad_fk1)
	REFERENCES facilidad(id_pk),
CONSTRAINT sesion_real_id_cliente_fk2 
    FOREIGN KEY (real_id_cliente_fk2) 
    REFERENCES cliente(real_id_pk),
CONSTRAINT session_numero_empleado_fk3
	FOREIGN KEY (numero_empleado_fk3)
	REFERENCES empleado(numero_pk),
CONSTRAINT sesion_codigo_horario_fk4 
    FOREIGN KEY (codigo_horario_fk4) 
    REFERENCES horario(codigo_pk),
CONSTRAINT sesion_codigo_equipo_fk5 
    FOREIGN KEY (codigo_equipo_fk5) 
    REFERENCES equipo(codigo_pk)
);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: membresia                            -
-- ----------------------------------------------------------------
INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('C', 'Clasico', 'Acceso calistenia y entrenamiento', 25.00);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('E', 'Estudiante', 'Acceso a area de pesas y calistenia', 25.00);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('F', 'Fanatico', 'Acceso VIP + descuentos', 100.00);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('G', 'Gerencia', 'Acceso total', 79.99);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('L', 'Limitado', 'Acceso a area de pesas', 19.99);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('P', 'Premium', 'Acceso completo', 49.99);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('R', 'Regular', 'Acceso a area de pesas y entrenamiento', 29.99);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('T', 'Temporero', 'Acceso a programa de entrenamiento', 9.99);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('U', 'Ultimate', 'Acceso total + descuento 50% + masaje', 120.00);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('V', 'VIP', 'Acceso completo + maquinas de masaje', 99.99);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('B', 'Bronze', 'Entrenamiento de flexibilidad', 92.13);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('S', 'Silver', 'Con acceso ilimitado a clases grupales', 95.39);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('BC', 'Basic', 'Entrenamiento de explosividad', 83.42);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('RW', 'Renew', 'Entrenamiento de coordinacion', 79.42);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('RE', 'Revive', 'Entrenamiento de potencia', 25.16);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('MX', 'Max', 'Entrenamiento de postura', 56.27);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('FT', 'Fit', 'Entrenamiento de flexibilidad', 71.47);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('BT', 'Boost', 'Entrenamiento de pérdida de peso', 21.18);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('GD', 'Gold', 'Entrenamiento de tonificacion', 19.61);

INSERT INTO membresia (tipo_pk, titulo, descripcion, costo_mensual) 
VALUES ('EX', 'Extreme', 'Entrenamiento de fuerza', 69.59);
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: usuario                              -
-- ----------------------------------------------------------------
INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (1, 'Ana', 'pass123', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 3, TO_DATE('2023-12-01', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (2, 'Carlos', 'gym2023', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 0, TO_DATE('2023-12-15', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (3, 'Luis', 'clave456', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 5, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (4, 'Maria', 'pass789', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 1, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (5, 'Elena', 'gym2023', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 2, TO_DATE('2023-12-20', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (6, 'David', 'clave123', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 0, TO_DATE('2023-12-08', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (7, 'Sara', 'pass456', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 3, TO_DATE('2023-12-18', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (8, 'Javier', 'gym2023', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 1, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (9, 'Laura', 'clave789', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 4, TO_DATE('2023-12-03', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (10, 'Pedro', 'pass123', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 2, TO_DATE('2023-12-22', 'YYYY-MM-DD'), 'SU');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (11, 'Isabel', 'gym2023', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 4, TO_DATE('2023-12-25', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (12, 'Roberto', 'pass789', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 1, TO_DATE('2023-12-14', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (13, 'Marta', 'clave123', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 3, TO_DATE('2023-12-28', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (14, 'Carlos', 'pass789', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 2, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (15, 'Ana', 'gym2023', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 1, TO_DATE('2023-12-15', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (16, 'Laura', 'clave456', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 3, TO_DATE('2023-12-18', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (17, 'Luis', 'pass456', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 0, TO_DATE('2023-12-22', 'YYYY-MM-DD'), 'SU');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (18, 'Elena', 'clave789', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 2, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 'A');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (19, 'David', 'gym2023', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 1, TO_DATE('2023-12-08', 'YYYY-MM-DD'), 'U');

INSERT INTO usuario (id_pk, nombre, password, fecha_acesso, intento, fecha_exp, tipo) 
VALUES (20, 'Sara', 'clave123', TO_DATE('2023-11-21', 'YYYY-MM-DD'), 4, TO_DATE('2023-12-20', 'YYYY-MM-DD'), 'U');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: Equipo                               -
-- ----------------------------------------------------------------
INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC001', 'Maquina de Pesas', 499.99, 'Equipo de entrenamiento para levantamiento de pesas');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC002', 'Cinta de Correr', 899.99, 'Equipo de cardio para correr y caminar');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC003', 'Banco de Pesas', 299.99, 'Banco ajustable para ejercicios de pesas');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC004', 'Bicicleta Estacionaria', 599.99, 'Bicicleta estatica para entrenamiento cardiovascular');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC005', 'Maquina de Remo', 749.99, 'Equipo para ejercicios de remo y entrenamiento de espalda');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC006', 'Maquina de Cardio Eliptica', 699.99, 'Equipo de cardio para entrenamiento eliptico');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC007', 'Maquina Smith', 799.99, 'Equipo versatil para ejercicios de fuerza');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC008', 'Bola de Medicina', 49.99, 'Bola ponderada para ejercicios de resistencia');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC009', 'Bandas de Resistencia', 29.99, 'Bandas elasticas para entrenamiento de resistencia');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC010', 'Maquina de Abdominales', 129.99, 'Equipo para ejercicios abdominales y de core');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC011', 'Barra Olimpica', 179.99, 'Barra de pesas olimpica');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC012', 'Step Aerobico', 39.99, 'Plataforma ajustable para aerobicos');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC013', 'TRX Suspension Trainer', 129.99, 'Entrenamiento funcional con cuerdas');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC014', 'Pelota de Yoga', 24.99, 'Pelota de yoga para flexibilidad');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC015', 'Maquina de Gluteos', 449.99, 'Equipo para gluteos y piernas');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC016', 'Plataforma Vibratoria', 299.99, 'Plataforma vibradora para cuerpo');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC017', 'Kettlebell', 59.99, 'Pesas rusas para fuerza y resistencia');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC018', 'Monitor de Ritmo Cardiaco', 69.99, 'Dispositivo para medir frecuencia cardiaca');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC019', 'Pesas Ajustables', 149.99, 'Conjunto de pesas ajustables');

INSERT INTO equipo (codigo_pk, nombre, costo, comentario) 
VALUES ('MC020', 'Maquina de Traccion', 549.99, 'Equipo para traccion y espalda');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: Equipo                               -
-- ----------------------------------------------------------------
INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC01', 'Levantamiento de Pesas', 'Entrenamiento de fuerza con pesas', 'Rutina para principiantes');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC02', 'Natación', 'Nado y ejercicios acuáticos', 'Entrenamiento cardiovascular en la piscina');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC03', 'Cardio', 'Ejercicios cardiovasculares', 'Rutina intensiva de cardio');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC04', 'Spinning', 'Ciclismo indoor con música', 'Clase de spinning para quemar calorías');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC05', 'Entrenamiento Funcional', 'Ejercicios variados de cuerpo completo', 'Sesión de entrenamiento funcional');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC06', 'Atletismo', 'Carrera y ejercicios de velocidad', 'Sesión de entrenamiento en pista cubierta');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC07', 'Yoga', 'Ejercicios de flexibilidad y relajación', 'Clase de yoga para mejorar la flexibilidad');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC08', 'Baloncesto', 'Juego de baloncesto en grupo', 'Partido amistoso de baloncesto en la cancha');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC09', 'Tenis', 'Partido de tenis individual', 'Sesión de tenis para mejorar las habilidades');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC10', 'CrossFit', 'Entrenamiento de alta intensidad', 'Clase de CrossFit para mejorar la resistencia');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC11', 'Pilates', 'Core y flexibilidad', 'Sesión de Pilates');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC12', 'Escalada en Roca', 'Ascenso en paredes de roca', 'Escalada en roca');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC13', 'Kickboxing', 'Boxeo y patadas', 'Clase de Kickboxing');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC14', 'Ciclismo al Aire Libre', 'Ciclismo al aire libre en senderos', 'Paseo en bicicleta');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC15', 'Zumba', 'Baile con ejercicios aeróbicos', 'Clase de Zumba');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC16', 'Tai Chi', 'Arte marcial chino', 'Clase de Tai Chi');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC17', 'Paddleboarding', 'Remar de pie en tabla en el agua', 'Paddleboarding');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC18', 'Jiu-Jitsu', 'Arte marcial brasileño', 'Clase de Jiu-Jitsu');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC19', 'Circuito', 'Estaciones de ejercicios variados', 'Entrenamiento en circuito');

INSERT INTO actividad (codigo_pk, nombre, descripcion, comentario) 
VALUES ('ACC20', 'Ballet Fitness', 'Ejercicios de ballet', 'Clase de ballet fitness');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: Estado                               -
-- ----------------------------------------------------------------
INSERT INTO estado (id_pk, nombre) 
VALUES (1, 'New York');

INSERT INTO estado (id_pk, nombre) 
VALUES (2, 'Kentucky');

INSERT INTO estado (id_pk, nombre) 
VALUES (3, 'Texas');

INSERT INTO estado (id_pk, nombre) 
VALUES (4, 'Florida');

INSERT INTO estado (id_pk, nombre) 
VALUES (5, 'Arizona');

INSERT INTO estado (id_pk, nombre) 
VALUES (6, 'Colorado');

INSERT INTO estado (id_pk, nombre) 
VALUES (7, 'Oregon');

INSERT INTO estado (id_pk, nombre) 
VALUES (8, 'Idaho');

INSERT INTO estado (id_pk, nombre) 
VALUES (9, 'California');

INSERT INTO estado (id_pk, nombre) 
VALUES (10, 'Puerto Rico');

INSERT INTO estado (id_pk, nombre) 
VALUES (11, 'Washington');

INSERT INTO estado (id_pk, nombre) 
VALUES (12, 'Louisiana');

INSERT INTO estado (id_pk, nombre) 
VALUES (13, 'Michigan');

INSERT INTO estado (id_pk, nombre) 
VALUES (14, 'Pennsylvania');

INSERT INTO estado (id_pk, nombre) 
VALUES (15, 'Georgia');

INSERT INTO estado (id_pk, nombre) 
VALUES (16, 'North Carolina');

INSERT INTO estado (id_pk, nombre) 
VALUES (17, 'Massachusetts');

INSERT INTO estado (id_pk, nombre) 
VALUES (18, 'New Jersey');

INSERT INTO estado (id_pk, nombre) 
VALUES (19, 'New Mexico');

INSERT INTO estado (id_pk, nombre) 
VALUES (20, 'South Carolina');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: ciudad                               -
-- ----------------------------------------------------------------
INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10001, 1, 'New York');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10002, 2, 'Frankfort');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10003, 2, 'Greenville');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10004, 4, 'Miami');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10005, 4, 'Orlando');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10006, 6, 'Lakewood');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10007, 7, 'Portland');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10008, 8, 'Lewiston');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10009, 9, 'San Francisco');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10010, 10, 'Guaynabo');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10011, 11, 'Buffalo');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10012, 12, 'Lexington');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10013, 13, 'Greenville');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10014, 14, 'Tampa');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10015, 15, 'Jacksonville');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10016, 16, 'Denver');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10017, 17, 'Eugene');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10018, 18, 'Boise');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10019, 19, 'Los Angeles');

INSERT INTO ciudad (id_pk, id_estado_fk1, nombre) 
VALUES (10020, 20, 'San Juan');
-- ----------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: direccion                            -
-- ----------------------------------------------------------------
INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200001, '123 Main Street', 'Apt 4B', 'Downtown', 10002, 54321);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200002, '456 Oak Avenue', 'Suite 302', 'Central District', 10003, 67890);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200003, '789 Pine Lane', 'Suite 501', 'Lakeside', 10003, 23456);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200004, '101 Elm Street', 'Apt 2C', 'Hilltop', 10003, 78901);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200005, '210 Maple Road', 'Apt 1A', 'Seaside', 10005, 34567);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200006, '543 Cedar Drive', 'Apt 7C', 'Coastal Area', 10005, 89012);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200007, '876 Birch Street', 'Apt 3D', 'Beachside', 10005, 45678);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200008, '111 Pine Avenue', 'Suite 101', 'Urban Center', 10010, 01234);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200009, '222 Oak Lane', 'Apt 2A', 'Commercial Zone', 10010, 56789);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200010, '333 Maple Street', 'Suite 501', 'Residential Area', 10010, 12345);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200011, '808 Pineapple Ln', 'Apt. 45', 'Sunny Heights', 10011, 94832);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200012, '909 Mango St', 'Room 101', 'Orchardview', 10012, 29284);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200013, '101 Coconut Ave', 'Suite 18', 'Palm Gardens', 10013, 19384);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200014, '202 Banana Blvd', 'Apt. 23', 'Tropicana Estates', 10013, 95854);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200015, '303 Papaya Dr', 'Apt. 56', 'Beachside', 10015, 28238);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200016, '404 Kiwi Ct', 'Apt. 67', 'Green Meadows', 10015, 19484);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200017, '505 Berry Ln', 'Suite 8', 'Berriewood', 10015, 12948);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200018, '606 Apple Ave', NULL, 'Orchardview', 10018, 59595);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200019, '707 Grape St', 'Apt. 12', 'Vineyard Hills', 10018, 89494);

INSERT INTO direccion (id_pk, linea_1, linea_2, urban_barrio, id_ciudad_fk1, zipcode) 
VALUES (200020, '808 Lemon Dr', 'Room 202', 'Citrus Heights', 10020, 49389);
---------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: horario                              -
-- ----------------------------------------------------------------
INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('L08081123', 'ACC01', 2, 'Zona de Levantamiento de Pesas');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('L08081123', 'ACC02', 1, 'Zona de Calistenia');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('K09101123', 'ACC03', 3, 'Área de Cardio');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('M09151123', 'ACC04', 2, 'Clase de Spinning');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('J07301123', 'ACC05', 4, 'Estudio de Fitness');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('J09301123', 'ACC06', 2, 'Pista Cubierta');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('V08251123', 'ACC07', 1, 'Estudio de Yoga');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('V08281123', 'ACC08', 3, 'Cancha de Baloncesto');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('S08221123', 'ACC09', 4, 'Canchas de Tenis');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('S08251123', 'ACC10', 3, 'Box de CrossFit');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('M12031123', 'ACC11', 2, 'Zona de Levantamiento de Pesas');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('J01111123', 'ACC12', 1, 'Zona de Calistenia');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('V09121123', 'ACC13', 3, 'Área de Cardio');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('S02151123', 'ACC14', 2, 'Clase de Spinning');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('D06091123', 'ACC15', 4, 'Estudio de Fitness');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('L04251123', 'ACC16', 2, 'Pista Cubierta');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('J07211123', 'ACC17', 1, 'Estudio de Yoga');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('S05121123', 'ACC18', 3, 'Cancha de Baloncesto');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('M11231123', 'ACC19', 4, 'Canchas de Tenis');

INSERT INTO horario (codigo_pk, codigo_actividad_fk, cant_horas, lugar)
VALUES ('V08021123', 'ACC20', 3, 'Box de CrossFit');
---------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: facilidad                            -
-- ----------------------------------------------------------------
INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30001, 'Anibal Gym Coamo', 200001, '7874432264', 'anibal.gym.coamo@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30002, 'Anibal Gym Guaynabo', 200002, '7874432262', 'anibal.gym.guaynabo@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30003, 'Anibal Gym New York', 200003, '7874432261', 'anibal.gym.newyork@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30004, 'Anibal Gym Bayamon', 200004, '7874432321', 'anibal.gym.bayamon@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30005, 'Anibal Gym San Juan', 200005, '7874423234', 'anibal.gym.sanjuan@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30006, 'Anibal Gym Florida', 200006, '7874436664', 'anibal.gym.florida@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30007, 'Anibal Gym Oregon', 200007, '7874432578', 'anibal.gym.oregon@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30008, 'Anibal Gym USA', 200008, '7874437899', 'anibal.gym.usa@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30009, 'Anibal Gym Centrals', 200009, '78744334944', 'anibal.gym@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30010, 'Anibal Gym Studio', 200010, '78744339349', 'anibal.gym.studio@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30011, 'Anibal Gym Texas', 200011, '7874431122', 'anibal.gym.texas@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30012, 'Anibal Gym California', 200012, '7874433344', 'anibal.gym.california@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30013, 'Anibal Gym Chicago', 200013, '7874435566', 'anibal.gym.chicago@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30014, 'Anibal Gym Las Vegas', 200014, '7874437788', 'anibal.gym.vegas@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30015, 'Anibal Gym Denver', 200015, '7874439900', 'anibal.gym.denver@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30016, 'Anibal Gym Atlanta', 200016, '7874431122', 'anibal.gym.atlanta@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30017, 'Anibal Gym Seattle', 200017, '7874433344', 'anibal.gym.seattle@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30018, 'Anibal Gym Phoenix', 200018, '7874435566', 'anibal.gym.phoenix@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30019, 'Anibal Gym Miami', 200019, '7874437788', 'anibal.gym.miami@anibal-gym.com');

INSERT INTO facilidad (id_pk, nombre, id_direccion_fk1, telefono, correo_electronico)
VALUES (30020, 'Anibal Gym Washington, D.C.', 200020, '7874439900', 'anibal.gym.dc@anibal-gym.com');
---------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: empleado                             -
-- ----------------------------------------------------------------
INSERT INTO empleado 
VALUES (500001, 30001, 500001, 'Jose', 'J', 'Gomez', 'Perez', 200001, TO_DATE('1980-05-15', 'YYYY-MM-DD'), 'M', '+123456789', 'jose.gomez@email.com', 'A', NULL, NULL, NULL, NULL, NULL, 4500.00, 10.00);

INSERT INTO empleado 
VALUES (500002, 30002, 500002, 'Lucy', 'A', 'Torres', 'Matos', 200002, TO_DATE('1985-09-23', 'YYYY-MM-DD'), 'F', '+987654321', 'ana.lopez@email.com', 'A', NULL, NULL, NULL, NULL, NULL, 4500.00, 20.00);

INSERT INTO empleado 
VALUES (500003, 30003, 500003, 'Carlos', 'C', 'Sandoval', 'Lemus', 200003, TO_DATE('1978-12-10', 'YYYY-MM-DD'), 'M', '+1122334455', 'carlos.rodriguez@email.com', 'A', NULL, NULL, NULL, NULL, NULL, 4500.00, 30.00);

INSERT INTO empleado 
VALUES (500004, 30001, 500001, 'Miguel', 'A', 'Lopez', 'Castro', 200004, TO_DATE('1968-11-10', 'YYYY-MM-DD'), 'M', '+7874457762', 'miguel.lopez@gmail.com', 'A', NULL, NULL, NULL, NULL, NULL, 2500.00, 50.00);

INSERT INTO empleado 
VALUES (500005, 30001, 500001, 'Lugo', 'E', 'Velez', 'Sandoval', 200005, TO_DATE('1920-11-10', 'YYYY-MM-DD'), 'M', '+7874566678', 'lugo.velez@gmail.com', 'A', NULL, NULL, NULL, NULL, NULL, 2500.00, 50.00);

INSERT INTO empleado 
VALUES (500006, 30001, 500001, 'Hector', 'S', 'Cruz', 'Villegas', 200006, TO_DATE('1999-09-08', 'YYYY-MM-DD'), 'M', '+7877638899', 'hector.cruz@gmail.com', 'A', NULL, NULL, NULL, NULL, NULL, 2500.00, 50.00);

INSERT INTO empleado 
VALUES (500007, 30005, 500002, 'Jorge', 'M', 'Sandoval', 'Torres', 200007, TO_DATE('1982-03-30', 'YYYY-MM-DD'), 'F', '+5544332211', 'maria.fernandez@email.com', 'E', NULL, NULL, 4468, TO_DATE('2022-01-05', 'YYYY-MM-DD'), 2, NULL, NULL);

INSERT INTO empleado 
VALUES (500008, 30005, 500002, 'Eduardo', 'E', 'Gutiérrez', 'Díaz', 200008, TO_DATE('1987-08-18', 'YYYY-MM-DD'), 'M', '+9988776655', 'eduardo.gutierrez@email.com', 'E', NULL, NULL, 4469, TO_DATE('2022-01-06', 'YYYY-MM-DD'), 1, NULL, NULL);

INSERT INTO empleado 
VALUES (500009, 30005, 500002, 'Laura', 'L', 'Pérez', 'Romero', 200009, TO_DATE('1989-11-25', 'YYYY-MM-DD'), 'F', '+6677889900', 'laura.perez@email.com', 'E', NULL, NULL, 4470, TO_DATE('2022-01-06', 'YYYY-MM-DD'), 1, NULL, NULL);

INSERT INTO empleado 
VALUES (500010, 30005, 500002, 'Javier', 'J', 'Hernández', 'Sánchez', 200010, TO_DATE('1984-06-12', 'YYYY-MM-DD'), 'M', '+1122334455', 'javier.hernandez@email.com', 'M', 60, 15.00, NULL, NULL, NULL, NULL, NULL);

INSERT INTO empleado 
VALUES (500011, 30005, 500002, 'Isabel', 'I', 'Padilla', 'Jiménez', 200011, TO_DATE('1986-02-08', 'YYYY-MM-DD'), 'F', '+9988776655', 'isabel.gomez@email.com', 'E', NULL, NULL, 4471, TO_DATE('2022-01-07', 'YYYY-MM-DD'), 2, NULL, NULL);

INSERT INTO empleado 
VALUES (500012, 30009, 500003, 'Sergio', 'S', 'Martínez', 'Fernández', 200012, TO_DATE('1981-07-05', 'YYYY-MM-DD'), 'M', '+5544332211', 'sergio.martinez@email.com', 'M', 60, 15.00, NULL, NULL, NULL, NULL, NULL);

INSERT INTO empleado 
VALUES (500013, 30010, 500003, 'Mónica', 'M', 'García', 'López', 200013, TO_DATE('1983-04-20', 'YYYY-MM-DD'), 'F', '+6677889900', 'monica.garcia@email.com', 'M', 35, 15.00, NULL, NULL, NULL, NULL, NULL);

INSERT INTO empleado 
VALUES (500014, 30001, 500003, 'Gabriela', 'G', 'Mendoza', 'García', 200014, TO_DATE('1986-08-07', 'YYYY-MM-DD'), 'F', '+123456789', 'gabriela.mendoza@email.com', 'M', 30, 15.00, NULL, NULL, NULL, NULL, NULL);

INSERT INTO empleado 
VALUES (500015, 30002, 500003, 'Ricardo', 'R', 'Vargas', 'López', 200015, TO_DATE('1975-11-12', 'YYYY-MM-DD'), 'M', '+987654321', 'ricardo.vargas@email.com', 'M', 25, 15.00, NULL, NULL, NULL, NULL, NULL);

INSERT INTO empleado 
VALUES (500016, 30003, 500003, 'Mariana', 'M', 'González', 'Sánchez', 200015, TO_DATE('1988-02-25', 'YYYY-MM-DD'), 'F', '+1122334455', 'mariana.gonzalez@email.com', 'M', 25, 15.00, NULL, NULL, NULL, NULL, NULL);

INSERT INTO empleado 
VALUES (500017, 30004, 500001, 'Alejandro', 'A', 'Morales', 'Torres', 200016, TO_DATE('1983-05-08', 'YYYY-MM-DD'), 'M', '+5544332211', 'alejandro.morales@email.com', 'M', 45, 15.00, NULL, NULL, NULL, NULL, NULL);

INSERT INTO empleado 
VALUES (500018, 30005, 500001, 'Valentina', 'V', 'Peralta', 'Díaz', 200017, TO_DATE('1990-09-30', 'YYYY-MM-DD'), 'F', '+9988776655', 'valentina.peralta@email.com', 'M', 48, 15.00, NULL, NULL, NULL, NULL, NULL);

INSERT INTO empleado 
VALUES (500019, 30006, 500001, 'Daniel', 'D', 'Sánchez', 'Romero', 200018, TO_DATE('1985-12-17', 'YYYY-MM-DD'), 'M', '+6677889900', 'daniel.sanchez@email.com', 'M', 60, 15.00, NULL, NULL, NULL, NULL, NULL);

INSERT INTO empleado 
VALUES (500020, 30007, 500001, 'Patricia', 'P', 'Maldonado', 'La Paz', 200019, TO_DATE('1989-03-22', 'YYYY-MM-DD'), 'F', '+1122334455', 'patricia.maldonado@email.com', 'M', 60, 15.00, NULL, NULL, NULL, NULL, NULL);
---------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: cliente                              -
-- ----------------------------------------------------------------
INSERT INTO cliente 
VALUES (400001, 'R', 'Ana', 'A', 'López', 'García', 200001, TO_DATE('1940-09-23', 'YYYY-MM-DD'), 'F', '+987654321', 'ana.lopez@email.com');

INSERT INTO cliente 
VALUES (400002, 'R', 'Carlos', 'C', 'Rodríguez', 'Hernández', 200002, TO_DATE('1978-12-10', 'YYYY-MM-DD'), 'M', '+1122334455', 'carlos.rodriguez@email.com');

INSERT INTO cliente 
VALUES (400003, 'L', 'Luis', 'L', 'Martínez', 'Fernández', 200003, TO_DATE('1982-03-30', 'YYYY-MM-DD'), 'M', '+5544332211', 'luis.martinez@email.com');

INSERT INTO cliente 
VALUES (400004, 'V', 'María', 'M', 'Fernández', 'Martínez', 200004, TO_DATE('1987-08-18', 'YYYY-MM-DD'), 'F', '+9988776655', 'maria.fernandez@email.com');

INSERT INTO cliente 
VALUES (400005, 'P', 'Elena', 'E', 'Gutiérrez', 'Díaz', 200005, TO_DATE('1989-11-25', 'YYYY-MM-DD'), 'F', '+6677889900', 'elena.gutierrez@email.com');

INSERT INTO cliente 
VALUES (400006, 'G', 'David', 'D', 'Pérez', 'Romero', 200006, TO_DATE('1984-06-12', 'YYYY-MM-DD'), 'M', '+1122334455', 'david.perez@email.com');

INSERT INTO cliente 
VALUES (400007, 'V', 'Sara', 'S', 'Hernández', 'Sánchez', 200007, TO_DATE('1986-02-08', 'YYYY-MM-DD'), 'F', '+9988776655', 'sara.hernandez@email.com');

INSERT INTO cliente 
VALUES (400008, 'R', 'Javier', 'J', 'Gómez', 'Jiménez', 200008, TO_DATE('1981-07-05', 'YYYY-MM-DD'), 'M', '+5544332211', 'javier.gomez@email.com');

INSERT INTO cliente 
VALUES (400009, 'P', 'Laura', 'L', 'Martínez', 'Fernández', 200009, TO_DATE('1983-04-20', 'YYYY-MM-DD'), 'F', '+6677889900', 'laura.martinez@email.com');

INSERT INTO cliente 
VALUES (400010, 'G', 'Pedro', 'P', 'García', 'López', 200010, TO_DATE('1980-09-10', 'YYYY-MM-DD'), 'M', '+1122334455', 'pedro.garcia@email.com');

INSERT INTO cliente 
VALUES (400011, 'R', 'Gabriela', 'G', 'Mendoza', 'García', 200011, TO_DATE('1986-08-07', 'YYYY-MM-DD'), 'F', '+123456789', 'gabriela.mendoza@email.com');

INSERT INTO cliente 
VALUES (400012, 'L', 'Ricardo', 'R', 'Vargas', 'López', 200012, TO_DATE('1975-11-12', 'YYYY-MM-DD'), 'M', '+987654321', 'ricardo.vargas@email.com');

INSERT INTO cliente 
VALUES (400013, 'V', 'Mariana', 'M', 'González', 'Sánchez', 200013, TO_DATE('1988-02-25', 'YYYY-MM-DD'), 'F', '+1122334455', 'mariana.gonzalez@email.com');

INSERT INTO cliente 
VALUES (400014, 'P', 'Alejandro', 'A', 'Morales', 'Torres', 200014, TO_DATE('1983-05-08', 'YYYY-MM-DD'), 'M', '+5544332211', 'alejandro.morales@email.com');

INSERT INTO cliente 
VALUES (400015, 'G', 'Valentina', 'V', 'Peralta', 'Díaz', 200015, TO_DATE('1990-09-30', 'YYYY-MM-DD'), 'F', '+9988776655', 'valentina.peralta@email.com');

INSERT INTO cliente 
VALUES (400016, 'G', 'Daniel', 'D', 'Sánchez', 'Romero', 200016, TO_DATE('1985-12-17', 'YYYY-MM-DD'), 'M', '+6677889900', 'daniel.sanchez@email.com');

INSERT INTO cliente 
VALUES (400017, 'V', 'Patricia', 'P', 'Maldonado', 'Villegas', 200017, TO_DATE('1989-03-22', 'YYYY-MM-DD'), 'F', '+1122334455', 'patricia.maldonado@email.com');

INSERT INTO cliente 
VALUES (400018, 'R', 'Cristian', 'C', 'Reyes', 'Siragusa', 200018, TO_DATE('1981-06-03', 'YYYY-MM-DD'), 'M', '+9988776655', 'cristian.reyes@email.com');

INSERT INTO cliente 
VALUES (400019, 'P', 'Carolina', 'C', 'López', 'Colon', 200019, TO_DATE('1987-09-16', 'YYYY-MM-DD'), 'F', '+5544332211', 'carolina.lopez@email.com');

INSERT INTO cliente 
VALUES (400020, 'G', 'Gustavo', 'G', 'Ríos', 'Perez', 200020, TO_DATE('1984-02-08', 'YYYY-MM-DD'), 'M', '+6677889900', 'gustavo.rios@email.com');
---------------------------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema. Se tienen que indicar –
-- ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
-- ----------------------------------------------------------------
-- -   Insertar datos tabla: sesion                              -
-- ----------------------------------------------------------------
INSERT INTO sesion 
VALUES (600001, 30002, 400001, 500001, 'L08081123', 'MC001', 'activo', 'Primera sesión de entrenamiento');

INSERT INTO sesion 
VALUES (600002, 30002, 400002, 500002, 'L08081123', 'MC002', 'pendiente', 'Sesión de entrenamiento cardiovascular');

INSERT INTO sesion 
VALUES (600003, 30003, 400003, 500003, 'K09101123', 'MC003', 'cancelado', 'Entrenador ausente');

INSERT INTO sesion 
VALUES (600004, 30003, 400004, 500004, 'M09151123', 'MC004', 'activo', 'Clase de spinning');

INSERT INTO sesion 
VALUES (600005, 30005, 400005, 500005, 'J07301123', 'MC005', 'pendiente', 'Sesión de entrenamiento funcional');

INSERT INTO sesion 
VALUES (600006, 30006, 400006, 500006, 'J09301123', 'MC006', 'cancelado', 'Entrenador de atletismo ausente');

INSERT INTO sesion 
VALUES (600007, 30008, 400007, 500007, 'V08251123', 'MC007', 'activo', 'Estiramiento y ejercicios isométricos');

INSERT INTO sesion 
VALUES (600008, 30008, 400008, 500008, 'V08281123', 'MC008', 'completado', 'Sesión de baloncesto exitosa');

INSERT INTO sesion 
VALUES (600009, 30009, 400009, 500009, 'S08221123', 'MC009', 'cancelado', 'Tenis cancelado por fuertes lluvias');

INSERT INTO sesion 
VALUES (600010, 30010, 400010, 500010, 'S08251123', 'MC010', 'completado', 'Un cliente se lesionó durante el CrossFit');

INSERT INTO sesion 
VALUES (600011, 30001, 400011, 500011, 'M12031123', 'MC011', 'pendiente', 'Sesión de entrenamiento de levantamiento de pesas');

INSERT INTO sesion 
VALUES (600012, 30002, 400012, 500012, 'J01111123', 'MC012', 'activo', 'Rutina intensiva de cardio');

INSERT INTO sesion 
VALUES (600013, 30003, 400013, 500013, 'V09121123', 'MC013', 'cancelado', 'Entrenador ausente en sesión de entrenamiento');

INSERT INTO sesion 
VALUES (600014, 30003, 400014, 500014, 'S02151123', 'MC014', 'activo', 'Clase de spinning');

INSERT INTO sesion 
VALUES (600015, 30005, 400015, 500015, 'D06091123', 'MC015', 'completado', 'Sesión de entrenamiento funcional completada');

INSERT INTO sesion 
VALUES (600016, 30006, 400016, 500016, 'L04251123', 'MC016', 'cancelado', 'Entrenador de atletismo ausente');

INSERT INTO sesion 
VALUES (600017, 30008, 400017, 500017, 'J07211123', 'MC017', 'activo', 'Clase de yoga');

INSERT INTO sesion 
VALUES (600018, 30008, 400018, 500018, 'S05121123', 'MC018', 'completado', 'Partido amistoso de baloncesto en la cancha');

INSERT INTO sesion 
VALUES (600019, 30009, 400019, 500019, 'M11231123', 'MC019', 'cancelado', 'Sesión de tenis cancelada por mal tiempo');

INSERT INTO sesion 
VALUES (600020, 30010, 400020, 500020, 'V08021123', 'MC020', 'completado', 'Cliente lesionado durante la clase de CrossFit');
