ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root_password';

-- SET PASSWORD = PASSWORD('root_password');

-- Создание базы данных
CREATE DATABASE my_database;

-- Использование созданной базы данных
USE my_database;

-- Создание таблицы users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Вставка данных в таблицу users
INSERT INTO users (username, email) VALUES
('user1', 'user1@example.com'),
('user2', 'user2@example.com'),
('user3', 'user3@example.com'),
('user4', 'user4@example.com'),
('user5', 'user5@example.com');
