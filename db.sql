ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root_password';

-- Создание базы данных
CREATE DATABASE IF NOT EXISTS web_attack_test;

-- Использование созданной базы данных
USE web_attack_test;

-- Удаление таблиц
DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS auth_inf;

-- Создание таблицы users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Вставка данных в таблицу users
INSERT INTO users (username, email) VALUES
('administrator', 'admin@google.com'),
('Alex', 'Alex@yandex.ru'),
('Roman', 'Roman@mail.ru'),
('Alesya', 'Alesya@MIREA.ru'),
('MIREA', 'MIREA@MIREA.ru');

CREATE TABLE auth_inf (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    passwd TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO auth_inf (user_id, passwd) VALUES
(2, '123'),
(3, '321'),
(1, 'qwerty1234567890ytrewq'),
(4, '111'),
(5, '333');
