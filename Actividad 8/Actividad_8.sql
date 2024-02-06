DROP TABLE empleado;
DROP TABLE departamento;
SET ECHO ON;
CREATE TABLE departamento (
	codigo_pk					VARCHAR(8),	
	nombre						VARCHAR2(12) NOT NULL,
	telefono					NUMBER(10),
	descripcion					VARCHAR2(30),
	CONSTRAINT departamento_codigo_pk
		PRIMARY KEY (codigo_pk)
);
CREATE TABLE empleado (
	numero_pk               	NUMBER(10),
	codigo_departamento_fk  	VARCHAR2(8),
	nombre	                	VARCHAR2(15) NOT NULL,
	apellido_paterno 			VARCHAR2(15) NOT NULL,
	apellido_materno        	VARCHAR2(15),
	inicial						VARCHAR2(3),
	linea_1						VARCHAR2(30),
	linea_2						VARCHAR2(30),
	ciudad						VARCHAR2(15),
	pais						VARCHAR2(15) NOT NULL,
	zipcode						VARCHAR2(5)  NOT NULL,
	celular						NUMBER(10),
	correo_electronico      	VARCHAR2(30),
	fecha_nacimiento			DATE 	     NOT NULL,
	CONSTRAINT empleado_numero_pk 
		PRIMARY KEY (numero_pk),
	CONSTRAINT empleado_codigo_departamento_fk
		FOREIGN KEY (codigo_departamento_fk)
		REFERENCES departamento(codigo_pk)
);
