/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     6/21/2023 9:31:16 PM                         */
/*==============================================================*/


drop table if exists ADMIN;

drop table if exists CAR;

drop table if exists DRIVER;

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
/* Table: CAR                                                   */
/*==============================================================*/
create table CAR
(
   PLATE_CAR            varchar(6) not null,
   ID_DRIVER            int not null,
   MODEL_CAR            varchar(20),
   PHOTO_CAR            longblob,
   PRICE_SEAT_CAR       decimal(10,2),
   NUM_SEATS_CAR        int,
   FREE_SEATS_CAR       int,
   primary key (PLATE_CAR)
);

/*==============================================================*/
/* Table: DRIVER                                                */
/*==============================================================*/
create table DRIVER
(
   ID_DRIVER            int not null auto_increment,
   ID_USER              int not null,
   PIN_ADMIN            int not null,
   APPROVAL_DATE_DRIVER date,
   SCORE_DRIVER         numeric(2,1),
   TYPE_LIC_DRIVER      varchar(1),
   EXPIRY_DATE_LIC_DRIVER date,
   PHOTO_LIC_DRIVER     longblob,
   primary key (ID_DRIVER)
);

/*==============================================================*/
/* Table: LOCATION                                              */
/*==============================================================*/
create table LOCATION
(
   ID_LOC               bigint not null auto_increment,
   ID_USER              int not null,
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
   ID_PASSENGER         int not null auto_increment,
   ID_USER              int not null,
   primary key (ID_PASSENGER)
);

/*==============================================================*/
/* Table: REQUEST                                               */
/*==============================================================*/
create table REQUEST
(
   ID_REQUEST           bigint not null auto_increment,
   ID_PASSENGER         int not null,
   ID_DRIVER            int not null,
   MESSAGE_REQUEST      varchar(100),
   primary key (ID_REQUEST)
);

/*==============================================================*/
/* Table: TRIP                                                  */
/*==============================================================*/
create table TRIP
(
   ID_TRIP              bigint not null auto_increment,
   ID_DRIVER            int not null,
   ID_PASSENGER         int,
   LEAVE_HOUR_TRIP      time,
   DATE_TRIP            date,
   ARRIVAL_HOUR_TRIP    time,
   primary key (ID_TRIP)
);

/*==============================================================*/
/* Table: UNIVERSITY                                            */
/*==============================================================*/
create table UNIVERSITY
(
   ID_UNI               int not null auto_increment,
   NAME_UNI             varchar(30),
   EMAIL_DOMAIN_UNI     varchar(15),
   primary key (ID_UNI)
);

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
create table USER
(
   ID_USER              int not null auto_increment,
   ID_UNI               int not null,
   EMAIL_USER           varchar(30),
   NAME_USER            varchar(20),
   LASTNAME_USER        varchar(20),
   PASS_USER            varchar(20),
   PHONE_USER           varchar(10),
   PHOTO_USER           longblob,
   CAREER_USER          varchar(25),
   primary key (ID_USER)
);

alter table CAR add constraint FK_DRIVER_CAR foreign key (ID_DRIVER)
      references DRIVER (ID_DRIVER) on delete restrict on update restrict;

alter table DRIVER add constraint FK_ADIM_DRIVER foreign key (PIN_ADMIN)
      references ADMIN (PIN_ADMIN) on delete restrict on update restrict;

alter table DRIVER add constraint FK_USER_DRIVER foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table LOCATION add constraint FK_SHOW foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table LOCATION add constraint FK_TRIP_LOCATION foreign key (ID_TRIP)
      references TRIP (ID_TRIP) on delete restrict on update restrict;

alter table PASSENGER add constraint FK_USER_PASSENGER foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table REQUEST add constraint FK_DRIVER_REQUEST foreign key (ID_DRIVER)
      references DRIVER (ID_DRIVER) on delete restrict on update restrict;

alter table REQUEST add constraint FK_PASSENGER_REQUEST foreign key (ID_PASSENGER)
      references PASSENGER (ID_PASSENGER) on delete restrict on update restrict;

alter table TRIP add constraint FK_DRIVER_RECORD foreign key (ID_DRIVER)
      references DRIVER (ID_DRIVER) on delete restrict on update restrict;

alter table TRIP add constraint FK_PASSENGER_TRIP foreign key (ID_PASSENGER)
      references PASSENGER (ID_PASSENGER) on delete restrict on update restrict;

alter table USER add constraint FK_UNIVERSITY_USER foreign key (ID_UNI)
      references UNIVERSITY (ID_UNI) on delete restrict on update restrict;

