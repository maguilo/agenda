
/*DB1: Primera relación de base de datos.*/
--------------------------------------

/*BD001.- Arranca el servicio desde el prompt del sistema operativo. */

/*BD002.- Ejecuta el programa de cliente de MySQL para conectarte al servidor
de la base de datos MySQL como usuario pepe con la clave pepa.
Si no existe ese usuario, lo creas entrando como usuario sin clave root.*/ 

grant all privileges on *.* to pepe@localhost identified by 'pepa'; flush privileges;


/*BD003.- Saca una lista de las bases de datos en nuestro servidor.*/ 

show databases;

/*BD004.- Haz una consulta que muestre la versión de nuestro programa y
la fecha actual. */

select version(), current_date;

/*BD005.- Haz una consulta que calcule la raiz cuarta del cuadrado de 9 y
ponga como cabecera de la columna RESULTADO.*/

select pow(pow(9,2),1/4) resultado;

/*BD006.- Haz en la misma línea dos consultas: una que muestre el usuario
y la otra la hora actual. */

select user(); select time(now());

/*BD007.- Crea la base de datos Venta_Coches*/

drop table if exists Venta_Coches;
create database if not exists Venta_Coches; show databases;

/*BD008.- Selecciona la BD Venta_Coches para su uso.*/

use Venta_Coches;

/*BD009.- Crea la tabla Marcas con un campo CIFM numeric de 4 dígitos que no
permita null, otro Nombre varchar de 10 sin null, otro Ciudad varchar de 10,
y como clave primaria CIFM.*/ 

create table Marcas(
CIFM numeric(4) primary key not null,
Nombre varchar(10) not null,
Ciudad varchar(10)
);

/*BD010.- Muestra las tablas de nuestra BD */

show tables;

/*BD011.- Muestra la estructura de nuestra tabla Marcas*/

describe Marcas;

/*BD012.- Introduce los datos que se muestran en el enunciado en nuestra tabla
Marcas */

insert into Marcas 
values(0001,'SEAT','MADRID');
insert into Marcas 
values(0002,'RENAULT','BARCELONA');
insert into Marcas 
values(0003,'CITROEN','VALENCIA');
insert into Marcas 
values(0004, 'AUDI', 'MADRID');
insert into Marcas 
values(0005, 'OPEL', 'BILBAO');
insert into Marcas 
values(0006, 'BMW', 'BARCELONA'); 

/*BD013.- Muestra los datos introducidos en la tabla Marcas */

select * from Marcas;

/*BD014.- Muestra las Marcas de Barcelona*/

select * from Marcas where ciudad='barcelona';

/*BD015.- Muestra las Marcas de nombre SEAT, CITROEN y AUDI*/ 

select * from Marcas where nombre='seat' or 
nombre='citroen' or 
nombre='audi';

/*BD016.- Muestra las Marcas de BARCELONA de nombre RENAULT */

select * from Marcas where ciudad='barcelona' and nombre='renault';

/*BD017.- Muestra las Marcas con código superior a 003*/

select * from marcas where cifm>'003';

/*BD018.- Muestra las Marcas o con código superior a 003 o con código inferior
a 005*/

select * from marcas where cifm>003 xor cifm<005 order by cifm;
select * from marcas where (cifm>003 || cifm<005) and not(cifm>003 and cifm<005) order by cifm;

/*BD019.- Muestra las Marcas ordenadas por ciudad*/ 

select * from marcas order by ciudad;

/*BD020.- Muestra las Marcas ordenadas por nombre de forma descendente*/
 
select * from marcas order by nombre desc;

/*BD021.- Muestra sólo las ciudades de las Marcas junto con el número de
tuplas que tiene cada una */

select ciudad from marcas;

/*BD022.- Crea la tabla Coches del enunciado con los campos: CodCoche numérico
de 3 dígitos sin nulos, Nombre varchar de 10, Modelo varchar de 8 sin nulos y
como clave primaria CodCoche*/
 
create table Coches(
CodCoche numeric(3) not null primary key,
Nombre varchar(10),
Modelo varchar(8) not null
);

/*BD023.- Muestra las tablas de nuestra BD y la estructura de Coches */

show tables; describe coches;

/*BD024.- Introduce los datos del enunciado en Coches*/

insert into coches
values(001,'ibiza','glx');
insert into coches
values(002,'ibiza','gti');
insert into coches
values(003,'ibiza','gtd');
insert into coches
values(004,'toledo','gtd');
insert into coches
values(005,'cordoba','gti');
insert into coches
values(006,'megane','1.6');
insert into coches
values(007,'megane','gti');
insert into coches
values(008,'laguna','gtd');
insert into coches
values(009,'laguna','td');
insert into coches
values(010,'zx','16v');
insert into coches
values(011,'zx','td');
insert into coches
values(012,'xantia','gtd');
insert into coches
values(013,'a4','1.8');
insert into coches
values(014,'a4','2.8');
insert into coches
values(015,'astra','caravan');
insert into coches
values(016,'astra','gti');
insert into coches
values(017,'corsa','1.4');
insert into coches
values(018,'300','316.i');
insert into coches
values(019,'500','525i');
insert into coches
values(020,'700','750i');                 

select * from coches order by codcoche;
/*BD025.- Muestra el CodCoche de los modelos GTI*/

select codcoche from coches
where modelo='gti'; 

/*BD026.- Cuenta el número de coches de modelo GTD */

select count(*) from coches
where modelo='gtd';

/*BD027.- Muestra los coches ordenados por nombre y a igualdad de nombre por
CodCoche descendente*/ 

select * from coches order by nombre, codcoche desc;

/*BD028.- Crea la tabla MarCo con los campos: CIFM numérico de 4 dígitos sin
nulos y CodCoche numérico de 3 dígitos sin nulos con clave primaria la
combinación de ambos y con claves foreign CIFM de Marcas y CodCoche de Coches*/
use venta_coches;
create table Marco(
CIFM numeric(4)not null,
CodCoche numeric(3)not null,
primary key(CIFM, CodCoche),
foreign key(CIFM) references marcas(CIFM),
foreign key(CodCoche) references coches(CodCoche)
); 


describe marco;
drop table marco;
/*BD029.- Introduce los datos del enunciado en la tabla MarCo*/ 

Insert into Marco Values (0001, 001);
Insert into Marco Values (0001, 002);
Insert into Marco Values (0001, 003);
Insert into Marco Values (0001, 004);
Insert into Marco Values (0001, 005);
Insert into Marco Values (0002, 006);
Insert into Marco Values (0002, 007);
Insert into Marco Values (0002, 008);
Insert into Marco Values (0002, 009);
Insert into Marco Values (0003, 010);
Insert into Marco Values (0003, 011);
Insert into Marco Values (0003, 012);
Insert into Marco Values (0004, 013);
Insert into Marco Values (0004, 014);
Insert into Marco Values (0005, 015);
Insert into Marco Values (0005, 016);
Insert into Marco Values (0005, 017);
Insert into Marco Values (0006, 018);
Insert into Marco Values (0006, 019);
Insert into Marco Values (0006, 020);

/*BD030.- Cuenta cuántos coches tiene cada marca*/

select cifm, count(*) from marco group by cifm;

/*BD031.- Muestra para cada coche todos sus datos y el cifm de su marca*/

select coches.*, marco.cifm
from coches, marco
where marco.codcoche=coches.codcoche;

/*BD032.- Muestra para cada coche todos sus datos y los de su marca*/ 
select coches.*, marcas.*
from coches, marcas, marco
where coches.codcoche=marco.codcoche and marcas.cifm=marco.cifm;

/*BD033.- Muestra para todos los coches cuya marca esté en BARCELONA
todos sus datos y los de su marca*/

select coches.*, marcas.*
from coches, marcas, marco
where coches.codcoche=marco.codcoche 
and marcas.cifm=marco.cifm
and ciudad='barcelona';

/*BD034.- Muestra los datos de la marca que tiene más coches y cuántos tiene*/

use venta_coches;
   select cifm, count(*) as sumCoches from marco group by cifm;

   select subselect.cifm,max(subselect.sumCoches) from
   (select cifm, count(*) as sumCoches from marco m group by cifm) as subselect;
   


   create view subselect
   as select cifm, count(*) as sumCoches 
   from marco m group by cifm;

   select subselect.cifm,max(subselect.sumCoches) from subselect;


/*BD035.- Muestra los datos de la marca que tiene menos coches y cuales son*/

   select cifm, count(*) as sumCoches from marco group by cifm;

   select subselect.cifm,min(subselect.sumCoches) from
   (select cifm, count(*) as sumCoches from marco m group by cifm) as subselect;

/*BD036.- Crea la tabla Clientes del enunciado con los campos: DNI varchar de 9
sin nulos, Nombre varchar de 10, Apellido varchar de 15, Ciudad varchar de 10
y como clave primaria DNI*/

create table Clientes(
	DNI varchar (9) not null primary key,
	Nombre varchar (10),
	Apellido varchar (15),
	Ciudad varchar (10)
);

/*BD037.- Crea la tabla Concesionario del enunciado con los campos: CIFC
numérico de 4 dígitos sin nulos, Nombre varchar de 10 sin nulos, Ciudad varchar
de 10 sin nulos y como clave primaria CIFC*/

create table Concesionario(
	CIFC numeric (4) not null primary key,
	Nombre varchar (10) not null,
	Ciudad varchar (10) not null
);


/*BD038.- Crea la tabla Ventas del enunciado con los campos: CIFC numérico de
4 dígitos sin nulos, DNI varchar de 9 sin nulos, CodCoche numérico de 3 dígitos
sin nulos, Color varchar de 8 con clave primaria la combinación de CIFC, DNI y
CodCoche y con claves externas: CIFC en Concesionario, CodCoche en Coches y DNI
en Clientes*/

create table ventas(
	CIFC numeric (4) not null,
	DNI varchar(9) not null,
	CodCoche numeric (3) not null,
	Color varchar (8),
	constraint pk_Codigo_ventas primary key (CIFC, DNI, CodCoche),
	constraint foreign key (CodCoche) references Coches (CodCoche)
on update cascade on delete cascade,
	constraint foreign key (CIFC) references Concesionario(CIFC)
on update cascade on delete cascade,
	constraint foreign key (DNI) references Clientes (DNI)
on update cascade on delete cascade);

/*BD039.- Crea la tabla Distribucion del enunciado con los campos: CIFC
numérico de 4 dígitos sin nulos, CodCoche numérico de 3 dígitos sin nulos,
Cantidad numérico de 2 dígitos con clave primaria la combinación de CIFC y
CodCoche y con claves externas: CIFC en Concesionario y CodCoche en Coches*/

create table Distribucion(
	CIFC numeric (4) not null,
	CodCoche numeric (3) not null,
	Cantidad numeric (2),
	constraint primary key (CIFC, CodCoche),
	constraint foreign key (CodCoche) references Coches (CodCoche)
on delete cascade on update cascade,
	constraint foreign key (CIFC) references Concesionario (CIFC) on delete cascade on update cascade);

/*BD040.- Introduce los datos del enunciado en las nuevas tablas*/

Insert into Clientes Values (0001, 'LUIS', 'GARCIA', 'MADRID');
	Insert into Clientes Values (0002, 'ANTONIO', 'LOPEZ', 'VALENCIA');
	Insert into Clientes Values (0003, 'JUAN', 'MARTIN', 'MADRID');
	Insert into Clientes Values (0004, 'MARIA', 'GARCIA', 'MADRID');
	Insert into Clientes Values (0005, 'JAVIER', 'GONZALEZ', 'BARCELONA');
	Insert into Clientes Values (0006, 'ANA', 'LOPEZ', 'BARCELONA');

	Insert into Concesionario Values (0001, 'ACAR', 'MADRID');
	Insert into Concesionario Values (0002, 'BCAR', 'MADRID');
	Insert into Concesionario Values (0003, 'CCAR', 'BARCELONA');
	Insert into Concesionario Values (0004, 'DCAR', 'VALENCIA');
	Insert into Concesionario Values (0005, 'ECAR', 'BILBAO');

	insert into Ventas Values (0001, 0001, 001, 'BLANCO');
	insert into Ventas Values (0001, 0002, 005, 'ROJO');
	insert into Ventas Values (0002, 0003, 008, 'BLANCO');
	insert into Ventas Values (0002, 0001, 006, 'ROJO');
	insert into Ventas Values (0003, 0004, 011, 'ROJO');
	insert into Ventas Values (0004, 0005, 014, 'VERDE');

	Insert into Distribucion Values (0001, 001, 3);
	Insert into Distribucion Values (0001, 005, 7);
	Insert into Distribucion Values (0001, 006, 7);
	Insert into Distribucion Values (0002, 006, 5);
	Insert into Distribucion Values (0002, 008, 10);
	Insert into Distribucion Values (0002, 009, 10);
	Insert into Distribucion Values (0003, 010, 5);
	Insert into Distribucion Values (0003, 011, 3);
	Insert into Distribucion Values (0003, 012, 5);
	Insert into Distribucion Values (0004, 013, 10);
	Insert into Distribucion Values (0004, 014, 5);
	Insert into Distribucion Values (0005, 015, 10);
	Insert into Distribucion Values (0005, 016, 20);
	Insert into Distribucion Values (0005, 017, 8);
	Insert into Distribucion Values (0006, 019, 3);

/*BD041.- Obtener las tuplas de la relación DISTRIBUCION para las que el
atributo CANTIDAD toma un valor mayor que 15.



BD042.- Obtener las tuplas de la relación CLIENTES para las que el atributo
Apellido es "GARCIA" y el atributo Ciudad es "MADRID".

BD043.- Obtener las tuplas de la relación CLIENTES para las que el atributo
APELLIDO es "GARCIA" o el atributo CIUDAD es "MADRID"

BD044.- Obtener las tuplas de la relación CLIENTES para las que el atributo
CIUDAD toma un valor distinto de "MADRID"

BD045.- Obtener una relación en la que aparezcan los valores del atributo
APELLIDO de la relación CLIENTES.

BD046.- Obtener una relación en la que aparezcan los valores de los
atributos APELLIDO y CIUDAD de la relación CLIENTES.

BD047.- Obtener una relación en la que aparezcan los valores de los
atributos APELLIDOS y CIUDAD para los clientes de "MADRID"

BD048.- Obtener la reunión natural de las relaciones MARCAS y CLIENTES según
 el atributo común CIUDAD

BD049.- Obtener una relación, con un único atributo, en la que aparezca la
suma de todos los valores del atributo CANTIDAD de la relación DISTRIBUCION.

BD050.- Obtener los nombres de las marcas que tienen modelos "GTD"

BD051.- Obtener el nombre de las marcas de las que se han vendido coches
de color "ROJO"

BD052.-Obtener el nombre de los coches que tengan al menos los mismos
modelos que el coche de NOMBRE "CORDOBA"

BD053.- Obtener los nombres de los coches que no tengan modelo "GTD"

BD054.- Obtener todos los campos de la relación CONCESIONARIO

BD055.- Obtener todos los campos de todos los clientes de "MADRID"

BD056.- Obtener el cifc de todos los concesionarios cuyo atributo CANTIDAD
en la tabla de DISTRIBUCION es mayor que 18.

BD057.- Obtener el cifc de todos los concesionarios cuyo atributo CANTIDAD
en la tabla de DISTRIBUCION está comprendida entre 10 y 18 ambos inclusive.

BD058.- Obtener el cifc de todos los concesionarios cuyo atributo CANTIDAD
en la tabla de DISTRIBUCION es mayor que 10 o menor que 5.

BD059.- Obtener todas las parejas de atributos CIFM de marcas y DNI de
clientes que sean de la misma ciudad.

BD060.- Obtener todas las parejas de atributos CIFM de marcas y DNI de
clientes que NO sean de la misma ciudad.

BD061.- Obtener los codcoche que en este momento están en algún
concesionario de "BARCELONA".

BD062.- Obtener el atributo CODCOCHE de aquellos coches vendidos a clientes
de "MADRID".

BD063.- Obtener el atributo CODCOCHE de los coches que han sido adquiridos
por un cliente de "MADRID" a un concesionario de "MADRID".

BD064.- Obtener el atributo CODCOCHE de los coches comprados en un
concesionario de la misma CIUDAD que el cliente que los compra.

BD065.- Obtener el atributo CODCOCHE de los coches comprados en un
concesionario de distinta CIUDAD que el cliente que los compra.

BD066.- Obtener todas las parejas de atributos NOMBRE de marcas que sean
de la misma ciudad.

BD067.- Obtener las parejas de atributos MODELOS de coches cuyo NOMBRE es
el mismo y cuya marca es de "BILBAO".

BD068.- Obtener el número total de nombres de las marcas de "MADRID".

BD069.- Obtener todos los codcoche de los coches cuyo nombre empiece por
"C"

BD070.- Obtener todos los codcoche de los coches cuyo nombre no contiene
ninguna "A"

BD071.- Obtener la media de la cantidad de coches que tienen todos los
concesionarios.

BD072.- Obtener el dni con numeración más alta de todos los clientes de
"MADRID".

BD073.- Obtener el dni con numeración más baja de todos los clientes que
han comprado un coche de color "BLANCO".

BD074.- Obtener el dni de los clientes que han comprado algún coche a un
concesionario de "MADRID".

BD075.- Obtener el color de los coches vendidos por el concesionario "ACAR".

BD076.- Obtener el codcoche de los coches vendidos por algún concesionario de
"MADRID".

BD077.- Obtener el nombre y el modelo de los coches vendidos por algún
concesionario de "BARCELONA".

BD078.- Obtener el nombre de los clientes que hayan adquirido algún coche
del concesionario "DCAR".

BD079.- Obtener el nombre y el apellido de los clientes que han adquirido
un coche modelo "GTI" de color "BLANCO".

BD080.- Obtener el nombre y el apellido de los clientes que han adquirido
un automóvil de un concesionario que posea actualmente en stock coches del
modelo "GTI".

BD081.- Obtener el nombre y el apellido de los clientes que han adquirido
un automóvil de un concesionario de "MADRID" que posea actualmente en stock
coches del modelo "GTI".

BD082.- Obtener el nombre y el apellido de los clientes cuyo dni es menor
que el correspondiente al cliente "JUAN" "MARTIN".

BD083.- Obtener el nombre y el apellido de los clientes cuyo dni es menor
que el de todos los clientes que son de "BARCELONA".

BD084.- Obtener el nombre y el apellido de los clientes que han comprado
como mínimo un coche "BLANCO" y un coche "ROJO"

BD085.- Obtener el dni de los clientes cuya ciudad sea la última de la
lista alfabética de las ciudades donde hay concesionarios.

BD086.- Obtener la media de los automóviles que cada concesionario tiene
actualmente en stock.

BD087.- Obtener el atributo CIFC de los concesionarios que no sean de
"MADRID" cuya media de vehículos en stock sea la mayor de todas las medias.

BD088.- Utilizando EXISTS obtener el dni de los clientes que hayan adquirido
por lo menos alguno de los coches que han sido vendidos por el concesionario
cuyo cifc es 0001.

BD089.- Obtener el dni de los clientes que sólo han comprado coches al
concesionario 0001.

BD090.- Obtener los nombres de los clientes que no han comprado ningún
coche "ROJO" a ningún concesionario de "MADRID".

BD091.- Obtener el nombre de los clientes que sólo han comprado en el
concesionario de cifc 0001.

BD092.- Obtener el codcoche de aquellos automóviles que han sido comprados
por todos los clientes de Madrid. (Plantearlo como "obtener los codcoche de los
automoviles de manera que no exista un cliente que sea de Madrid que no esté en
 la tabla Ventas a su lado (al lado del codcoche))

BD093.- Obtener el codcoche de aquellos automóviles de color "ROJO" y de
modelo "GTI" que han sido comprados por todos los clientes cuyo apellido
comienza por "G". (Obtener los codcoche de los automóviles ROJOS y GTI de
manera que no exista un cliente cuyo apellido comienza por G que no esté en la
tabla VENTAS a su lado (al lado del codcoche)

BD094.- Obtener el dni de los clientes que han adquirido por lo menos los
mismos automóviles que el cliente "LUIS GARCIA". (Obtener el DNI de los clientes
de manera que en la tabla VENTAS no exista el CODCOCHE de un automovil adquirido
por LUIS GARCIA que no aparezca en una tupla de la tabla ventas con este DNI)

BD095.- Obtener el cifc de los concesionarios que han vendido el mismo coche
 a todos los clientes. (Obtener el CIFC del concesionario de manera que para
 algún CODCOCHE de la tabla ventas no exista ningún DNI de la tabla clientes
que no estén los tres en la misma tupla en la tabla ventas).

__________________-

/*DB1: Primera relación de base de datos.
--------------------------------------

BD001.- Arranca el servicio desde el prompt del sistema operativo.

	cmd.exe

/*BD002.- Ejecuta el programa de cliente de MySQL para conectarte al servidor
de la base de datos MySQL como usuario pepe con la clave pepa.
Si no existe ese usuario, lo creas entrando como usuario sin clave root.

	ir a la ruta--> servidores locales/mysql/bin

  mysql -u root -p*/

CREATE USER pepe IDENTIFIED BY pepa;

/*BD003.- Saca una lista de las bases de datos en nuestro servidor.*/

show databases;

/*BD004.- Haz una consulta que muestre la versión de nuestro programa y
la fecha actual.*/

SELECT CURDATE() AS fecha_actual, VERSION();

/*BD005.- Haz una consulta que calcule la raiz cuarta del cuadrado de 9 y
ponga como cabecera de la columna RESULTADO.*/

SELECT POW(POW(9,2),1/4) AS RESULTADO;

/*BD006.- Haz en la misma línea dos consultas: una que muestre el usuario
y la otra la hora actual.*/

	

/*BD007.- Crea la base de datos Venta_Coches*/

	CREATE DATABASE venta_coches;	

/*BD008.- Selecciona la BD Venta_Coches para su uso.*/ 

	USE venta_coches;

/*BD009.- Crea la tabla Marcas con un campo CIFM numeric de 4 dígitos que no
permita null, otro Nombre varchar de 10 sin null, otro Ciudad varchar de 10,
y como clave primaria CIFM.*/

CREATE TABLE Marcas (
CIFM INTEGER PRIMARY KEY NOT NULL,
Nombre VARCHAR (10) NOT NULL,
Ciudad VARCHAR(10) NOT NULL);

/*BD010.- Muestra las tablas de nuestra BD */

show tables;

/*BD011.- Muestra la estructura de nuestra tabla Marcas*/

	describe "nombretabla"
	
/*BD012.- Introduce los datos que se muestran en el enunciado en nuestra tabla
Marcas*/

INSERT INTO marcas VALUES (0001,'SEAT','MADRID');
INSERT INTO marcas VALUES (0002,'RENAULT','BARCELONA');
INSERT INTO marcas VALUES (0003,'CITROEN','VALENCIA');
INSERT INTO marcas VALUES (0004,'AUDI','MADRID');
INSERT INTO marcas VALUES (0005,'OPEL','BILBAO');
INSERT INTO marcas VALUES (0006,'BMW','BARCELONA');

/*BD013.- Muestra los datos introducidos en la tabla Marcas*/

SELECT * FROM Marcas;

/*BD014.- Muestra las Marcas de Barcelona*/

SELECT * FROM Marcas WHERE (Ciudad = "BARCELONA");

/*BD015.- Muestra las Marcas de nombre SEAT, CITROEN y AUDI*/

SELECT * FROM Marcas WHERE (Nombre = "SEAT") OR (Nombre ="CITROEN") OR (Nombre ="AUDI");

/*BD016.- Muestra las Marcas de BARCELONA de nombre RENAULT*/

SELECT *
FROM marcas
WHERE (Ciudad ="BARCELONA") AND (Nombre="RENAULT");

/*BD017.- Muestra las Marcas con código superior a 003*/

SELECT *
FROM marcas
WHERE (CIFM > 0003);

/*BD018.- Muestra las Marcas o con código superior a 003 o con código inferior
a 005*/

SELECT *
FROM marcas
WHERE CIFM>0003 XOR CIFM<0005;

/*BD019.- Muestra las Marcas ordenadas por ciudad*/

SELECT *
FROM marcas
ORDER BY Ciudad;

/*BD020.- Muestra las Marcas ordenadas por nombre de forma descendente*/

SELECT *
FROM marcas
ORDER BY Nombre DESC;

/*BD021.- Muestra sólo las ciudades de las Marcas junto con el número de
tuplas que tiene cada una*/

SELECT Ciudad, COUNT(*) AS Numero_registros
FROM marcas
GROUP BY ciudad;

/*BD022.- Crea la tabla Coches del enunciado con los campos: CodCoche numérico
de 3 dígitos sin nulos, Nombre varchar de 10, Modelo varchar de 8 sin nulos y
como clave primaria CodCoche*/

CREATE TABLE coches (
Codcoche INTEGER PRIMARY KEY NOT NULL,
Nombre VARCHAR (20) NOT NULL,
Modelo VARCHAR(20) NOT NULL);

/*BD023.- Muestra las tablas de nuestra BD y la estructura de Coches*/

SHOW TABLES;
DESCRIBE coches;

/*BD024.- Introduce los datos del enunciado en Coches*/

INSERT INTO coches VALUES(001,"IBIZA","GLX");
INSERT INTO coches VALUES(002,"IBIZA","GTI");
INSERT INTO coches VALUES(003,"IBIZA","GTD");
INSERT INTO coches VALUES(004,"TOLEDO","GTD");
INSERT INTO coches VALUES(005,"CORDOBA","GTI");
INSERT INTO coches VALUES(006,"MEGANE","1.6");
INSERT INTO coches VALUES(007,"MEGANE","GTI");
INSERT INTO coches VALUES(008,"LAGUNA","GTD");
INSERT INTO coches VALUES(009,"LAGUNA","TD");
INSERT INTO coches VALUES(010,"ZX","16v");
INSERT INTO coches VALUES(011,"ZX","TD");
INSERT INTO coches VALUES(012,"XANTIA","GTD");
INSERT INTO coches VALUES(013,"A$","1.8");
INSERT INTO coches VALUES(014,"A4","2.8");
INSERT INTO coches VALUES(015,"ASTRA","CARAVAN");
INSERT INTO coches VALUES(016,"ASTRA","GTI");
INSERT INTO coches VALUES(017,"CORSA","1.4");
INSERT INTO coches VALUES(018,"300","316.i");
INSERT INTO coches VALUES(019,"500","525.i");
INSERT INTO coches VALUES(020,"700","750i");

/*BD025.- Muestra el CodCoche de los modelos GTI*/

SELECT Codcoche
FROM coches
WHERE modelo = "GTI";

/*BD026.- Cuenta el número de coches de modelo GTD*/

SELECT COUNT(*) AS Num_GTD
FROM coches
WHERE modelo = "GTD";

/*BD027.- Muestra los coches ordenados por nombre y a igualdad de nombre por
CodCoche descendente*/

SELECT *
FROM coches
ORDER BY nombre, Codcoche DESC;

/*BD028.- Crea la tabla MarCo con los campos: CIFM numérico de 4 dígitos sin
nulos y CodCoche numérico de 3 dígitos sin nulos con clave primaria la
combinación de ambos y con claves foreign CIFM de Marcas y CodCoche de Coches*/

CREATE TABLE marco(
CIFM INTEGER NOT NULL,
Codcoche INTEGER NOT NULL,

CONSTRAINT PK PRIMARY KEY (CIFM, Codcoche),
CONSTRAINT FK1 FOREIGN KEY (CIFM) REFERENCES Marcas (CIFM),
CONSTRAINT FK2 FOREIGN KEY (Codcoche) REFERENCES Coches (Codcoche));

/*BD029.- Introduce los datos del enunciado en la tabla MarCo*/

INSERT INTO marco VALUES(0001,001);
INSERT INTO marco VALUES(0001,002);
INSERT INTO marco VALUES(0001,003);
INSERT INTO marco VALUES(0001,004);
INSERT INTO marco VALUES(0001,005);
INSERT INTO marco VALUES(0002,006);
INSERT INTO marco VALUES(0002,007);
INSERT INTO marco VALUES(0002,008);
INSERT INTO marco VALUES(0002,009);
INSERT INTO marco VALUES(0003,010);
INSERT INTO marco VALUES(0003,011);
INSERT INTO marco VALUES(0003,012);
INSERT INTO marco VALUES(0004,013);
INSERT INTO marco VALUES(0004,014);
INSERT INTO marco VALUES(0005,015);
INSERT INTO marco VALUES(0005,016);
INSERT INTO marco VALUES(0005,017);
INSERT INTO marco VALUES(0006,018);
INSERT INTO marco VALUES(0006,019);
INSERT INTO marco VALUES(0006,020);

/*BD030.- Cuenta cuántos coches tiene cada marca*/

SELECT CIFM, COUNT(*) AS Num_coches
FROM marco
GROUP BY CIFM;

/*BD031.- Muestra para cada coche todos sus datos y el cifm de su marca*/

SELECT coches.Codcoche, coches.nombre, coches.modelo, marco.CIFM
FROM coches, marco
WHERE coches.Codcoche = marco.Codcoche;

/*BD032.- Muestra para cada coche todos sus datos y los de su marca*/

SELECT coches.*, marcas.*
FROM coches, marcas, marco
WHERE coches.Codcoche = marco.Codcoche AND marcas.CIFM = marco.CIFM
GROUP BY coches.Codcoche;

/*BD033.- Muestra para todos los coches cuya marca esté en BARCELONA
todos sus datos y los de su marca*/

SELECT coches.*, marcas.*
FROM coches, marcas, marco
WHERE coches.Codcoche = marco.Codcoche AND marcas.CIFM = marco.CIFM AND Ciudad = "BARCELONA";

/*BD034.- Muestra los datos de la marca que tiene más coches y cuántos tiene*/

SELECT marcas.*
FROM marcas, marco
WHERE marcas.CIFM = marco.CIFM AND Num_coches = (
  SELECT MAX(Num_coches)
  FROM (SELECT COUNT(*) AS Num_coches
    FROM marco
    GROUP BY CIFM) AS TB_numCoches) ;

/*BD035.- Muestra los datos de la marca que tiene menos coches y cuales son*/
SELECT marcas.*
FROM(
  SELECT marcas.*, COUNT(*) AS num_coches
  FROM marcas, marco
  WHERE marcas.CIFM = marco.CIFM
  GROUP BY CIFM) AS tb_numcoches
WHERE num_coches =;

/*BD036.- Crea la tabla Clientes del enunciado con los campos: DNI varchar de 9
sin nulos, Nombre varchar de 10, Apellido varchar de 15, Ciudad varchar de 10
y como clave primaria DNI*/

CREATE TABLE clientes(
DNI VARCHAR(9) PRIMARY KEY NOT NULL,
Nombre VARCHAR(10),
Apellido VARCHAR(15),
Ciudad VARCHAR(10));

/*BD037.- Crea la tabla Concesionario del enunciado con los campos: CIFC
numérico de 4 dígitos sin nulos, Nombre varchar de 10 sin nulos, Ciudad varchar
de 10 sin nulos y como clave primaria CIFC*/

CREATE TABLE concesionario(
CIFC INTEGER(4) PRIMARY KEY NOT NULL,
Nombre VARCHAR(10) NOT NULL,
Ciudad VARCHAR(10) NOT NULL);

/*BD038.- Crea la tabla Ventas del enunciado con los campos: CIFC numérico de
4 dígitos sin nulos, DNI varchar de 9 sin nulos, CodCoche numérico de 3 dígitos
sin nulos, Color varchar de 8 con clave primaria la combinación de CIFC, DNI y
CodCoche y con claves externas: CIFC en Concesionario, CodCoche en Coches y DNI
en Clientes*/

CREATE TABLE ventas(
CIFC INTEGER(4) NOT NULL,
DNI VARCHAR(9) NOT NULL,
Codcoche INTEGER NOT NULL,
Color VARCHAR(8),

CONSTRAINT PK PRIMARY KEY (CIFC, DNI, Codcoche),
CONSTRAINT FK3 FOREIGN KEY (CIFC) REFERENCES concesionario (CIFC),
CONSTRAINT FK4 FOREIGN KEY (DNI) REFERENCES clientes (DNI),
CONSTRAINT FK5 FOREIGN KEY (Codcoche) REFERENCES coches (Codcoche));

/*BD039.- Crea la tabla Distribucion del enunciado con los campos: CIFC
numérico de 4 dígitos sin nulos, CodCoche numérico de 3 dígitos sin nulos,
Cantidad numérico de 2 dígitos con clave primaria la combinación de CIFC y
CodCoche y con claves externas: CIFC en Concesionario y CodCoche en Coches*/

CREATE TABLE distribucion(
CIFC INTEGER(4) NOT NULL,
Codcoche INTEGER NOT NULL,
Cantidad INTEGER(2),

CONSTRAINT PK PRIMARY KEY (CIFC, Codcoche),
CONSTRAINT FK6 FOREIGN KEY (CIFC) REFERENCES concesionario (CIFC),
CONSTRAINT FK7 FOREIGN KEY (Codcoche) REFERENCES coches (Codcoche));

/*BD040.- Introduce los datos del enunciado en las nuevas tablas*/

INSERT INTO clientes VALUES(0001, "LUIS", "GARCIA", "MADRID");
INSERT INTO clientes VALUES(0002, "ANTONIO", "LOPEZ", "VALENCIA");
INSERT INTO clientes VALUES(0003, "JUAN", "MARTIN","MADRID");
INSERT INTO clientes VALUES(0004,"MARIA","GARCIA","MADRID");
INSERT INTO clientes VALUES(0005,"JAVIER","GONZALEZ","BARCELONA");
INSERT INTO clientes VALUES(0006,"ANA","LOPEZ","BARCELONA");

INSERT INTO concesionario VALUES(0001,"ACAR","MADRID");
INSERT INTO concesionario VALUES(0002,"BCAR","MADRID");
INSERT INTO concesionario VALUES(0003,"CCAR","BARCELONA");
INSERT INTO concesionario VALUES(0004,"DCAR","VALENCIA");
INSERT INTO concesionario VALUES(0005,"ECAR","BILBAO");

INSERT INTO ventas VALUES(0001,0001,001,"BLANCO");
INSERT INTO ventas VALUES(0001,0002,005,"ROJO");
INSERT INTO ventas VALUES(0002,0003,008,"BLANCO");
INSERT INTO ventas VALUES(0002,0001,006,"ROJO");
INSERT INTO ventas VALUES(0003,0004,011,"ROJO");
INSERT INTO ventas VALUES(0004,0005,014,"VERDE");

INSERT INTO distribucion VALUES(0001,001,3);
INSERT INTO distribucion VALUES(0001,005,7);
INSERT INTO distribucion VALUES(0001,006,7);
INSERT INTO distribucion VALUES(0002,006,5);
INSERT INTO distribucion VALUES(0002,008,10);
INSERT INTO distribucion VALUES(0002,009,10);
INSERT INTO distribucion VALUES(0003,010,5);
INSERT INTO distribucion VALUES(0003,011,3);
INSERT INTO distribucion VALUES(0003,012,5);
INSERT INTO distribucion VALUES(0004,013,10);
INSERT INTO distribucion VALUES(0004,014,5);
INSERT INTO distribucion VALUES(0005,015,10);
INSERT INTO distribucion VALUES(0005,016,20);
INSERT INTO distribucion VALUES(0005,017,8);
INSERT INTO distribucion VALUES(0005,019,3);

SELECT * FROM distribucion;
/*BD041.- Obtener las tuplas de la relación DISTRIBUCION para las que el
atributo CANTIDAD toma un valor mayor que 15.*/

SELECT *
FROM distribucion
WHERE cantidad > 15;

/*BD042.- Obtener las tuplas de la relación CLIENTES para las que el atributo
Apellido es "GARCIA" y el atributo Ciudad es "MADRID".*/

SELECT *
FROM clientes
WHERE apellido LIKE "GARCIA" AND ciudad LIKE "MADRID";

/*BD043.- Obtener las tuplas de la relación CLIENTES para las que el atributo
APELLIDO es "GARCIA" o el atributo CIUDAD es "MADRID"*/

SELECT *
FROM CLIENTES
WHERE apellido = "GARCIA" OR ciudad LIKE "MADRID";

/*BD044.- Obtener las tuplas de la relación CLIENTES para las que el atributo
CIUDAD toma un valor distinto de "MADRID"*/

SELECT *
FROM clientes
WHERE ciudad NOT LIKE "MADRID";

/*BD045.- Obtener una relación en la que aparezcan los valores del atributo
APELLIDO de la relación CLIENTES.*/

SELECT apellido
FROM clientes;

/*BD046.- Obtener una relación en la que aparezcan los valores de los
atributos APELLIDO y CIUDAD de la relación CLIENTES.*/

SELECT apellido, ciudad
FROM clientes;

/*BD047.- Obtener una relación en la que aparezcan los valores de los
atributos APELLIDOS y CIUDAD para los clientes de "MADRID"*/

SELECT apellido, ciudad
FROM clientes
WHERE ciudad = "MADRID";

/*BD048.- Obtener la reunión natural de las relaciones MARCAS y CLIENTES según
 el atributo común CIUDAD*/

SELECT *
FROM marcas INNER JOIN clientes ON marcas.ciudad = clientes.ciudad;

/*BD049.- Obtener una relación, con un único atributo, en la que aparezca la
suma de todos los valores del atributo CANTIDAD de la relación DISTRIBUCION.*/

SELECT SUM(cantidad) AS suma_cantidad
FROM distribucion;

/*BD050.- Obtener los nombres de las marcas que tienen modelos "GTD"*/

SELECT * FROM marcas m;
select marcas.nombre from marcas, coches where marcas.cifm = coches.codcoche and modelo ="GTD";
select * from marcas;

/*BD051.- Obtener el nombre de las marcas de las que se han vendido coches
de color "ROJO"*/

/*SELECT marcas.nombre
FROM marcas, marco
WHERE marcas.CIFM = marco.CIFM AND codcoche = ANY (*/

SELECT MAX(num_coches) AS max_coches
FROM(
  SELECT marco.CIFM, COUNT(*) AS num_coches
  FROM ventas, marco
  WHERE ventas.codcoche = marco.codcoche AND color = "ROJO"
  GROUP BY CIFM) AS tbaux;

/*BD052.-Obtener el nombre de los coches que tengan al menos los mismos
modelos que el coche de NOMBRE "CORDOBA"*/

SELECT nombre
FROM coches
WHERE modelo = (
  SELECT modelo
  FROM coches
  WHERE nombre = "CORDOBA");

/*BD053.- Obtener los nombres de los coches que no tengan modelo "GTD"*/

SELECT nombre
FROM coches
WHERE modelo NOT LIKE "GTD";

/*BD054.- Obtener todos los campos de la relación CONCESIONARIO*/

SELECT *
FROM concesionario;

/*BD055.- Obtener todos los campos de todos los clientes de "MADRID"*/

SELECT *
FROM clientes
WHERE ciudad = "MADRID";

/*BD056.- Obtener el cifc de todos los concesionarios cuyo atributo CANTIDAD
en la tabla de DISTRIBUCION es mayor que 18.*/

SELECT CIFC
FROM distribucion
WHERE cantidad > 18;

/*BD057.- Obtener el cifc de todos los concesionarios cuyo atributo CANTIDAD
en la tabla de DISTRIBUCION está comprendida entre 10 y 18 ambos inclusive.*/

SELECT CIFC
FROM distribucion
WHERE cantidad BETWEEN 10 AND 18;

/*BD058.- Obtener el cifc de todos los concesionarios cuyo atributo CANTIDAD
en la tabla de DISTRIBUCION es mayor que 10 o menor que 5.*/

SELECT CIFC
FROM distribucion
WHERE cantidad > 10 OR cantidad < 5;

/*BD059.- Obtener todas las parejas de atributos CIFM de marcas y DNI de
clientes que sean de la misma ciudad.*/

SELECT CIFM, DNI
FROM marcas, clientes
WHERE marcas.ciudad = clientes.ciudad;

/*BD060.- Obtener todas las parejas de atributos CIFM de marcas y DNI de
clientes que NO sean de la misma ciudad.*/

SELECT CIFM, DNI
FROM marcas, clientes
WHERE marcas.ciudad = clientes.ciudad AND ciudad NOT LIKE (
  SELECT ciudad
  FROM;

/*BD061.- Obtener los codcoche que en este momento están en algún
concesionario de "BARCELONA".*/

SELECT codcoche
FROM ventas
WHERE CIFC = (
  SELECT CIFC
  FROM concesionario
  WHERE ciudad = "BARCELONA");
*/