INSERT INTO role (role_name) VALUES ('admin');
INSERT INTO role (role_name) VALUES ('user');

INSERT INTO wallet (wallet_amount) VALUES(0);
INSERT INTO wallet (wallet_amount) VALUES(100);
INSERT INTO user_account (user_account_name,user_account_email,user_account_phone,user_account_password,user_account_registration_date,id_wallet,id_role) 
VALUES('mainAdmin','admin@mail.ru','+375256456733','admin','2019-07-19',1,1);
