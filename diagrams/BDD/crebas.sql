create database trip_service;

use trip_service;

/*==============================================================*/
/* dbms name:      mysql 5.0                                    */
/* created on:     7/26/2023 10:14:51 pm                        */
/*==============================================================*/

drop table if exists driver;
drop table if exists location;
drop table if exists passenger;
drop table if exists request;
drop table if exists trip;

/*==============================================================*/
/* table: driver                                                */
/*==============================================================*/
create table driver
(
   id_dri               int not null,
   plate_car_dri        varchar(6),
   model_car_dri        varchar(20),
   photo_car_dri        varchar(30),
   num_seats_dri        int,
   free_seats_dri       int,
   cod_user_dri         int,
   primary key (id_dri)
);

/*==============================================================*/
/* table: location                                              */
/*==============================================================*/
create table location
(
   id_loc               bigint not null,
   id_pas               int not null,
   id_dri               int not null,
   id_trip              bigint not null,
   lat_loc              decimal(9,6),
   long_loc             decimal(9,6),
   name_loc             varchar(30),
   primary key (id_loc)
);

/*==============================================================*/
/* table: passenger                                             */
/*==============================================================*/
create table passenger
(
   id_pas               int not null,
   id_trip              bigint not null,
   cod_user_pas         int,
   primary key (id_pas)
);

/*==============================================================*/
/* table: request                                               */
/*==============================================================*/
create table request
(
   id_req               bigint not null,
   id_dri               int not null,
   id_pas               int not null,
   price_trip_req       decimal(10,2),
   phone_req            varchar(10),
   state_req            varchar(1),
   primary key (id_req)
);

/*==============================================================*/
/* table: trip                                                  */
/*==============================================================*/
create table trip
(
   id_trip              bigint not null,
   id_dri               int not null,
   leave_hour_trip      time,
   date_trip            date,
   arrival_hour_trip    time,
   available_trip       bool,
   price_all_trip       decimal(10,2),
   primary key (id_trip)
);

alter table location add constraint fk_driver_location foreign key (id_dri)
      references driver (id_dri) on delete restrict on update restrict;

alter table location add constraint fk_passenger_location foreign key (id_pas)
      references passenger (id_pas) on delete restrict on update restrict;

alter table location add constraint fk_trip_location foreign key (id_trip)
      references trip (id_trip) on delete restrict on update restrict;

alter table passenger add constraint fk_trip_passenger foreign key (id_trip)
      references trip (id_trip) on delete restrict on update restrict;

alter table request add constraint fk_driver_request foreign key (id_dri)
      references driver (id_dri) on delete restrict on update restrict;

alter table request add constraint fk_passenger_request foreign key (id_pas)
      references passenger (id_pas) on delete restrict on update restrict;

alter table trip add constraint fk_driver_trip foreign key (id_dri)
      references driver (id_dri) on delete restrict on update restrict;
