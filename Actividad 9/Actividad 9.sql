-----------------------------------------------------
-- Brian J. Cruz Castro, 841-21-5975                -
-----------------------------------------------------

-----------------------------------------------------
-- ACTIVIDAD 8
-- --------------------------------------------------
DROP TABLE empleado;
DROP TABLE departamento;
SET ECHO ON;
CREATE TABLE departamento (
	codigo_pk					VARCHAR2(8),	
	nombre						VARCHAR2(20) NOT NULL,
	telefono					NUMBER(10),
	descripcion					VARCHAR2(50),
	CONSTRAINT departamento_codigo_pk
		PRIMARY KEY (codigo_pk)
);
CREATE TABLE empleado (
	numero_pk               	NUMBER(10),
	codigo_departamento_fk  	VARCHAR2(8),
	nombre	                	VARCHAR2(20) NOT NULL,
	inicial						VARCHAR2(3),
	apellido_paterno 			VARCHAR2(15) NOT NULL,
	apellido_materno        	VARCHAR2(15),
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

-------------------------------------------------------
-- ACTIVIDAD 9
-------------------------------------------------------

SHOW USER
SELECT systimestamp FROM dual;

INSERT INTO departamento (codigo_pk, nombre, telefono, descripcion)
VALUES ('GCT5592', 'Espanol', 2564924262, 'Miercoles y Viernes a las 4:20pm');

INSERT INTO empleado (numero_pk, codigo_departamento_fk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, fecha_nacimiento, correo_electronico)
VALUES (32109876, 'GCT5592', 'Brook', 'J', 'Gulliford', 'Trinder', '188 Dwight Avenue', 'PO Box 75702', 'Cueto', 'Cuba', '28634', 7876664564, TO_DATE('10/19/1999', 'MM/DD/YYYY'), 'brook12@gmail.com');

INSERT INTO empleado (numero_pk, codigo_departamento_fk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, fecha_nacimiento, correo_electronico)
VALUES (78901234, 'GCT5592', 'Gerardo', 'A', 'Dealy', 'Waplinton', '08044 Veith Point', 'Apt 1167', 'Karangduren Dua', 'Indonesia', '24484', 7876664564, TO_DATE('3/23/1959', 'MM/DD/YYYY'), 'djnj@gmail.com');

SHOW USER
SELECT systimestamp FROM dual;

INSERT INTO departamento (codigo_pk, nombre, telefono, descripcion)
VALUES ('KYB7653', 'Matematica', 6043747882, 'No disponible');

INSERT INTO empleado (numero_pk, codigo_departamento_fk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, fecha_nacimiento, correo_electronico)
VALUES (23456789, 'KYB7653', 'Bryce', 'J', 'Dufaur', 'Petyt', '0825 Norway Maple Plaza', 'PO Box 83578', 'Mê Linh', 'Vietnam', '24482', 7873451209, TO_DATE('7/11/2004', 'MM/DD/YYYY'), 'bryce@gmail.com');

INSERT INTO empleado (numero_pk, codigo_departamento_fk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, fecha_nacimiento, correo_electronico)
VALUES (23456787, 'KYB7653', 'Teodor', 'J', 'Britian', 'Altoft', '75 Granby Drive', 'Apt 403', 'Palmares', 'Brazil', '55540', 7874561234, TO_DATE('1/19/1952', 'MM/DD/YYYY'), 'skkf@gmail.com');

SHOW USER
SELECT systimestamp FROM dual;

INSERT INTO departamento (codigo_pk, nombre, telefono, descripcion)
VALUES ('VFW9030', 'Fisica', 7552935585, 'De 10:00 am a 3:00pm');

INSERT INTO empleado (numero_pk, codigo_departamento_fk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, fecha_nacimiento, correo_electronico)
VALUES (09876543, 'VFW9030', 'Gavan', 'B', 'Truswell', 'Rash', '37159 Crownhardt Way', 'Suite 52', 'Shiyuan', 'China', '5568', 7874212098, TO_DATE('12/4/2003', 'MM/DD/YYYY'), 'gavan@gmail.com');

INSERT INTO empleado (numero_pk, codigo_departamento_fk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, fecha_nacimiento, correo_electronico)
VALUES (45678901, 'VFW9030', 'Urban', 'C', 'Pratton', 'Curness', '3880 Hansons Crossing', '20th Floor', 'Yacheng', 'China', '24482', 7874212091, TO_DATE('10/6/1947', 'MM/DD/YYYY'), 'urban@gmail.com');

SHOW USER
SELECT systimestamp FROM dual;

INSERT INTO departamento (codigo_pk, nombre, telefono, descripcion)
VALUES ('YHT2814', 'Electronica', 5592948189, 'Disponible');

INSERT INTO empleado (numero_pk, codigo_departamento_fk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, fecha_nacimiento, correo_electronico)
VALUES (94858483, 'YHT2814', 'Kenton', 'I', 'Duggan', 'Wolfarth', '9 Glacier Hill Park', 'Room 677', 'Kävlinge', 'Sweden', '24482', 7874212092, TO_DATE('11/28/1964', 'MM/DD/YYYY'), 'kenton@gmail.com');

INSERT INTO empleado (numero_pk, codigo_departamento_fk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, fecha_nacimiento, correo_electronico)
VALUES (67890123, 'YHT2814', 'Ransell', 'E', 'Odde', 'Krolle', '4 Loeprich Circle', 'Suite 46', 'Velykyy Burluk', 'Ukraine', '39380', 7874212094, TO_DATE('2/4/1985', 'MM/DD/YYYY'), 'ransell@gmail.com');

SHOW USER
SELECT systimestamp FROM dual;

INSERT INTO departamento (codigo_pk, nombre, telefono, descripcion)
VALUES ('CQQ5392', 'Ciencias Sociales', 7978399941, 'Lunes a viernes a las 7:00 am');

INSERT INTO empleado (numero_pk, codigo_departamento_fk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, fecha_nacimiento, correo_electronico)
VALUES (78901231, 'CQQ5392', 'Rory', 'D', 'Godber', 'Osbiston', '64898 Spenser Pass', 'Suite 5', 'Maskinongé', 'Canada', 'T7A', 7874212100, TO_DATE('5/2/1954', 'MM/DD/YYYY'), 'rory@gmail.com');

INSERT INTO empleado (numero_pk, codigo_departamento_fk, nombre, inicial, apellido_paterno, apellido_materno, linea_1, linea_2, ciudad, pais, zipcode, celular, fecha_nacimiento, correo_electronico)
VALUES (01234567, 'CQQ5392', 'Margot', 'B', 'Keedwell', 'Breach', '70 Forest Dale Junction', 'Suite 95', 'Atuntaqui', 'Ecuador', '56899', 7874212099, TO_DATE('12/23/1945', 'MM/DD/YYYY'), 'margot@gmail.com');
