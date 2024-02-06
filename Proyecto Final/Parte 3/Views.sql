DROP VIEW administrador;
DROP VIEW entrenador;
DROP VIEW mantenimiento;

----------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.  -
-- -------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
----------------------------------------------
-- View administrador                        -
----------------------------------------------
CREATE VIEW administrador AS
SELECT
    numero_pk,
    id_facilidad_fk1,
    nombre,
    inicial,
    apellido_paterno,
    apellido_materno,
    id_direccion_fk3,
    fecha_nacimiento,
    genero,
    celular,
    email,
    tipo,
    TO_CHAR(salario_mensual, '$999,999.99') AS salario_mensual,
    TO_CHAR(bono, '$999,999.99') AS bono
FROM empleado
    WHERE tipo = 'A';

----------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.  -
-- -------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
----------------------------------------------
-- View entrenador                           -
----------------------------------------------
CREATE VIEW entrenador AS
SELECT
    numero_pk,
    id_facilidad_fk1,
    nombre,
    inicial,
    apellido_paterno,
    apellido_materno,
    id_direccion_fk3,
    fecha_nacimiento,
    genero,
    celular,
    email,
    tipo,
    numero_contrato,
    fecha_contrato,
    TO_CHAR(cantidad_contrato, '$99,999.99') AS cantidad_contrato
FROM empleado
    WHERE tipo = 'E';

----------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.  -
-- -------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
----------------------------------------------
-- View mantenimiento                        -
----------------------------------------------
CREATE VIEW mantenimiento AS
SELECT
    numero_pk,
    id_facilidad_fk1,
    nombre,
    inicial,
    apellido_paterno,
    apellido_materno,
    id_direccion_fk3,
    fecha_nacimiento,
    genero,
    celular,
    email,
    tipo,
    TO_CHAR(horas_trabajadas, '$99,999.99') AS horas_trabajadas,
    TO_CHAR(rate, '$99,999.99') AS rate
FROM empleado
    WHERE tipo = 'M';

----------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.  -
-- -------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
----------------------------------------------
-- VIEWS                                     -
----------------------------------------------
SELECT * FROM administrador;
SELECT * FROM entrenador;
SELECT * FROM mantenimiento;

----------------------------------------------
-- - Nombre de Usuario y Fecha del Sistema.  -
-- -------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
----------------------------------------------
-- Insertacion de datos para prueba de views -
----------------------------------------------
INSERT INTO empleado 
VALUES (500021, 30005, 500002, 'Manolo', 'M', 'Sandoval', 'Torres', 200007, TO_DATE('1982-03-30', 'YYYY-MM-DD'), 'F', '+5544332211', 'maria.fernandez@email.com', 'A', NULL, NULL, 4468, TO_DATE('2022-01-05', 'YYYY-MM-DD'), 400, NULL, NULL);
INSERT INTO empleado 
VALUES (500022, 30005, 500002, 'Lucio', 'L', 'Maricao', 'Vieques', 200007, TO_DATE('1982-03-30', 'YYYY-MM-DD'), 'F', '+5544332211', 'maria.fernandez@email.com', 'E', NULL, NULL, 4468, TO_DATE('2022-01-05', 'YYYY-MM-DD'), 400, NULL, NULL);
INSERT INTO empleado 
VALUES (500023, 30005, 500002, 'Tamarindo', 'P', 'Gonzalez', 'Castro', 200007, TO_DATE('1982-03-30', 'YYYY-MM-DD'), 'F', '+5544332211', 'maria.fernandez@email.com', 'M', NULL, NULL, 4468, TO_DATE('2022-01-05', 'YYYY-MM-DD'), 400, NULL, NULL);
----------------------------------------------
-- Mostra los views con los nuevos empleados -
----------------------------------------------
SELECT * FROM administrador;
SELECT * FROM entrenador;
SELECT * FROM mantenimiento;
