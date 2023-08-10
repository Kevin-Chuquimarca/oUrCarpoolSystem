create database driver_approval_db;

use driver_approval_db;

/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     7/8/2023 6:16:40 PM                          */
/*==============================================================*/

drop table if exists driver_request;

drop table if exists driver_admin;

/*==============================================================*/
/* Table: driver_admin                                          */
/*==============================================================*/
create table driver_admin
(
    id_ad                int not null auto_increment,
    name_ad              varchar(20) not null,
    last_name_ad          varchar(20) not null,
    email_ad             varchar(30) not null,
    phone_ad             varchar(10) not null,
    primary key (id_ad)
);

/*==============================================================*/
/* Table: driver_request                                        */
/*==============================================================*/
create table driver_request
(
    id_dr                int not null auto_increment,
    id_ad                int not null,
    email_dr             varchar(30) not null,
    shipping_date_dr     date not null,
    approval_date_dr     date,
    type_lic_dr          varchar(1) not null,
    expiry_date_lic_dr   date not null,
    photo_lic_dr         varchar(30) not null,
    plate_car_dr         varchar(7) not null,
    photo_car_dr         varchar(30) not null,
    state_dr             char(1) not null,
    message_dr           varchar(150),
    cod_user_dr          int not null,
    primary key (id_dr)
);

alter table driver_request add constraint fk_admin_driver foreign key (id_ad)
    references driver_admin (id_ad) on delete restrict on update restrict;

insert into driver_admin (name_ad, last_name_ad, email_ad, phone_ad) value ('Kevin', 'Chuquimarca', 'kschuquimarca@espe.edu.ec', '0984991746');

insert into driver_request (id_ad, email_dr, shipping_date_dr, approval_date_dr, type_lic_dr, expiry_date_lic_dr, photo_lic_dr, plate_car_dr, photo_car_dr, state_dr, message_dr, cod_user_dr)
    value (1, 'kschuquimarca2@espe.edu.ec', '2023-07-12', NULL, 'B', '2025-07-08', 'ABC123.jpg', 'ABC123', 'ABC123.jpg', 'P', 'no message', 2);

insert into driver_request (id_ad, email_dr, shipping_date_dr, approval_date_dr, type_lic_dr, expiry_date_lic_dr, photo_lic_dr, plate_car_dr, photo_car_dr, state_dr, message_dr, cod_user_dr)
    value (1, 'kschuquimarca2@espe.edu.ec', '2023-07-12', NULL, 'B', '2025-07-08', 'ABC124.jpg', 'ABC123', 'ABC124.jpg', 'P', 'no message', 2);

