create database student_registration_db;

use student_registration_db;

/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     7/8/2023 4:22:46 PM                          */
/*==============================================================*/


drop table if exists role_option;

drop table if exists option_role;

drop table if exists user;

drop table if exists university;

drop table if exists role_user;

/*==============================================================*/
/* Table: option_role                                           */
/*==============================================================*/
create table option_role
(
    id_op                varchar(3) not null,
    name_op              varchar(20) not null,
    description_op       varchar(100),
    primary key (id_op)
);

/*==============================================================*/
/* Table: role_option                                           */
/*==============================================================*/
create table role_option
(
    id_op                varchar(3) not null,
    id_rl                varchar(3) not null,
    primary key (id_op, id_rl)
);

/*==============================================================*/
/* Table: role_user                                             */
/*==============================================================*/
create table role_user
(
    id_rl                varchar(3) not null,
    name_rl              varchar(20) not null,
    description_rl       varchar(100),
    primary key (id_rl)
);

/*==============================================================*/
/* Table: university                                            */
/*==============================================================*/
create table university
(
    id_uni               int not null auto_increment,
    name_uni             varchar(30) not null,
    email_domain_uni     varchar(15) not null,
    primary key (id_uni)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
    id_user              int not null auto_increment,
    id_uni               int not null,
    id_rl                varchar(3) not null,
    ci_user              varchar(10) not null,
    email_user           varchar(30) not null,
    name_user            varchar(20) not null,
    last_name_user       varchar(20) not null,
    pass_user            varchar(60) not null,
    phone_user           varchar(10) not null,
    photo_user           varchar(30) not null,
    career_user          varchar(30) not null,
    first_login_user     bool not null,
    primary key (id_user)
);

alter table role_option add constraint fk_role_option foreign key (id_op)
    references option_role (id_op) on delete restrict on update restrict;

alter table role_option add constraint fk_role_option2 foreign key (id_rl)
    references role_user (id_rl) on delete restrict on update restrict;

alter table user add constraint fk_university_user foreign key (id_uni)
    references university (id_uni) on delete restrict on update restrict;

alter table user add constraint fk_user_role foreign key (id_rl)
    references role_user (id_rl) on delete restrict on update restrict;


insert into university (name_uni, email_domain_uni) value ('ESPE', 'espe.edu.ec');
insert into university (name_uni, email_domain_uni) value ('UTPL', 'utpl.edu.ec');
insert into university (name_uni, email_domain_uni) value ('UTA', 'uta.edu.ec');
insert into university (name_uni, email_domain_uni) value ('UDLA', 'udla.edu.ec');

insert into role_user (id_rl, name_rl, description_rl) value ('adm', 'admin', 'admin for drivers');
insert into role_user (id_rl, name_rl, description_rl) value ('drv', 'driver', 'driver for trips');
insert into role_user (id_rl, name_rl, description_rl) value ('psg', 'passenger', 'passenger to trip');

insert into option_role (id_op, name_op, description_op) value ('prq', 'pending requests', 'sn');
insert into option_role (id_op, name_op, description_op) value ('arq', 'approved requests', 'sn');
insert into option_role (id_op, name_op, description_op) value ('rap', 'rejected requests', 'sn');
insert into option_role (id_op, name_op, description_op) value ('smt', 'show my trips', 'sn');
insert into option_role (id_op, name_op, description_op) value ('bdr', 'be driver', 'sn');
insert into option_role (id_op, name_op, description_op) value ('tps', 'trips', 'sn');
insert into option_role (id_op, name_op, description_op) value ('crt', 'current trip', 'sn');
insert into option_role (id_op, name_op, description_op) value ('ctp', 'create trip', 'sn');
insert into option_role (id_op, name_op, description_op) value ('pfl', 'profile', 'sn');
insert into option_role (id_op, name_op, description_op) value ('lgo', 'log out', 'sn');

insert into role_option (id_op, id_rl) value ('prq', 'adm');
insert into role_option (id_op, id_rl) value ('arq', 'adm');
insert into role_option (id_op, id_rl) value ('rap', 'adm');
insert into role_option (id_op, id_rl) value ('pfl', 'adm');
insert into role_option (id_op, id_rl) value ('lgo', 'adm');

insert into role_option (id_op, id_rl) value ('smt', 'drv');
insert into role_option (id_op, id_rl) value ('crt', 'drv');
insert into role_option (id_op, id_rl) value ('ctp', 'drv');
insert into role_option (id_op, id_rl) value ('pfl', 'drv');
insert into role_option (id_op, id_rl) value ('lgo', 'drv');

insert into role_option (id_op, id_rl) value ('bdr', 'psg');
insert into role_option (id_op, id_rl) value ('tps', 'psg');
insert into role_option (id_op, id_rl) value ('crt', 'psg');
insert into role_option (id_op, id_rl) value ('pfl', 'psg');
insert into role_option (id_op, id_rl) value ('lgo', 'psg');


insert into user (id_uni, id_rl, ci_user, email_user, name_user, last_name_user, pass_user, phone_user, photo_user, career_user, first_login_user)
    VALUE (1, 'adm', '1727195420','kschuquimarca1@espe.edu.ec', 'Kevin', 'Chuquimarca', '$2a$10$ZzzNatroYb45eStYD3ij9.j6sed1f.yOEIfYn5HCYdAv.Lkol5f7a', '0984991746', '1727195420.png', 'Software', 1);

insert into user (id_uni, id_rl, ci_user, email_user, name_user, last_name_user, pass_user, phone_user, photo_user, career_user, first_login_user)
    VALUE (1, 'drv', '1727195421','kschuquimarca2@espe.edu.ec', 'Kevin', 'Chuquimarca', '$2a$10$ZzzNatroYb45eStYD3ij9.j6sed1f.yOEIfYn5HCYdAv.Lkol5f7a', '0984991746', '1727195420.png', 'Software', 1);

insert into user (id_uni, id_rl, ci_user, email_user, name_user, last_name_user, pass_user, phone_user, photo_user, career_user, first_login_user)
    VALUE (1, 'drv', '1727195422','kschuquimarca3@espe.edu.ec', 'Kevin', 'Chuquimarca', '$2a$10$ZzzNatroYb45eStYD3ij9.j6sed1f.yOEIfYn5HCYdAv.Lkol5f7a', '0984991746', '1727195420.png', 'Software', 1);

insert into user (id_uni, id_rl, ci_user, email_user, name_user, last_name_user, pass_user, phone_user, photo_user, career_user, first_login_user)
    VALUE (1, 'psg', '1727195423','kschuquimarca4@espe.edu.ec', 'Kevin', 'Chuquimarca', '$2a$10$ZzzNatroYb45eStYD3ij9.j6sed1f.yOEIfYn5HCYdAv.Lkol5f7a', '0984991746', '1727195420.png', 'Software', 1);

insert into user (id_uni, id_rl, ci_user, email_user, name_user, last_name_user, pass_user, phone_user, photo_user, career_user, first_login_user)
    VALUE (1, 'psg', '1727195424','kschuquimarca5@espe.edu.ec', 'Kevin', 'Chuquimarca', '$2a$10$ZzzNatroYb45eStYD3ij9.j6sed1f.yOEIfYn5HCYdAv.Lkol5f7a', '0984991746', '1727195420.png', 'Software', 1);

insert into user (id_uni, id_rl, ci_user, email_user, name_user, last_name_user, pass_user, phone_user, photo_user, career_user, first_login_user)
    VALUE (1, 'psg', '1727195424','kschuquimarca6@espe.edu.ec', 'Kevin', 'Chuquimarca', '$2a$10$ZzzNatroYb45eStYD3ij9.j6sed1f.yOEIfYn5HCYdAv.Lkol5f7a', '0984991746', '1727195420.png', 'Software', 1);
