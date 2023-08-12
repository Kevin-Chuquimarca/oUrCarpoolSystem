create database trip_service_db;

use trip_service_db;

/*==============================================================*/
/* dbms name:      mysql 5.0                                    */
/* created on:     8/7/2023 11:17:08 pm                         */
/*==============================================================*/

drop table if exists request;

drop table if exists passenger;

drop table if exists trip;

drop table if exists driver;

drop table if exists location;

/*==============================================================*/
/* table: location                                              */
/*==============================================================*/
create table location
(
    id_loc               bigint not null auto_increment,
    lat_loc              decimal(9,6),
    long_loc             decimal(9,6),
    name_loc             varchar(30),
    primary key (id_loc)
);

/*==============================================================*/
/* table: driver                                                */
/*==============================================================*/
create table driver
(
    id_dri               int not null,
    id_loc               bigint,
    plate_car_dri        varchar(6),
    photo_car_dri        varchar(30),
    cod_user_dri         int,
    primary key (id_dri)
);

/*==============================================================*/
/* table: passenger                                             */
/*==============================================================*/
create table passenger
(
    id_pas               int not null auto_increment,
    id_trip              bigint,
    id_loc               bigint,
    cod_user_pas         int,
    primary key (id_pas)
);

/*==============================================================*/
/* table: request                                               */
/*==============================================================*/
create table request
(
    id_req               bigint not null auto_increment,
    id_dri               int not null,
    id_pas               int not null,
    name_u_req           varchar(20),
    last_name_u_req      varchar(20),
    phone_u_req          varchar(10),
    date_req             date,
    state_req            varchar(1),
    primary key (id_req)
);

/*==============================================================*/
/* table: trip                                                  */
/*==============================================================*/
create table trip
(
    id_trip              bigint not null auto_increment,
    id_dri               int not null,
    id_loc               bigint,
    leave_hour_trip      time,
    date_trip            date,
    available_trip       bool,
    free_seats_trip      int,
    type_trip_trip       varchar(1),
    primary key (id_trip)
);

alter table driver add constraint fk_driver_location foreign key (id_loc)
    references location (id_loc) on delete restrict on update restrict;

alter table passenger add constraint fk_passenger_location foreign key (id_loc)
    references location (id_loc) on delete restrict on update restrict;

alter table passenger add constraint fk_trip_passenger foreign key (id_trip)
    references trip (id_trip) on delete restrict on update restrict;

alter table request add constraint fk_driver_request foreign key (id_dri)
    references driver (id_dri) on delete restrict on update restrict;

alter table request add constraint fk_passenger_request foreign key (id_pas)
    references passenger (id_pas) on delete restrict on update restrict;

alter table trip add constraint fk_trip_driver foreign key (id_dri)
    references driver (id_dri) on delete restrict on update restrict;

alter table trip add constraint fk_trip_location foreign key (id_loc)
    references location (id_loc) on delete restrict on update restrict;

insert into location (lat_loc, long_loc, name_loc)
values (15, -77.12, 'Av. Javier Prado'),
       (-12.1234567, -77.000000, 'Av. Javier');

insert into driver (id_dri, id_loc, plate_car_dri, photo_car_dri, cod_user_dri)
    value (2, 1, 'ABC123', 'ABC123.jpg', 2);

insert into trip (id_dri, id_loc, leave_hour_trip, date_trip, available_trip, free_seats_trip, type_trip_trip)
    value (2 , 2, '10:00:00', '2023-07-26', true, 4, 'P');

insert into location (lat_loc, long_loc, name_loc)
values (-15.521345, 7.121234, 'Av. Orellana'),
       (12.1234567, -47.012345, 'Av. Francisco');

insert into driver (id_dri, id_loc, plate_car_dri, photo_car_dri, cod_user_dri)
    value (3, 3, 'ABC124', 'ABC124.jpg', 2);

insert into trip (id_dri, id_loc, leave_hour_trip, date_trip, available_trip, free_seats_trip, type_trip_trip)
    value (3 , 4, '12:00:00', '2023-07-27', true, 3, 'R');

insert into location (lat_loc, long_loc, name_loc)
values (-25.521345, 57.121234, 'Av. New York'),
       (2.1234567, -27.012345, 'Av. Americana');

#crear dos usuarios mas en el servicio de registro, y dejar al correo kschuquimarca2@espe.edu.ec como driver
insert into passenger (id_trip, id_loc, cod_user_pas)
values(null, 5, 4), (null, 6, 5);

insert into request (id_dri, id_pas, name_u_req, last_name_u_req, phone_u_req, date_req, state_req)
values (2, 1, 'Marco', 'Iza', '0987654321', '2023-07-26', 'P'), (2, 2, 'Alexander', 'Maila', '0987654321', '2023-07-27', 'P');

