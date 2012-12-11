-- crear base de datos agenda
create database if not exists agenda;

alter database agenda default character set utf8 collate utf8_unicode_ci;

-- crear usuario administrador de la base de datos agenda
grant all on agenda.* to agenda@localhost identified by 'agenda';
flush privileges;
GRANT ALL PRIVILEGES ON agenda.* TO 'agenda'@'localhost'
IDENTIFIED BY 'agenda' WITH GRANT OPTION;



-- crear tabla usuario

drop table if exists usuario;
create table if not exists usuario(
  id int auto_increment not null,
  nombre varchar(250) not null,
  apellidos varchar(250) not null,
  email varchar(250) not null,
  password varchar(250) not null,
  activo enum('si','no') not null DEFAULT 'si',
  tipo enum('administrador','usuario') DEFAULT 'usuario',
  primary key(id)
) engine=innodb;

-- insertar datos en tabla usuario
-- insert into usuario
-- values('','Mario','Heredia De Jesus','mario@hotmail.com','laclave', 'si', 'administrador');
-- insert into usuario
-- values('','Lola','Carmona De Todos los Santos','lola@hotmail.com','laclavedelola', 'si', 'usuario');
-- insert into usuario
-- values('','Alberto','Heredia Carmona','alberto@hotmail.com','laclavedealberto', 'si', 'usuario');
-- insert into usuario
-- values('','Pepe','Peposo Pepurrin','pepe@hotmail.com','laclave', 'no', 'usuario');

INSERT INTO `usuario` (`id`, `nombre`, `apellidos`, `email`, `password`, `activo`, `tipo`) VALUES
(1, 'Mario', 'Heredia De Jesus', 'mario@hotmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'si', 'administrador'),
(2, 'Lola', 'Carmona De Todos los Santos', 'lola@hotmail.com', 'c81e728d9d4c2f636f067f89cc14862c', 'si', 'usuario'),
(3, 'Alberto', 'Heredia Carmona', 'alberto@hotmail.com', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', 'si', 'usuario'),
(4, 'Pepe', 'Peposo Pepurrin', 'pepe@hotmail.com', 'a87ff679a2f3e71d9181a67b7542122c', 'no', 'usuario');


-- crear tabla contacto
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
  visible enum('si','no') not null DEFAULT 'si',
  primary key(id)
) engine=innodb;

-- insertar datos en tabla contacto

insert into contacto
-- values('2','el mote de C','Carlos','Cccc1','Cccc2','CCC S.L.','jefe','c/noseque 12 1ºc','La Zubia','180230',
--   'Granada','España','958321321','','609321321','','cccc@cccc.com','de Elias',
--   'Aqui van las notas que puedan ser necesarias para este contacto Zubietico','si');
-- insert into contacto
-- values('3','el mote de M','Miguel','Mmmm1','Mmmm2','MMM S.L.','Gerente','c/noseque 9 1ºc','Motril','18600',
--   'Granada','España','958603123','','609606060','','mmmm@mmmm.com','de Cristina',
--   'Aqui van las notas que puedan ser necesarias para este contacto motrileño','si');
-- insert into contacto
-- values('4','el mote de Z','Zoe','Zzzz1','Zzzz2','ZZZ S.L.','responsable de compras','c/noseque 97 4ºa','Armilla',
--   '18690','Granada','España','958567567','','609678678','','zzzz@zzzz.com','de Francisco',
--   'Aqui van las notas que puedan ser necesarias para este contacto armillero','si');
-- insert into contacto
-- values('','el mote de F','Francisco','Ffff1','Ffff2','FFF S.L.','comercial','c/noseque 22 plta7','Guadix',
--   '18900','Granada','España','958264567','958123748','609938678','622447736','zzzz@zzzz.com','de Francisco',
--   'Aqui van las notas que puedan ser necesarias para este contacto armillero','si');

INSERT INTO `contacto` (`id`, `alias`, `nombre`, `apellido1`, `apellido2`, `empresa`, `cargo`, `direccion`, `poblacion`, `cp`, `provincia`, `pais`, `telefono`, `fax`, `movil`, `tlfParticular`, `email`, `contactoDe`, `notas`, `visible`) VALUES
(1, 'el mote de A', 'Alvaro', 'Aaaa1', 'Aaaa2', 'AAA S.L.', 'empleado', 'c/noseque 12 1ºc', 'Alhendín', '18000', 'Granada', 'España', '958123123', '', '609123123', '', 'aaaa@aaaa.com', 'contacto propio', 'Aqui van las notas que puedan ser necesarias para este contacto', 'si'),
(2, 'el mote de C', 'Carlos', 'Cccc1', 'Cccc2', 'CCC S.L.', 'jefe', 'c/noseque 12 1ºc', 'La Zubia', '180230', 'Granada', 'España', '958321321', '', '609321321', '', 'cccc@cccc.com', 'de Elias', 'Aqui van las notas que puedan ser necesarias para este contacto Zubietico', 'si'),
(3, 'el mote de M', 'Miguel', 'Mmmm1', 'Mmmm2', 'MMM S.L.', 'Gerente', 'c/noseque 9 1ºc', 'Motril', '18600', 'Granada', 'España', '958603123', '', '609606060', '', 'mmmm@mmmm.com', 'de Cristina', 'Aqui van las notas que puedan ser necesarias para este contacto motrileño', 'si'),
(4, 'el mote de Z', 'Zoe', 'Zzzz1', 'Zzzz2', 'ZZZ S.L.', 'responsable de compras', 'c/noseque 97 4ºa', 'Armilla', '18690', 'Granada', 'España', '958567567', '', '609678678', '', 'zzzz@zzzz.com', 'de Francisco', 'Aqui van las notas que puedan ser necesarias para este contacto armillero', 'si'),
(5, 'el mote de F', 'Francisco', 'Ffff1', 'Ffff2', 'FFF S.L.', 'comercial', 'c/noseque 22 plta7', 'Guadix', '18900', 'Granada', 'España', '958264567', '958123748', '609938678', '622447736', 'zzzz@zzzz.com', 'de Francisco', 'Aqui van las notas que puedan ser necesarias para este contacto armillero', 'si'),
(6, '', 'Aasdfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'asdfasdf', '      ', 'si'),
(7, 'Asdflkj', 'Qwerty', 'Noseque', 'Tampoco', 'Nose SL', 'ni idea', 'ñlkjñlkj', 'Lñkjñlkj', '', 'Lñkjñlkj', 'ñlkjñlkj', '345678987654', '56787654', '456787654', '4567654345', 'Ã±lasdjkfÃ±alksdjf@asdf.com', 'Mario', 'Las notas de este contacto son inventadas            ', 'si'),
(8, 'Poiu', 'Poiuuu', 'Poiupoiu', 'Poiupoiu', 'Poiupoiu', 'poiupoiupoi', 'oiu', 'Poiupoiupoi', '18000', 'ñlkjñlkj', 'Poiu', '0987', '09879087098', '09870987', '09870987098', 'afsdlkjasdñlkj@asdfljkalfj.com', 'propio', '     ', 'si'),
(9, 'Uno', 'Unnombre', 'Primerapellido', 'Segundoapellido', 'Cualquiera SL', 'instructor', 'c/noseque 13 1ºc', 'Gualchos', '16647', 'Granada', 'España', '9876', '986', '986', '9876', 'uno@asdf.com', 'Elias', 'No hay notas que mostrar', 'no'),
(10, 'A', 'Alfonsillo', 'Carmona', 'Carmona', 'dfgh', 'dfghdfghdf', 'jhgfkjfgfgh', 'dfjnhfujfdhgj', 'ddjfghjfgu', 'fghkjfghjncghv', 'gmfghmvbnm', '4768567856', '567856785679', '569869876', '67567856875', 'sdfhsgfd@sdfgdrgh.com', 'mio', '             no se que notas poner aqui para este  contacto      ', 'si'),
(11, 'el tuerto', 'Paco', 'nose', 'nose', 'noseque SL', 'empleado', 'avda. la buenavista 47 blq 5 3ºc', 'Madrid', '28000', 'madrid', 'españa', '98769876', '987698769', '4563563456', '9876987698', 'masdfasdf@hotmail.com', 'propio', 'no hay notas que mostrar      ', 'si'),
(12, '', 'Zidanne', 'carmona', 'heredia', 'R Madrid', 'asdffffffff', 'adsfasdfasdf', '', '', '', '', 'nainonaino', '', '', '', 'jitanillo@radiocasete.es', 'Carlos', '                                              lolailollllll                             ', 'si'),
(13, 'asdf', 'asdf', 'asdf', 'asdf', 'adsf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf@asdfes', 'asdf', 'asdfañlsdfjk      ', 'no'),
(14, 'asdfas', 'asdfasdf', 'asdfasdf', 'asdfasdf', '', '', '', '', '', '', '', '', '', '', '', '', 'asdfasdf', '      ', 'no'),
(15, '', 'Bea', 'Primero', 'Segundo', 'Bea S.L.', 'comercial', 'c/ adsflakj nº12', 'Vizcaya', '456789', '', 'Nigeria', '765476547645', '76547654764', '5678999999', '1234567890', 'asdfasdf@lñkjadsfñljk.com', 'Iñaki', '             no hay notas            ', 'si'),
(16, 'pelos', 'Higinio', 'nose', 'nose', 'HM', 'Gerente', 'ñlaksjdfñlakj', 'añlskdfjañlskdfj', 'ñalksdfjañ', 'añlsdkfjañslkdfj', 'añsdlkfjañlsdkj', '3456789', '456786', '67890', '456789098765', 'ñlkajsd@ñasldkfj.com', 'manolo', 'no se que      ', 'no'),
(17, 'inventao', 'Dimitri', 'Primerapellido', 'Segundoapellido', 'extranjera S.L.', 'Director', 'avda la corta s/n 4ºF', 'Valdemoro', '28130', 'Madrid', 'Vietnam', '124567890', '1234567890', '1234567890', '1234567890', 'Dimitri@hotmail.com', 'Elias', 'Aqui iran las notas relativas al contacto, cuyo campo no este incluido en la ficha personal. Tales como otros telefonos, horarios, y cualquier informacion de cualquier proceencia o indole contrastada que se estime que tiene interes para ser incluida en su ficha.            ', 'si'),
(18, 'el mote de G', 'Gracia', 'Ffff1', 'Ffff2', 'FFF S.L.', 'comercial', 'c/noseque 22 plta7', 'Guadix', '18900', 'Granada', 'España', '958264567', '958123748', '609938678', '622447736', 'zzzz@zzzz.com', 'de Francisco', 'Aqui van las notas que puedan ser necesarias para este contacto armillero', 'si'),
(19, '', 'ñlkjjjjjjj', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ñlkjñlkjñlkj', '      ', 'no'),
(20, '', 'asdfasdf', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'asdfasdf', '      ', 'no'),
(21, 'no tiene', 'qwre', 'no tiene tampoco', '', 'no tiene', '', '', '', '', '', '', 'no tiene', '', '', '', '', 'trew', '                          añslfkj asda sdfa sdfasdlfkjasdñ falsdf asdfñlkasjdf ñalsdkf ñlksdf asdñlkfj asdñlkfjas dñflkja sdñflkasjd fñalskdfj añslkdf jasñldkf jasñdlkfj asñdlkfj asasdfasdfasdfasdfasdfasdasdfasdfff      añslfkj asda sdfa sdfasdlfkjasdñ falsdf asdfñlkasjdf ñalsdkf ñlksdf asdñlkfj asdñlkfjas dñflkja sdñflkasjd fñalskdfj añslkdf jasñldkf jasñdlkfj asñdlkfj asasdfasdfasdfasdfasdfasdasdfasdfff              ', 'no'),
(22, 'Tirso', 'Tirso maria de todos los Santos', 'wertwer', 'wertwert', 'wertwert', 'wertwert', 'wert', 'wert', 'wert', 'wert', 'wert', 'wert', 'wert', 'wert', 'wert', 'wert', 'wert', '       no hay na de na, coño     ', 'si'),
(23, 'Susa', 'Susana Maria', 'Wertwer', 'Wertwert', 'Wertwert', 'wertwert', 'wert', 'Wert', 'wert', 'Wert', 'Wert', 'wert', 'wert', 'wert', 'wert', 'wert', 'wert', 'no hay na de na, coño      ', 'si'),
(24, 'unoNuevo', 'OtroNuevo', 'Uno', 'Otro', 'UnaNueva', 'Comercial', '', '', '', '', '', '987876654', '987765543', '678678678', '987876432', '', 'asdfasdfadsf', '                   ñlkajsdfñlaksdfjadfadsfa', 'si'),
(25, 'Isi', 'Isidra', 'Carbonera', 'Chicana', 'Lola CB', 'comercial', 'c/ lala nº4', 'Almeria', '19622', 'Almeria', 'Eslovenia', '987987987', '987678678', '678876876', '987456456', 'info@lola.org', 'Paco', '                       este personaje no tiene notas, por ahora, pero las tendrá, aunque no se cuando...                       ', 'si'),
(26, 'UltimoW', 'Walter', 'Grijander', 'Alcuadrado', 'Producciones Walter SL', 'Director', 'c/ nosewue nº25 4ºF', 'Lima', '10222', 'Caceres', 'Marruecos', '987', '98777899987', '654654654', '789998778', 'info@walter.mar', 'Loli', 'Este es el ultimo contacto añadido para comprobar si sale el primero en los ultimos 10 añadidos.                             ', 'si'),
(27, '', 'AvisibleFalse', 'Elprimero', '', 'NoTiene', '', '', '', '', '', '', '987987987', '', '', '', '', 'Mario', '                   ', 'no'),
(28, 'otroUltimo', 'otroUltimo', 'Primero', 'Segundo', 'Ultima', 'Ninguno', '', '', '', '', '', '958123123', '958456987', '654456456', '666987987', '', 'Carmen de Mairena', '                    ', 'no'),
(29, '', 'UltimoMas', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Otro', '     ', 'no'),
(30, 'Hola', 'Hola', 'Hi', '', 'Bienvenido', '', '', '', '', '', '', '912345654', '', '', '', '', 'Ana', '                                                        ', 'no'),
(31, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'no'),
(32, 'Fran', 'Francisco', 'Primero', 'Segundo', 'Paquito CB', 'empleado', 'c/ñalsdkjfañlskdfj', 'Motril', '18620', 'Granada', 'Guatemala', '958123987', '958234432', '654456654', '958234432', 'info@info.es', 'Mario', 'No hay notas                             ', 'si'),
(33, 'aaaa', 'aaaa', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Mario', '     ', 'no'),
(34, '', 'mmmmmm', '', '', 'mmmmm', 'mmmmm', '', '', '', '', '', '', '', '', '', 'mmmmmm', 'Mario', '           ', 'no'),
(35, 'fffffff', 'ffffff', 'fffffff', 'fffffff', 'ffffff cB', '', '', '', '', '', '', '5555555', '', '', '', 'fffff555555', 'Mario', '     ', 'no'),
(36, '', 'zoe', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Mario', '                  ', 'no'),
(37, '', 'Nicasio', 'Uno', 'Dos', 'Una CB', 'Director', '', '', '', '', '', '555', '', '', '', '', 'Mario', '           ', 'si'),
(38, '', 'Nicasio', 'Primero', 'Segundo', '---------', '', '', '', '', '', '', '958---------', '', '', '', 'nicasio@nnnn.es', 'Mario', '                  ', 'si'),
(39, 'Mmmmmm', 'Mlmlml', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Mario', '           ', 'no'),
(40, 'Minusculo', 'Minusculo', 'Primero', 'Segundo', 'Minusculo CD', 'programador', 'avda. asdf', 'Motril', '18600', 'Granada', 'Marruecos', '958555123', '958123555', '666555555', '', 'minusculo@asdf.es', 'Mario', 'no hay notas que mostrar           ', 'si');



-- seleccionar los nombre que empiezan por ...M

SELECT nombre, apellido1, telefono, empresa
FROM contacto
WHERE nombre LIKE 'M%';

-- seleccionar los nombre que contengan mar

SELECT nombre, apellido1, telefono, empresa
FROM contacto
WHERE nombre LIKE '%mar%';

-- seleccionar cadena de la suma de nombre apellido1 y apellido2
-- SELECT concat_ws(' ', nombre, apellido1, apellido2) as nombreCompleto  FROM `contacto`;

select * from contacto where concat_ws(' ',nombre, apellido1, apellido2) like '%anne car%';



