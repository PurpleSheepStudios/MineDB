-- create the user that will be used by the plugin to 
-- manipulate the database.
-- TODO if this thing gets serious, do not have this openly on GitHub!
--
-- CREATE USER 'minedbuser'@'%'
-- IDENTIFIED BY 'qwertyuiop';
-- 
-- GRANT SELECT, INSERT, UPDATE, DROP, DELETE, CREATE 
-- ON minedb.*
-- TO 'minedbuser'@'%';

-- Make sure the database is created
-- CREATE DATABASE minedb;

DROP TABLE contributions;
DROP TABLE builds;
DROP TABLE users;

CREATE TABLE users (
    userID      INT AUTO_INCREMENT NOT NULL,
    username    VARCHAR(16) NOT NULL,
    password    CHAR(255) NOT NULL,
    salt        CHAR(255) NOT NULL,
    dateJoined  DATE NOT NULL,
    PRIMARY KEY (userID)
);

CREATE TABLE builds (
    buildID     INT AUTO_INCREMENT NOT NULL,
    buildName   VARCHAR(32) NOT NULL,
    buildDesc   TINYTEXT NOT NULL,
    buildData   LONGBLOB NOT NULL,
    buildImg    BLOB NOT NULL,
    PRIMARY KEY (buildID)
);

CREATE TABLE contributions (
    userID      INT NOT NULL,
    buildID     INT NOT NULL,
    CONSTRAINT fk_userID FOREIGN KEY (userID) 
    REFERENCES users (userID)
    ON DELETE CASCADE,
    CONSTRAINT fk_buildID FOREIGN KEY (buildID) 
    REFERENCES builds (buildID)
    ON DELETE CASCADE
);

