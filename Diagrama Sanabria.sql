drop table logiclean.producto ;   /*Estos drop table iniciales solo se ejecutan una vez creadas las tablas para dropearlas y crearlas de nuevo de ser necesario*/
drop table logiclean.proveedor ;
drop table logiclean.pedido ;
drop table logiclean.cliente ;

-- Creacion de Tablas
-- Tabla Cliente
create table if not exists logiclean.cliente
(
idcliente int not null , /*el not null me indica que este campo no puede quedar sin completarse ya que es de importancia al ser la pk*/
nombre varchar (50) ,
paginaweb varchar (50) ,
mail varchar (50) ,
direccion varchar (50) ,
altura int ,
telefono varchar(15),
primary key (idcliente) -- Establezco la pk de la tabla
);

-- Tabla Pedido
create table if not exists logiclean.pedido
(
idpedido int not null ,
pedido varchar(100), -- uso un varchar de 100 ya que algunos pedidos pueden ser extensos
cantidad int,
idcliente int ,
primary key (idpedido),
foreign key (idcliente)  REFERENCES logiclean.cliente (idcliente) -- creo la fk para asociar los datos de esta tabla con la de cliente
);

create table if not exists logiclean.proveedor
(
idproveedor int not null ,
nombre varchar (10) ,
paginaweb varchar (50) ,
mail varchar (50) ,
telefono varchar(15), -- defino al telefono como un varchar ya que la extensidad puede variar
primary key (idproveedor) 
);

create table if not exists logiclean.producto -- uso "if not exist, en caso de que la tabla ya este creada me devuelva un warning y no un error"
(
 idpedido int ,
idproveedor int ,
idproducto int not null ,
producto varchar(40),
descripcion varchar(500),
clasificacion varchar(15),
precio int,
ubicacionpasillo varchar(1),
ubicacionposicion int,
primary key (idproducto),
foreign key (idpedido)  REFERENCES logiclean.pedido (idpedido) ,
foreign key (idproveedor)  REFERENCES logiclean.proveedor (idproveedor)
);

-- Creacion de selects para chequear la correcta creacion de las tablas o posteriormente la carga de datos

select * from logiclean.producto ;
select * from logiclean.proveedor ;
select * from logiclean.pedido ;
select * from logiclean.cliente ;

-- Carga de datos en las tablas

insert into  logiclean.cliente (idcliente ,nombre ,paginaweb ,mail ,direccion ,altura ,telefono ) values (1, 'wallmart', 'www.wallmart.com', 'wallmart@gmail.com', 'pampa', 516, 0111588895667) ;
insert into  logiclean.cliente (idcliente ,nombre ,paginaweb ,mail ,direccion ,altura ,telefono ) values (2, 'jumbo', 'www.jumbo.com', 'jumbo@gmail.com', 'junin', 423, 0111585858996) ;
insert into  logiclean.cliente (idcliente ,nombre ,paginaweb ,mail ,direccion ,altura ,telefono ) values (3, 'coto', 'www.coto.com', 'coto@gmail.com', 'rivadavia', 258, 0111588552136) ;
insert into  logiclean.cliente (idcliente ,nombre ,paginaweb ,mail ,direccion ,altura ,telefono ) values (4, 'carrefour', 'www.carrefour.com', 'carrefour@gmail.com', 'san martin', 456, 0111577445589) ;

insert into  logiclean.pedido (idpedido ,pedido ,cantidad ,idcliente ) values (1, 'desodorante', 200, 1) ;
insert into  logiclean.pedido (idpedido ,pedido ,cantidad ,idcliente ) values (2, 'insecticida', 300, 2) ;
insert into  logiclean.pedido (idpedido ,pedido ,cantidad ,idcliente ) values (3, 'desodorante para piso', 150, 3) ;
insert into  logiclean.pedido (idpedido ,pedido ,cantidad ,idcliente ) values (4, 'carton', 1000, 4) ;

insert into  logiclean.proveedor (idproveedor ,nombre ,paginaweb ,mail ,telefono ) values (1, 'SC Jhonson', 'wwww.scjhonson.com', 'scjhonson@gmail.com', 0111566688912) ;
insert into  logiclean.proveedor (idproveedor ,nombre ,paginaweb ,mail ,telefono ) values (2, 'Unilever', 'wwww.unilever.com', 'unilever@gmail.com', 0111546132255) ;
insert into  logiclean.proveedor (idproveedor ,nombre ,paginaweb ,mail ,telefono ) values (3, 'Cartocoor', 'www.cartocoor.com', 'cartocoor@gmail.com', 011158787592622) ;

insert into  logiclean.producto (idpedido ,idproveedor ,idproducto ,producto ,descripcion ,clasificacion ,precio ,ubicacionpasillo ,ubicacionposicion ) values (1, 1, 1, 'desodorante', 'es un producto elaborado por un fabricante de primera linea internacional, apto para aromatizar cualquier ambiente' ,'inflamables' , 40 ,'A' ,1) ;
insert into  logiclean.producto (idpedido ,idproveedor ,idproducto ,producto ,descripcion ,clasificacion ,precio ,ubicacionpasillo ,ubicacionposicion ) values (2, 2, 2, 'insecticida', 'es un producto elaborado por un fabricante de primera linea internacional, para combatir todo tipo de insectos' ,'inflamables' , 70 ,'B' ,1) ;
insert into  logiclean.producto (idpedido ,idproveedor ,idproducto ,producto ,descripcion ,clasificacion ,precio ,ubicacionpasillo ,ubicacionposicion ) values (3, 2, 3, 'desodorante para piso', 'es un producto elaborado por un fabricante de primera linea internacional, compatible con cualquier tipo de suelo, ya sea de interior como de exterior' ,'inflamables' , 80 ,'C' ,1) ;
insert into  logiclean.producto (idpedido ,idproveedor ,idproducto ,producto ,descripcion ,clasificacion ,precio ,ubicacionpasillo ,ubicacionposicion ) values (4, 3, 4, 'carton', 'es un producto elaborado por un fabricante local, altamente competitivo en el mercado, que nos ofrece la mejor calidad para armado de cajas para nuestros productos' ,'inflamables' , 20 ,'D' ,1) ;



