Tạo cơ sở dữ liệu

```sql
CREATE DATABASE USERSDB;
GO

USE USERSDB;
GO

CREATE TABLE Users (
    id INT identity PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    userName VARCHAR(50) NOT NULL UNIQUE,
    fullName VARCHAR(100),
    password VARCHAR(100) NOT NULL,
    avatar VARCHAR(255),
    roleid INT default 3,
    phone VARCHAR(15),
	createdDate DATETIME DEFAULT GETDATE()
);

INSERT INTO Users (email, userName, fullName, password, avatar, roleid, phone)
VALUES
('john@example.com', 'john123', 'John Doe', '123456', 'avatar1.jpg', 1, '0123456789'),
('alice@example.com', 'alice99', 'Alice Smith', 'alicepwd', 'avatar2.jpg', 2, '0987654321'),
('bob@example.com', 'bob77', 'Bob Johnson', 'bobpass', 'avatar3.jpg', 2, '0911223344'),
('mary@example.com', 'mary88', 'Mary Brown', 'marypwd', 'avatar4.jpg', 3, '0909876543'),
('tom@example.com', 'tom007', 'Tom White', 'tompass', 'avatar5.jpg', 3, '0933445566'),
('linda@example.com', 'linda55', 'Linda Green', 'lindapwd', 'avatar6.jpg', 3, '0944556677'),
('kevin@example.com', 'kevin01', 'Kevin Black', 'kevinpwd', 'avatar7.jpg', 3, '0955667788'),
('susan@example.com', 'susan22', 'Susan Gray', 'susanpwd', 'avatar8.jpg', 3, '0966778899'),
('david@example.com', 'david33', 'David Blue', 'davidpwd', 'avatar9.jpg', 3, '0977889900'),
('emma@example.com', 'emma44', 'Emma Red', 'emmapwd', 'avatar10.jpg', 3, '0988990011');
