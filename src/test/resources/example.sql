CREATE TABLE users  /*создай таблицу users с полями id login password*/
(
    id      INT PRIMARY KEY AUTO_INCREMENT, /*тип поля int. primary key - поле идентификатор, по этому id будет идентифицироваться объекты в полях. auto_increment - все последующие объекты будут иметь id на 1 больше предыдущего*/
    login   VARCHAR(255) UNIQUE NOT NULL, /*тип поля текст (varchar (255 максимальное количество символов) unique - поле должно быть уникальным. not null - поле не может быть пустым)*/
    password VARCHAR(255)       NOT NULL
);
CREATE TABLE cards
(
    id                  INT PRIMARY KEY AUTO_INCREMENT,
    user_id             INT                NOT NULL,
    number              VARCHAR(19) UNIQUE NOT NULL,
    balance_in_kopecks  INT                NOT NULL DEFAULT 0, /*не может быть null, и если поле не заполнено, то дефолтное значение поля 0 (ноль)*/
    FOREIGN KEY (user_id) REFERENCES users (id) /*foreign key - внешний ключ - поле user_id связано с полем id в таблице users - созданные в этом проекте таблицы связаны между собой этими параметрами*/
);
INSERT INTO users (id, login, password) VALUES (1, 'vasya', "password");/* - вставь в таблицу users с полями (указанные в скобках) значения (указанные в скобках)*/
INSERT INTO users (id, login, password) VALUES (2,'petya', "password");

INSERT INTO cards (id, user_id, number, balance_in_kopecks)
VALUES (1, 1, '5559000000000001', 1000000),
       (2, 1, '5559000000000002', 1000000);

UPDATE cards SET balance_in_kopecks = balance_in_kopecks - 10000 /*- обновить в таблице cards установить значение */
WHERE number = '5559000000000001';                                /*где номер карты ранен .....*/
UPDATE cards SET balance_in_kopecks = balance_in_kopecks + 10000
WHERE number = '5559000000000002';

DELETE FROM users WHERE login = 'vasya'; /*-удалить из таблицы users где в логине присутствует vasya - но сначала надо удалить значения во второстепенной таблице, значения в которой привязаны к таблице, из которой хотим удалить значения*/

DELETE   /*удалить*/
FROM cards   /*из таблицы cards*/
WHERE user_id IN (SELECT id FROM users WHERE login = 'vasya'); /*где user_id связанная с id из таблицы users, связанные с логином 'vasya */

 -- выборка всех столбцов и всех строк из таблицы users (будьте острожны на больших таблицах)
SELECT * FROM users;

 -- выборка только определенных столбцов
SELECT id, login FROM users;

 -- выборка по условию
 SELECT balance_in_kopecks FROM cards WHERE number = '5559000000000002';

 -- вычисляемые столбцы
SELECT max(cards.balance_in_kopecks) FROM cards;
SELECT max(balance_in_kopecks) FROM cards WHERE user_id=1;

SELECT count(*), user_id FROM cards GROUP BY user_id;
