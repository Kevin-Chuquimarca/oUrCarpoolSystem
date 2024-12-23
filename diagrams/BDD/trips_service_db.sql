create database trips_service_db;

use trips_service_db;

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
    name_loc             varchar(60),
    primary key (id_loc)
);

/*==============================================================*/
/* table: driver                                                */
/*==============================================================*/
create table driver
(
    id_dri               int not null,
    id_loc               bigint,
    plate_car_dri        varchar(7),
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
values (-0.306368, -78.449416, 'CASA FLIA LOPEZ'),
       (-0.302377, -78.448847, 'Quito');

insert into driver (id_dri, id_loc, plate_car_dri, photo_car_dri, cod_user_dri)
    value (2, 1, 'ABC122', 'ABC122.jpg', 2);

insert into trip (id_dri, id_loc, leave_hour_trip, date_trip, available_trip, free_seats_trip, type_trip_trip)
    value (2 , 2, '10:00:00', '2023-08-16', true, 4, 'P');

insert into location (lat_loc, long_loc, name_loc)
values (-0.300564, -78.453911, 'OE10-381'),
       (-0.297463, -78.448182, 'Río Pastaza');

insert into driver (id_dri, id_loc, plate_car_dri, photo_car_dri, cod_user_dri)
    value (3, 3, 'ABC123', 'ABC123.jpg', 3);

insert into trip (id_dri, id_loc, leave_hour_trip, date_trip, available_trip, free_seats_trip, type_trip_trip)
    value (3 , 4, '12:00:00', '2023-08-17', true, 3, 'R');

insert into location (lat_loc, long_loc, name_loc)
values (-0.306111, -78.445982, 'Alangasí'),
       (-0.299050, -78.443372, 'Av. Argentina'),
       (-0.332198, -78.434183, 'E20'),
       (-0.339834, -78.434183, 'Av. Salinas'),
       (-0.296116, -78.444412, 'San Juan de Dios');

insert into passenger (id_trip, id_loc, cod_user_pas)
values(null, 5, 2), (null, 6, 3), (1, 7, 4), (null, 8, 5), (null, 9, 6);

insert into request (id_dri, id_pas, name_u_req, last_name_u_req, phone_u_req, date_req, state_req)
values (2, 4, 'David', 'Chuquimarca', '0984991746', '2023-08-15', 'P'), (2, 5, 'Alex', 'Chuquimarca', '0984991746', '2023-08-15', 'P');
