-- Выбор пользователя по ID
SELECT 
user.user_account_id,user.user_account_name,user.user_account_email,user.user_account_phone,user.user_account_password,user.user_account_is_available,
user.user_account_registration_date,wallet.wallet_id,wallet.wallet_amount,
role.role_name
FROM user_account AS user
JOIN wallet ON wallet.wallet_id=user.id_wallet
JOIN user_account_has_role ON user.user_account_id=user_account_has_role.user_account_id
JOIN role ON user_account_has_role.role_id=role.role_id
WHERE user.user_account_id=3;

-- Выбор файла по ID
SELECT
file.id_file,file.archive,file.file_price,file.description,file.add_date,
disciple.disciple_name,
type_of_paper.type_of_paper_name,
user_account.user_account_name
FROM file
JOIN disciple ON disciple.disciple_id=file.disciple_id
JOIN type_of_paper ON type_of_paper.type_of_paper_id=file.type_of_paper_id
JOIN user_account ON user_account.user_account_id=file.user_author_id
WHERE file.id_file=1;

-- Выбор комментариев по ID файла
SELECT
comment.comment_for_file_id,comment.comment,comment.grade,comment.add_comment_date
FROM comment_for_file as comment
JOIN file ON file.id_file=comment.file_id
WHERE comment.file_id=1
GROUP BY comment.comment_for_file_id
ORDER BY comment.add_comment_date;

-- Общая оценка на файл

-- Количество закачек файла
SELECT id_file, file_name, count(*) AS count
FROM file
INNER JOIN user_account_has_file ON (file.id_file=user_account_has_file.file_id)
GROUP BY file.id_file;

-- Вставка нового пользователя
START TRANSACTION;
    INSERT INTO wallet VALUES ();
       
	INSERT INTO user_account
    (user_account_name,user_account_email,user_account_phone,user_account_password,id_wallet)
    VALUES
    ('pip4iyka8','pipiy4ka5@mail.ru','+3745257177967','123',last_insert_id());
    
    INSERT INTO user_account_has_role VALUES (
    last_insert_id(),
    (SELECT role_id FROM role WHERE role_name='user'));
    COMMIT;
    
    SELECT user_account.user_account_id, user_account.user_account_name, role.role_name FROM user_account
    JOIN user_account_has_role AS rel ON user_account.user_account_id=rel.user_account_id
    JOIN role ON role.role_id=rel.role_id
    GROUP BY user_account.user_account_id;

INSERT into user_account_has_role (user_account_id,role_id ) VALUES(2,(SELECT role_id FROM role WHERE role_name='admin'));

DELETE FROM user_account_has_role WHERE user_account_id = 2 and role_id =(SELECT role_id FROM role WHERE role_name='admin');

UPDATE user_account SET user_account_password='hi' WHERE user_account_id=3;
UPDATE user_account SET user_account_name='1',user_account_email='email',user_account_phone='phone',user_account_is_available=0 WHERE user_account_id=3;
SELECT * FROM user_account;