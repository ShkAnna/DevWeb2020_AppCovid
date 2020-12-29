DROP DATABASE IF EXISTS APPCOVID;

CREATE DATABASE APPCOVID;
USE APPCOVID;

DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Friend;
DROP TABLE IF EXISTS Activity;
DROP TABLE IF EXISTS Place;
DROP TABLE IF EXISTS Notification;


CREATE TABLE Users
(
    id_user   INT AUTO_INCREMENT PRIMARY KEY,
    login     TEXT NOT NULL ,
    user_password  TEXT NOT NULL ,
    name TEXT NOT NULL,
    first_name TEXT NOT NULL,
    email     VARCHAR(50) NOT NULL ,
    birthdate DATE NULL,
    is_positif BOOL NOT NULL DEFAULT FALSE,
    picture   TEXT NULL,
    is_admin  BOOL NOT NULL DEFAULT FALSE,

    CHECK (  name NOT LIKE ''),
    CHECK (  first_name NOT LIKE ''),
    CHECK (  email NOT LIKE ''),
    CONSTRAINT valid_date_birthday CHECK (birthdate > '1900/1/1')
);

CREATE TABLE Friend
(
    id_user INT NOT NULL ,
    id_friend INT NOT NULL ,

    FOREIGN KEY (id_user)
        REFERENCES Users(id_user)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_friend)
        REFERENCES Users(id_user)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Place
(
    id_place INT AUTO_INCREMENT PRIMARY KEY,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    address TEXT NULL,
    name TEXT NULL,

    CONSTRAINT empty_address CHECK(address NOT LIKE ''),
    CONSTRAINT empty_name CHECK(name NOT LIKE ''),

    CONSTRAINT lat_min CHECK (latitude > -90.0 ),
    CONSTRAINT lat_max CHECK(latitude < 90.0 ),
    CONSTRAINT long_min CHECK(longitude > -180 ),
    CONSTRAINT long_max CHECK(longitude < 180 )
);


CREATE TABLE Activity
(
    id_activity INTEGER  AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL ,
    id_place INT NOT NULL ,
    start_date DATETIME NOT NULL ,
    end_date DATETIME NOT NULL ,

    CONSTRAINT start_before_end_date CHECK(start_date <= end_date),

    FOREIGN KEY (id_user)
        REFERENCES Users(id_user)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_place)
        REFERENCES Place(id_place)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Notification
(
    id_notification INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_user_asking INT NOT NULL,
    id_user_other INT NOT NULL,
    message TEXT NOT NULL,
    friendRequest BOOL NOT NULL DEFAULT TRUE,
    send_date DATETIME,

    FOREIGN KEY (id_user_asking)
        REFERENCES Users(id_user)
        ON UPDATE CASCADE ON DELETE CASCADE,

    FOREIGN KEY (id_user_other)
        REFERENCES Users(id_user)
        ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO appcovid.user(login,user_password,name,first_name,email,is_admin,picture) VALUES('admin','d033e22ae348aeb5660fc2140aec35850c4da997','MrAdmin','Admin','admin@admin.fr','/pfp/default.png',TRUE);
