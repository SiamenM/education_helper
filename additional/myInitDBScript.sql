DROP DATABASE IF EXISTS education_helper;
CREATE DATABASE education_helper;
USE education_helper;

DROP TABLE IF EXISTS role;
CREATE TABLE role (
role_id SERIAL PRIMARY KEY,
role_name VARCHAR(50) NOT NULL UNIQUE);

INSERT INTO role (role_name) VALUES ('admin');
INSERT INTO role (role_name) VALUES ('user');

DROP TABLE IF EXISTS disciple;
CREATE TABLE disciple (
disciple_id SERIAL PRIMARY KEY,
disciple_name VARCHAR(100) NOT NULL UNIQUE);

INSERT INTO disciple (disciple_name) VALUES ('History');
INSERT INTO disciple (disciple_name) VALUES ('English');
INSERT INTO disciple (disciple_name) VALUES ('Programming');
INSERT INTO disciple (disciple_name) VALUES ('Law and legal issues');
INSERT INTO disciple (disciple_name) VALUES ('Literture');
INSERT INTO disciple (disciple_name) VALUES ('Mechanical engineering');
INSERT INTO disciple (disciple_name) VALUES ('Construction');

DROP TABLE IF EXISTS type_of_paper;
CREATE TABLE type_of_paper (
type_of_paper_id SERIAL PRIMARY KEY,
type_of_paper_name VARCHAR(100) NOT NULL UNIQUE);

INSERT INTO type_of_paper (type_of_paper_name) VALUES ('coursework');
INSERT INTO type_of_paper (type_of_paper_name) VALUES ('research paper');
INSERT INTO type_of_paper (type_of_paper_name) VALUES ('lab report');
INSERT INTO type_of_paper (type_of_paper_name) VALUES ('program');
INSERT INTO type_of_paper (type_of_paper_name) VALUES ('capstone project');
INSERT INTO type_of_paper (type_of_paper_name) VALUES ('other');


DROP TABLE IF EXISTS wallet;
CREATE TABLE wallet (
wallet_id SERIAL PRIMARY KEY,
wallet_amount DECIMAL(10,2) NOT NULL DEFAULT 0);

INSERT INTO wallet (wallet_amount) VALUES (0);
INSERT INTO wallet (wallet_amount) VALUES (10);
INSERT INTO wallet (wallet_amount) VALUES (100);

DROP TABLE IF EXISTS user_account;
CREATE TABLE user_account (
user_account_id SERIAL,
user_account_name VARCHAR(100) NOT NULL,
user_account_email VARCHAR(100) UNIQUE NOT NULL,
user_account_phone VARCHAR(20) UNIQUE NOT NULL,
user_account_password VARCHAR(100) NOT NULL,
user_account_is_available TINYINT NOT NULL DEFAULT 0,
user_account_registration_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
id_wallet BIGINT UNSIGNED UNIQUE,
PRIMARY KEY (user_account_id,id_wallet),
INDEX user_account_id_index (user_account_id  ASC),
INDEX user_account_phone_index (user_account_phone  ASC),
INDEX user_account_wallet_idx (id_wallet ASC),
CONSTRAINT fk_user_account_wallet
FOREIGN KEY (id_wallet) REFERENCES wallet(wallet_id)
ON DELETE CASCADE
);

CREATE TABLE user_account_has_role (
user_account_id BIGINT UNSIGNED NOT NULL,
role_id BIGINT UNSIGNED NOT NULL,
PRIMARY KEY (user_account_id, role_id),
FOREIGN KEY (user_account_id) REFERENCES user_account(user_account_id)
ON DELETE CASCADE,
FOREIGN KEY (role_id) REFERENCES role(role_id)
);

INSERT INTO user_account (user_account_name,user_account_email,user_account_phone,user_account_password,user_account_is_available,
user_account_registration_date,id_wallet) 
VALUES 
('admin','pupkin@mail.ru','+375256789887','$P$BouuqLmDzhR7UkGqPJDV8qyzwaBUTK0',1,'2020-07-17',1);

INSERT INTO user_account_has_role VALUES ((SELECT LAST_INSERT_ID()),(SELECT role_id FROM role WHERE role_name = 'admin'));

INSERT INTO user_account (user_account_name,user_account_email,user_account_phone,user_account_password,user_account_is_available,
user_account_registration_date,id_wallet) 
VALUES 
('user1','user1@mail.ru','+375256789987','$P$BouuqLmDzhR7UkGqPJDV8qyzwaBUTK0',1,'2020-07-17',2);

INSERT INTO user_account_has_role VALUES ((SELECT LAST_INSERT_ID()),(SELECT role_id FROM role WHERE role_name = 'user'));

INSERT INTO user_account (user_account_name,user_account_email,user_account_phone,user_account_password,user_account_is_available,
user_account_registration_date,id_wallet) 
VALUES 
('user2','user2@mail.ru','+375256778887','$P$BouuqLmDzhR7UkGqPJDV8qyzwaBUTK0',1,'2020-07-17',3);

INSERT INTO user_account_has_role VALUES ((SELECT LAST_INSERT_ID()),(SELECT role_id FROM role WHERE role_name = 'user'));

DROP TABLE IF EXISTS file;
CREATE TABLE file (
id_file SERIAL,
file_name VARCHAR(100) NOT NULL,
file_archive MEDIUMBLOB NOT NULL,
file_price DECIMAL(10,2) NOT NULL,
file_description VARCHAR(5000) NOT NULL,
add_file_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
file_is_available TINYINT NOT NULL DEFAULT 0,
disciple_id BIGINT UNSIGNED NOT NULL,
type_of_paper_id BIGINT UNSIGNED NOT NULL,
user_author_id BIGINT UNSIGNED NOT NULL,
INDEX id_file_index (id_file  ASC),
INDEX file_name_index (file_name  ASC),
PRIMARY KEY (id_file,disciple_id,type_of_paper_id),
CONSTRAINT fk_file_disciple
FOREIGN KEY(disciple_id)
REFERENCES disciple (disciple_id),
CONSTRAINT fk_file_type_of_paper
FOREIGN KEY(type_of_paper_id)
REFERENCES type_of_paper (type_of_paper_id)
);

DROP TABLE IF EXISTS comment_for_file;
CREATE TABLE comment_for_file (
comment_for_file_id SERIAL,
comment VARCHAR(5000),
grade TINYINT(1) UNSIGNED NOT NULL,
add_comment_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
file_id BIGINT UNSIGNED NOT NULL,
INDEX comment_for_file_id_index (comment_for_file_id  ASC),
INDEX file_id_index (file_id),
PRIMARY KEY (comment_for_file_id,file_id),
CONSTRAINT fk_comment_for_file
FOREIGN KEY (file_id)
REFERENCES file (id_file)
ON DELETE CASCADE
);

DROP TABLE IF EXISTS user_account_has_file;
CREATE TABLE user_account_has_file (
user_account_id BIGINT UNSIGNED NOT NULL,
file_id BIGINT UNSIGNED NOT NULL,
PRIMARY KEY (user_account_id, file_id),
FOREIGN KEY (user_account_id) REFERENCES user_account(user_account_id)
ON DELETE CASCADE,
FOREIGN KEY (file_id) REFERENCES file (id_file)
ON DELETE CASCADE
);

INSERT INTO file (file_name,file_archive,file_price,file_description,file_is_available,disciple_id,type_of_paper_id,user_author_id)
VALUES
('file1',BINARY('file1'),100,'file1 description',1,1,1,2);
INSERT INTO file (file_name,file_archive,file_price,file_description,file_is_available,disciple_id,type_of_paper_id,user_author_id)
VALUES
('file2',BINARY('file2'),1,'file1 description2',1,3,3,2);
INSERT INTO file (file_name,file_archive,file_price,file_description,file_is_available,disciple_id,type_of_paper_id,user_author_id)
VALUES
('file2',BINARY('file2'),0,'file1 description3',1,5,2,1);

INSERT INTO user_account_has_file (user_account_id, file_id)
VALUES (1,1);
INSERT INTO user_account_has_file (user_account_id, file_id)
VALUES (1,2);
INSERT INTO user_account_has_file (user_account_id, file_id)
VALUES (2,2);

INSERT INTO comment_for_file (comment, grade,file_id)
VALUES
('good file',5,1);
INSERT INTO comment_for_file (comment, grade,file_id)
VALUES
('bad file',0,1);
INSERT INTO comment_for_file (comment, grade,file_id)
VALUES
(NULL,3,2);