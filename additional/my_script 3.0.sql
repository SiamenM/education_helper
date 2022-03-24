DROP DATABASE IF EXISTS education_helper;
CREATE DATABASE education_helper;
USE education_helper;

DROP TABLE IF EXISTS role;
CREATE TABLE role (
role_id SERIAL PRIMARY KEY,
role_name VARCHAR(50) NOT NULL UNIQUE);

INSERT INTO role (role_name) VALUES ('admin');
INSERT INTO role (role_name) VALUES ('user');
INSERT INTO role (role_name) VALUES ('author');

DROP TABLE IF EXISTS disciple;
CREATE TABLE disciple(
disciple_id SERIAL PRIMARY KEY,
disciple_name VARCHAR(100) NOT NULL UNIQUE);

INSERT INTO disciple (disciple_name) VALUES ('Programming');
INSERT INTO disciple (disciple_name) VALUES ('Technical');
INSERT INTO disciple (disciple_name) VALUES ('Humanities');
INSERT INTO disciple (disciple_name) VALUES ('Blueprint');
INSERT INTO disciple (disciple_name) VALUES ('General');

DROP TABLE IF EXISTS type_of_paper;
CREATE TABLE type_of_paper (
type_of_paper_id SERIAL PRIMARY KEY,
type_of_paper_name VARCHAR(100) NOT NULL UNIQUE);

INSERT INTO type_of_paper (type_of_paper_name) VALUES ('coursework');
INSERT INTO type_of_paper (type_of_paper_name) VALUES ('research paper');
INSERT INTO type_of_paper (type_of_paper_name) VALUES ('program');
INSERT INTO type_of_paper (type_of_paper_name) VALUES ('test');
INSERT INTO type_of_paper (type_of_paper_name) VALUES ('diploma');
INSERT INTO type_of_paper (type_of_paper_name) VALUES ('other');

DROP TABLE IF EXISTS step;
CREATE TABLE step (
step_id SERIAL PRIMARY KEY,
step_name VARCHAR(50) NOT NULL UNIQUE);

INSERT INTO step (step_name) VALUES ('evaluation');
INSERT INTO step (step_name) VALUES ('implementation');
INSERT INTO step (step_name) VALUES ('ready');
INSERT INTO step (step_name) VALUES ('revision');
INSERT INTO step (step_name) VALUES ('closed');

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
user_account_registration_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
user_account_is_available TINYINT NOT NULL DEFAULT 0,
user_account_info VARCHAR(500),
wallet_id BIGINT UNSIGNED UNIQUE,
PRIMARY KEY (user_account_id, wallet_id),
INDEX user_account_id_index (user_account_id  ASC),
INDEX user_account_phone_index (user_account_phone  ASC),
FOREIGN KEY (wallet_id) REFERENCES wallet(wallet_id)
ON DELETE CASCADE);

CREATE TABLE user_account_has_role (
user_account_id BIGINT UNSIGNED UNIQUE,
role_id BIGINT UNSIGNED UNIQUE,
PRIMARY KEY (user_account_id, role_id),
FOREIGN KEY (user_account_id) REFERENCES user_account(user_account_id)
ON DELETE CASCADE,
FOREIGN KEY (role_id) REFERENCES role(role_id)
);

INSERT INTO user_account (user_account_name, user_account_email, user_account_phone, user_account_password,
user_account_registration_date, user_account_is_available, user_account_info, wallet_id)
VALUES
('admin', 'admin@mail.ru', '+375256789090','123','2020-07-17',1,'admin',1); 

INSERT INTO user_account_has_role VALUES ((SELECT LAST_INSERT_ID()),(SELECT role_id FROM role WHERE role_name = 'admin'));

INSERT INTO user_account (user_account_name, user_account_email, user_account_phone, user_account_password,
user_account_registration_date, user_account_is_available, user_account_info, wallet_id)
VALUES
('user', 'user@mail.ru', '+375256788080','321','2020-07-18',1,'user',2); 

INSERT INTO user_account_has_role VALUES ((SELECT LAST_INSERT_ID()),(SELECT role_id FROM role WHERE role_name = 'user'));

INSERT INTO user_account (user_account_name, user_account_email, user_account_phone, user_account_password,
user_account_registration_date, user_account_is_available, user_account_info, wallet_id)
VALUES
('author', 'author@mail.ru', '+375256787070','qwe','2020-07-17',1,'author',3); 

INSERT INTO user_account_has_role VALUES ((SELECT LAST_INSERT_ID()),(SELECT role_id FROM role WHERE role_name = 'author'));

DROP TABLE IF EXISTS file;
CREATE TABLE file (
file_id SERIAL,
file_name VARCHAR(100) NOT NULL,
file_archive MEDIUMBLOB NOT NULL,
file_price DECIMAL(10,2) NOT NULL,
file_description VARCHAR(5000) NOT NULL,
file_add_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
file_is_available TINYINT NOT NULL DEFAULT 0,
type_of_paper_id BIGINT UNSIGNED NOT NULL,
disciple_id BIGINT UNSIGNED NOT NULL,
INDEX file_id_index (file_id ASC),
INDEX file_name_index (file_name ASC),
PRIMARY KEY (file_id, type_of_paper_id, disciple_id),
CONSTRAINT fk_file_disciple
FOREIGN KEY (type_of_paper_id)
REFERENCES type_of_paper (type_of_paper_id),
CONSTRAINT fk_file_type_of_paper
FOREIGN KEY (disciple_id)
REFERENCES disciple (disciple_id)
);

DROP TABLE IF EXISTS comment_for_file;
CREATE TABLE comment_for_file (
comment_for_file_id SERIAL,
comment_text VARCHAR(5000),
grade TINYINT(1) UNSIGNED NOT NULL,
comment_add_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
file_id BIGINT UNSIGNED NOT NULL,
INDEX comment_for_file_id_index (comment_for_file_id ASC),
INDEX file_id_index (file_id),
PRIMARY KEY (comment_for_file_id, file_id),
CONSTRAINT fk_comment_for_file
FOREIGN KEY (file_id)
REFERENCES file (file_id)
ON DELETE CASCADE
);

DROP TABLE IF EXISTS work_order;
CREATE TABLE work_order (
work_order_id SERIAL,
work_order_theme VARCHAR(70) NOT NULL,
work_order_task_file MEDIUMBLOB,
work_order_description VARCHAR(200),
work_order_add_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
work_order_deadline TIMESTAMP(6),
work_order_finished_file MEDIUMBLOB,
user_account_customer_id BIGINT UNSIGNED NOT NULL,
user_account_author_id BIGINT UNSIGNED NOT NULL,
disciple_id BIGINT UNSIGNED NOT NULL,
type_of_paper_id BIGINT UNSIGNED NOT NULL,
step_id BIGINT UNSIGNED NOT NULL,
INDEX work_order_id_index (work_order_id ASC),
PRIMARY KEY (work_order_id, disciple_id, type_of_paper_id, step_id ),
CONSTRAINT fk_work_order_type_of_paper
FOREIGN KEY (type_of_paper_id)
REFERENCES type_of_paper (type_of_paper_id),
CONSTRAINT fk_work_order_disciple
FOREIGN KEY (disciple_id)
REFERENCES disciple (disciple_id),
CONSTRAINT fk_work_order_step_id
FOREIGN KEY (step_id)
REFERENCES step (step_id)
);









