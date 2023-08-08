/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     8/7/2023 11:17:08 PM                         */
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
   ID_DRI               int not null auto_increment,
   ID_LOC               bigint,
   PLATE_CAR_DRI        varchar(6),
   PHOTO_CAR_DRI        varchar(30),
   COD_USER_DRI         int,
   primary key (ID_DRI)
);

/*==============================================================*/
/* Table: LOCATION                                              */
/*==============================================================*/
create table LOCATION
(
   ID_LOC               bigint not null auto_increment,
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
   ID_PAS               int not null auto_increment,
   ID_TRIP              bigint not null,
   ID_LOC               bigint,
   COD_USER_PAS         int,
   primary key (ID_PAS)
);

/*==============================================================*/
/* Table: REQUEST                                               */
/*==============================================================*/
create table REQUEST
(
   ID_REQ               bigint not null auto_increment,
   ID_DRI               int not null,
   ID_PAS               int not null,
   PHONE_REQ            varchar(10),
   STATE_REQ            varchar(1),
   primary key (ID_REQ)
);

/*==============================================================*/
/* Table: TRIP                                                  */
/*==============================================================*/
create table TRIP
(
   ID_TRIP              bigint not null auto_increment,
   ID_DRI               int not null,
   ID_LOC               bigint,
   LEAVE_HOUR_TRIP      time,
   DATE_TRIP            date,
   AVAILABLE_TRIP       bool,
   FREE_SEATS_TRIP      int,
   TYPE_TRIP_TRIP       varchar(1),
   primary key (ID_TRIP)
);

alter table DRIVER add constraint FK_DRIVER_LOCATION foreign key (ID_LOC)
      references LOCATION (ID_LOC) on delete restrict on update restrict;

alter table PASSENGER add constraint FK_PASSENGER_LOCATION foreign key (ID_LOC)
      references LOCATION (ID_LOC) on delete restrict on update restrict;

alter table PASSENGER add constraint FK_TRIP_PASSENGER foreign key (ID_TRIP)
      references TRIP (ID_TRIP) on delete restrict on update restrict;

alter table REQUEST add constraint FK_DRIVER_REQUEST foreign key (ID_DRI)
      references DRIVER (ID_DRI) on delete restrict on update restrict;

alter table REQUEST add constraint FK_PASSENGER_RESQUEST foreign key (ID_PAS)
      references PASSENGER (ID_PAS) on delete restrict on update restrict;

alter table TRIP add constraint FK_RELATIONSHIP_8 foreign key (ID_DRI)
      references DRIVER (ID_DRI) on delete restrict on update restrict;

alter table TRIP add constraint FK_TRIP_LOCATION foreign key (ID_LOC)
      references LOCATION (ID_LOC) on delete restrict on update restrict;

