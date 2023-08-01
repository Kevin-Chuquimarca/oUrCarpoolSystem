/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     7/26/2023 10:14:51 PM                        */
/*==============================================================*/


drop table if exists DRIVER;

drop table if exists LOCATION;

drop table if exists PASSENGER;

drop table if exists REQUEST;

drop table if exists TRIP;

/*==============================================================*/
/* Table: DRIVER                                                */
/*==============================================================*/
create table DRIVER
(
   ID_DRI               int not null,
   PLATE_CAR_DRI        varchar(6),
   MODEL_CAR_DRI        varchar(20),
   PHOTO_CAR_DRI        varchar(30),
   NUM_SEATS_DRI        int,
   FREE_SEATS_DRI       int,
   COD_USER_DRI         int,
   primary key (ID_DRI)
);

/*==============================================================*/
/* Table: LOCATION                                              */
/*==============================================================*/
create table LOCATION
(
   ID_LOC               bigint not null,
   ID_PAS               int not null,
   ID_DRI               int not null,
   ID_TRIP              bigint not null,
   LAT_LOC              decimal(9,6),
   LONG_LOC             decimal(9,6),
   NAME_LOC             varchar(30),
   primary key (ID_LOC)
);

/*==============================================================*/
/* Table: PASSENGER                                             */
/*==============================================================*/
create table PASSENGER
(
   ID_PAS               int not null,
   ID_TRIP              bigint not null,
   COD_USER_PAS         int,
   primary key (ID_PAS)
);

/*==============================================================*/
/* Table: REQUEST                                               */
/*==============================================================*/
create table REQUEST
(
   ID_REQ               bigint not null,
   ID_DRI               int not null,
   ID_PAS               int not null,
   PRICE_TRIP_REQ       decimal(10,2),
   PHONE_REQ            varchar(10),
   STATE_REQ            varchar(1),
   primary key (ID_REQ)
);

/*==============================================================*/
/* Table: TRIP                                                  */
/*==============================================================*/
create table TRIP
(
   ID_TRIP              bigint not null,
   ID_DRI               int not null,
   LEAVE_HOUR_TRIP      time,
   DATE_TRIP            date,
   ARRIVAL_HOUR_TRIP    time,
   AVAILABLE_TRIP       bool,
   PRICE_ALL_TRIP       decimal(10,2),
   primary key (ID_TRIP)
);

alter table LOCATION add constraint FK_DRIVER_LOCATION foreign key (ID_DRI)
      references DRIVER (ID_DRI) on delete restrict on update restrict;

alter table LOCATION add constraint FK_PASSENGER_LOCATION foreign key (ID_PAS)
      references PASSENGER (ID_PAS) on delete restrict on update restrict;

alter table LOCATION add constraint FK_TRIP_LOCATION foreign key (ID_TRIP)
      references TRIP (ID_TRIP) on delete restrict on update restrict;

alter table PASSENGER add constraint FK_TRIP_PASSENGER foreign key (ID_TRIP)
      references TRIP (ID_TRIP) on delete restrict on update restrict;

alter table REQUEST add constraint FK_DRIVER_REQUEST foreign key (ID_DRI)
      references DRIVER (ID_DRI) on delete restrict on update restrict;

alter table REQUEST add constraint FK_PASSENGER_RESQUEST foreign key (ID_PAS)
      references PASSENGER (ID_PAS) on delete restrict on update restrict;

alter table TRIP add constraint FK_RELATIONSHIP_8 foreign key (ID_DRI)
      references DRIVER (ID_DRI) on delete restrict on update restrict;

