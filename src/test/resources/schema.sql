CREATE TABLE cards
(
    id                  INT PRIMARY KEY AUTO_INCREMENT,
    user_id             INT                NOT NULL,
    number              VARCHAR(19) UNIQUE NOT NULL,
    balance_in_kopecks  INT                NOT NULL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users (id)
);