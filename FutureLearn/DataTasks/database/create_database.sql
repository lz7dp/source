drop table if exists computer;
drop table if exists picked;
drop table if exists result;

create table computer(name text, cores integer, cpu_speed real, ram real, cost real);
create table picked(name text, time real);
create table result(card1 text, card2 text, winner text);

insert into computer values ("Raspberry Pi 1 Model A", 1, 0.7, 256, 25);
insert into computer values ("Raspberry Pi 1 Model B 256MB", 1, 0.7, 256, 35);
insert into computer values ("Raspberry Pi 1 Model B 512MB", 1, 0.7, 512, 35);
insert into computer values ("Raspberry Pi 1 Model A+", 1, 0.7, 512, 25);
insert into computer values ("Raspberry Pi 1 Model B+", 1, 0.7, 512, 35);
insert into computer values ("Raspberry Pi 2 Model B",  4, 0.9, 1024, 35);
insert into computer values ("Raspberry Pi 3 Model B", 4, 1.2, 1024, 35);
insert into computer values ("Raspberry Pi 3 Model B+", 4, 1.4, 1024, 35);
insert into computer values ("Raspberry Pi 3 Model A+", 4, 1.4, 1024, 25);
insert into computer values ("Raspberry Pi 4 Model B 1GB", 4, 1.5, 1024, 35);
insert into computer values ("Raspberry Pi 4 Model B 2GB", 4, 1.5, 2048, 45);
insert into computer values ("Raspberry Pi 4 Model B 4GB", 4, 1.5, 4096, 55);
insert into computer values ("Raspberry Pi Zero", 1, 1, 512, 5);
insert into computer values ("Raspberry Pi Zero W", 1, 1, 512, 10);

insert into picked(name, time) values ("Raspberry Pi 4 Model B 4GB", 1564735180);

insert into result(card1, card2, winner) values ("Raspberry Pi 4 Model B 4GB", "Raspberry Pi 1 Model B 256MB", "Raspberry Pi 4 Model B 4GB");
