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