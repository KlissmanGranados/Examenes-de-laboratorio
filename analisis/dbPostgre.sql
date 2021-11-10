CREATE TABLE  clientes (
   id SERIAL PRIMARY KEY,
   cedula VARCHAR(45) NOT NULL,
   nombre VARCHAR(45) NOT NULL,
   apellido VARCHAR(45) NOT NULL,
   correo VARCHAR(320) NOT NULL);

CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    pass VARCHAR(45) NOT NULL,
    access_token VARCHAR(45) NULL,
    roles_id INT NOT NULL);

alter table users
    add constraint fk_roles
        foreign key (roles_id)
            references roles (id);

CREATE TABLE examenes(
     id SERIAL PRIMARY KEY,
     nombre VARCHAR(45) NOT NULL,
     descripcion TEXT NULL,
     resultado TEXT NULL,
     estado boolean DEFAULT false,
     clientes_id INT NOT NULL);

alter table examenes
    add constraint fk_clientes
        foreign key (clientes_id)
            references examenes (id);


INSERT INTO roles(nombre) values ('administrador'),
                                 ('atención al cliente'),
                                 ('enfermero');

insert into users(name,pass,roles_id) values('admin','21232f297a57a5a743894a0e4a801fc3','1'),
                                            ('atencion','fa5bca988e5669075d2916cd24f796f2','2'),
                                            ('enfermero','6c0f887d9e9abdc28d034f50ea7fe058','3');

insert into clientes(cedula,nombre,apellido,correo) values('27056028','klissman','granados','granadosklissman@gmail.com');

insert into examenes(nombre,clientes_id) values('de sangre','1');