/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     7/3/2023 9:51:51 PM                          */
/*==============================================================*/


drop table if exists ADMIN;

drop table if exists DRIVER;

drop table if exists DRIVER_REQUEST;

drop table if exists LOCATION;

drop table if exists PASSENGER;

drop table if exists REQUEST;

drop table if exists TRIP;

drop table if exists UNIVERSITY;

drop table if exists USER;

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN
(
   PIN_ADMIN            int not null auto_increment,
   USER_ADMIN           varchar(20),
   PASSWORD_ADMIN       varchar(20),
   EMAIL_ADMIN          varchar(30),
   PHONE_ADMIN          varchar(10),
   primary key (PIN_ADMIN)
);

/*==============================================================*/
/* Table: DRIVER                                                */
/*==============================================================*/
create table DRIVER
(
   ID_DRI               int not null auto_increment,
   PLATE_CAR_DRI        varchar(6),
   MODEL_CAR_DRI        varchar(20),
   PHOTO_CAR_DRI        varchar(30),
   PRICE_SEAT_DRI       decimal(10,2),
   NUM_SEATS_DRI        int,
   FREE_SEATS_DRI       int,
   COD_USER_DRI         int,
   primary key (ID_DRI)
);

/*==============================================================*/
/* Table: DRIVER_REQUEST                                        */
/*==============================================================*/
create table DRIVER_REQUEST
(
   ID_DR                int not null auto_increment,
   PIN_ADMIN            int not null,
   EMAIL_DR             varchar(30),
   APPROVAL_DATE_DR     date,
   TYPE_LIC_DR          varchar(1),
   EXPIRY_DATE_LIC_DR   date,
   PHOTO_LIC_DR         longblob,
   PLATE_CAR_DR         varchar(6),
   PHOTO_CAR_DR         varchar(30),
   COD_USER_DR          int,
   primary key (ID_DR)
);

/*==============================================================*/
/* Table: LOCATION                                              */
/*==============================================================*/
create table LOCATION
(
   ID_LOC               bigint not null auto_increment,
   ID_PAS               int not null,
   ID_DRI               int not null,
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
   MESSAGE_REQ          varchar(100),
   PHONE_REQ            varchar(10),
   ACEPTED_REQ          bool,
   primary key (ID_REQ)
);

/*==============================================================*/
/* Table: TRIP                                                  */
/*==============================================================*/
create table TRIP
(
   ID_TRIP              bigint not null auto_increment,
   ID_DRI               int not null,
   LEAVE_HOUR_TRIP      time,
   DATE_TRIP            date,
   ARRIVAL_HOUR_TRIP    time,
   AVAILABLE_TRIP       bool,
   primary key (ID_TRIP)
);

/*==============================================================*/
/* Table: UNIVERSITY                                            */
/*==============================================================*/
create table UNIVERSITY
(
   ID_UNI               int not null auto_increment,
   NAME_UNI             varchar(30) not null,
   EMAIL_DOMAIN_UNI     varchar(15) not null,
   primary key (ID_UNI)
);

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
create table USER
(
   ID_USER              int not null auto_increment,
   ID_UNI               int not null,
   CI_USER              varchar(10) not null,
   EMAIL_USER           varchar(30) not null,
   NAME_USER            varchar(20) not null,
   LAST_NAME_USER       varchar(20) not null,
   PASS_USER            varchar(60) not null,
   PHONE_USER           varchar(10) not null,
   PHOTO_USER           varchar(30) not null,
   CAREER_USER          varchar(30) not null,
   FIRTS_LOGIN_USER     bool not null,
   primary key (ID_USER)
);

alter table DRIVER_REQUEST add constraint FK_ADIM_DRIVER foreign key (PIN_ADMIN)
      references ADMIN (PIN_ADMIN) on delete restrict on update restrict;

alter table LOCATION add constraint FK_DRIVER_LOCATION foreign key (ID_DRI)
      references DRIVER (ID_DRI) on delete restrict on update restrict;

alter table LOCATION add constraint FK_PASSENGER_LOCATION foreign key (ID_PAS)
      references PASSENGER (ID_PAS) on delete restrict on update restrict;

alter table PASSENGER add constraint FK_TRIP_PASSENGER foreign key (ID_TRIP)
      references TRIP (ID_TRIP) on delete restrict on update restrict;

alter table REQUEST add constraint FK_DRIVER_REQUEST foreign key (ID_DRI)
      references DRIVER (ID_DRI) on delete restrict on update restrict;

alter table REQUEST add constraint FK_PASSENGER_RESQUEST foreign key (ID_PAS)
      references PASSENGER (ID_PAS) on delete restrict on update restrict;

alter table TRIP add constraint FK_RELATIONSHIP_8 foreign key (ID_DRI)
      references DRIVER (ID_DRI) on delete restrict on update restrict;

alter table USER add constraint FK_UNIVERSITY_USER foreign key (ID_UNI)
      references UNIVERSITY (ID_UNI) on delete restrict on update restrict;

