/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     7/8/2023 6:16:40 PM                          */
/*==============================================================*/


drop table if exists driver_admin;

drop table if exists driver_request;

/*==============================================================*/
/* Table: driver_admin                                          */
/*==============================================================*/
create table driver_admin
(
   id_ad                int not null,
   name_ad              varchar(20) not null,
   lastname_ad          varchar(20) not null,
   email_ad             varchar(30) not null,
   phone_ad             varchar(10) not null,
   primary key (id_ad)
);

/*==============================================================*/
/* Table: driver_request                                        */
/*==============================================================*/
create table driver_request
(
   id_dr                int not null,
   id_ad                int not null,
   email_dr             varchar(30) not null,
   shipping_date_dr     date not null,
   approval_date_dr     date,
   type_lic_dr          varchar(1) not null,
   expiry_date_lic_dr   date not null,
   photo_lic_dr         longblob not null,
   plate_car_dr         varchar(6) not null,
   photo_car_dr         varchar(30) not null,
   state_dr             char(1) not null,
   message_dr           varchar(150),
   primary key (id_dr)
);

alter table driver_request add constraint fk_adim_driver foreign key (id_ad)
      references driver_admin (id_ad) on delete restrict on update restrict;
