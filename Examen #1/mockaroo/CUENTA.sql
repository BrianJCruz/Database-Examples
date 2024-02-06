create table cuenta (
	id_pk               VARCHAR(50),
	celular_persona_fk  VARCHAR(50)    NOT NULL,
	nombre              VARCHAR(12)    NOT NULL,
	password            VARCHAR(50)    NOT NULL,
	fecha_acceso        DATE           NOT NULL,
	intentos            INT            NOT NULL,
	fecha_exp           DATE           NOT NULL,
	tipo                VARCHAR(1)     NOT NULL
);
insert into cuenta (id_pk, celular_persona_fk, nombre, password, fecha_acceso, intentos, fecha_exp, tipo) values ('432089', '2306614965', 'alexanderlee', 'gP6`1N"oucV_', '3/25/2023', 16, '8/7/2028', 'A');
insert into cuenta (id_pk, celular_persona_fk, nombre, password, fecha_acceso, intentos, fecha_exp, tipo) values ('116594', '3042625791', 'emilythomas', 'pG4$\bmV#', '2/3/2023', 4, '9/8/2027', 'U');
insert into cuenta (id_pk, celular_persona_fk, nombre, password, fecha_acceso, intentos, fecha_exp, tipo) values ('661376', '8088963280', 'sophiawalker', 'nM8|*7G9dzV2', '11/15/2022', 13, '5/7/2026', 'U');
insert into cuenta (id_pk, celular_persona_fk, nombre, password, fecha_acceso, intentos, fecha_exp, tipo) values ('322017', '5212845014', 'alexanderlee', 'cF1!"671<KJK', '2/21/2023', 1, '6/14/2028', 'A');
insert into cuenta (id_pk, celular_persona_fk, nombre, password, fecha_acceso, intentos, fecha_exp, tipo) values ('117505', '7528913611', 'davidbrown', 'wX6)1Hb1{W', '12/21/2022', 14, '5/1/2026', 'A');
insert into cuenta (id_pk, celular_persona_fk, nombre, password, fecha_acceso, intentos, fecha_exp, tipo) values ('098831', '5932651800', 'sarahwilson', 'gN1|fKqoRb~', '12/5/2022', 13, '9/20/2027', 'A');
insert into cuenta (id_pk, celular_persona_fk, nombre, password, fecha_acceso, intentos, fecha_exp, tipo) values ('402357', '4247739605', 'mikejones', 'fY1&NN,UmV8hn', '3/31/2023', 10, '8/18/2028', 'U');
insert into cuenta (id_pk, celular_persona_fk, nombre, password, fecha_acceso, intentos, fecha_exp, tipo) values ('731539', '8103286460', 'johnsmith', 'sX7@/>AcK', '5/2/2023', 10, '5/19/2028', 'U');
insert into cuenta (id_pk, celular_persona_fk, nombre, password, fecha_acceso, intentos, fecha_exp, tipo) values ('047217', '3247978035', 'alexanderlee', 'gQ3)=G$U7a', '3/9/2023', 16, '3/11/2026', 'A');
insert into cuenta (id_pk, celular_persona_fk, nombre, password, fecha_acceso, intentos, fecha_exp, tipo) values ('643812', '7484823780', 'sarahwilson', 'iE5.ldA!', '8/5/2023', 5, '9/2/2028', 'A');
