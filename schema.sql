-- This is no longer needed as it's handled by MYSQL_DATABASE env var
CREATE DATABASE IF NOT EXISTS authdb;
USE authdb;

-- Criar tabela de usuários com melhores práticas
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    active BOOLEAN DEFAULT TRUE
);

-- Criar tabela de papéis (roles)
CREATE TABLE IF NOT EXISTS roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255)
);

-- Criar tabela de relacionamento entre usuários e papéis
CREATE TABLE IF NOT EXISTS user_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

-- Inserindo papéis padrões com descrições
INSERT INTO roles (name, description) VALUES 
('ROLE_ADMIN', 'Administrative access with full permissions'),
('ROLE_USER', 'Standard user with limited permissions')
ON DUPLICATE KEY UPDATE name=name;

-- Criando um usuário ADMIN padrão (senha: admin)
INSERT INTO users (username, email, password) VALUES 
('admin', 'admin@example.com', '$2a$10$XyQw78Vuh5UdoJDVJltA3eX/NXI8sLrU9Fwq/M9jEDd8Uu2m5uMea')
ON DUPLICATE KEY UPDATE username=username;

-- Associando o usuário admin ao papel ADMIN
INSERT INTO user_roles (user_id, role_id) 
VALUES ((SELECT id FROM users WHERE username = 'admin'), 
        (SELECT id FROM roles WHERE name = 'ROLE_ADMIN'))
ON DUPLICATE KEY UPDATE user_id=user_id;

-- Criando índices para melhorar performance
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_user_username ON users(username);