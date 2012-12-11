//crear base de datos agenda
create database if not exists agenda;

alter database agenda default character set utf8 collate utf8_unicode_ci;

//crear usuario administrador de la base de datos agenda
//grant all on agenda.* to agenda@localhost identified by 'admin';
//flush privileges;
GRANT ALL PRIVILEGES ON agenda.* TO 'agenda'@'localhost'
IDENTIFIED BY 'agenda' WITH GRANT OPTION;


-- crear tabla persona



drop table if exists persona;
create table if not exists persona(
  id int auto_increment not null,
  nombre varchar(32) not null,
  correo varchar(100) not null,
  telefono varchar(9),
  primary key (id)
)  engine=innodb;

-- insertar datos en tabla persona
insert into persona
values('','Mario','mario@hotmail.com','958345654');
insert into persona
values('','Veronica','veronica@hotmail.com','953349152');
insert into persona
values('','Paco','paco@hotmail.com','622355659');


-- crear una tabla usuario con integridad referencial
private $id;


-- drop table if exists usuario;
-- create table if not exists usuario(
--   id int auto_increment not null,
--   nombre varchar(250) not null,
--   apellidos varchar(250) not null,
--   email varchar(250),
--   password varchar(250),
--   activo enum('si','no'),
--   primary key(id),
--   constraint foreign key(idPersona) references usuario(id) on update cascade on delete cascade
-- ) engine=innodb;

drop table if exists usuario;
create table if not exists usuario(
  id int auto_increment not null,
  nombre varchar(250) not null,
  apellidos varchar(250) not null,
  email varchar(250) not null,
  password varchar(250) not null,
  activo enum('si','no') not null,
  primary key(id)
) engine=innodb;

-- insertar datos en tabla usuario
insert into usuario
values('','Mario','Heredia De Jesus','mario@hotmail.com','laclave', 'si');
insert into usuario
values('','Lola','Carmona De Todos los Santos','lola@hotmail.com','laclavedelola', 'si');
insert into usuario
values('','Alberto','Heredia Carmona','alberto@hotmail.com','laclavedealberto', 'si');
insert into usuario
values('','Pepe','Peposo Pepurrin','pepe@hotmail.com','laclave', 'no');




-- insertar datos en tabla persona
insert into usuario
values('','1','1');
insert into usuario
values('','2','2');




drop table if exists contacto;
create table if not exists contacto(
  id int auto_increment,
  alias varchar(250),
  nombre varchar(250) not null,
  apellido1 varchar(250),
  apellido2 varchar(250),
  empresa varchar(250),
  cargo varchar(250),
  direccion varchar(250),
  poblacion varchar(250),
  cp varchar(10),
  provincia varchar(250),
  pais varchar(250),
  telefono varchar(15),
  fax varchar(15),
  movil varchar(15),
  tlfParticular varchar(15),
  email varchar(250),
  contactoDe varchar(250) not null,
  notas text,
  visible enum('si','no'),
  primary key(id)
) engine=innodb;

-- insertar datos en tabla contacto

insert into contacto
values('2','el mote de C','Carlos','Cccc1','Cccc2','CCC S.L.','jefe','c/noseque 12 1ºc','La Zubia','180230',
  'Granada','España','958321321','','609321321','','cccc@cccc.com','de Elias',
  'Aqui van las notas que puedan ser necesarias para este contacto Zubietico','si');
insert into contacto
values('3','el mote de M','Miguel','Mmmm1','Mmmm2','MMM S.L.','Gerente','c/noseque 9 1ºc','Motril','18600',
  'Granada','España','958603123','','609606060','','mmmm@mmmm.com','de Cristina',
  'Aqui van las notas que puedan ser necesarias para este contacto motrileño','si');
insert into contacto
values('4','el mote de Z','Zoe','Zzzz1','Zzzz2','ZZZ S.L.','responsable de compras','c/noseque 97 4ºa','Armilla',
  '18690','Granada','España','958567567','','609678678','','zzzz@zzzz.com','de Francisco',
  'Aqui van las notas que puedan ser necesarias para este contacto armillero','si');
insert into contacto
values('','el mote de F','Francisco','Ffff1','Ffff2','FFF S.L.','comercial','c/noseque 22 plta7','Guadix',
  '18900','Granada','España','958264567','958123748','609938678','622447736','zzzz@zzzz.com','de Francisco',
  'Aqui van las notas que puedan ser necesarias para este contacto armillero','si');



-- seleccionar los nombre que empiezan por ...M

SELECT nombre, apellido1, telefono, empresa
FROM contacto
WHERE nombre LIKE 'M%';

-- seleccionar los nombre que contengan mar

SELECT nombre, apellido1, telefono, empresa
FROM contacto
WHERE nombre LIKE '%mar%';

-- seleccionar cadena de la suma de nombre apellido1 y apellido2
SELECT concat_ws(' ', nombre, apellido1, apellido2) as nombreCompleto  FROM `contacto`;

select * from contacto where concat_ws(' ',nombre, apellido1, apellido2) like '%anne car%';



