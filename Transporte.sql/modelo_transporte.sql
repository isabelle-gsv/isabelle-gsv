-- ================================================
-- SCRIPT BANCO DE DADOS - APP DE TRANSPORTE
-- ================================================
DROP DATABASE IF EXISTS transporte;
CREATE DATABASE transporte CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE transporte;

-- ================================================
-- TABELA USUARIO
-- ================================================
CREATE TABLE Usuario (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_cadastro DATETIME NOT NULL
);

-- ================================================
-- TABELA PASSAGEIRO
-- ================================================
CREATE TABLE Passageiro (
    cpf CHAR(11) PRIMARY KEY,
    FOREIGN KEY (cpf) REFERENCES Usuario(cpf)
);

-- ================================================
-- TABELA MOTORISTA
-- ================================================
CREATE TABLE Motorista (
    cpf CHAR(11) PRIMARY KEY,
    cnh VARCHAR(20) NOT NULL,
    FOREIGN KEY (cpf) REFERENCES Usuario(cpf)
);

-- ================================================
-- TABELA VEICULO
-- ================================================
CREATE TABLE Veiculo (
    placa VARCHAR(10) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    esta_apto BOOLEAN NOT NULL,
    data_cadastro DATETIME NOT NULL,
    data_baixa DATETIME,
    cpf_motorista CHAR(11) NOT NULL,
    FOREIGN KEY (cpf_motorista) REFERENCES Motorista(cpf)
);

-- ================================================
-- TABELA ENDERECO
-- ================================================
CREATE TABLE Endereco (
    cep CHAR(8) PRIMARY KEY,
    numero VARCHAR(10) NOT NULL,
    logradouro VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL
);

-- ================================================
-- TABELA VIAGEM
-- ================================================
CREATE TABLE Viagem (
    id_viagem INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_inicio DATETIME NOT NULL,
    data_hora_termino DATETIME,
    cpf_passageiro CHAR(11) NOT NULL,
    cpf_motorista CHAR(11) NOT NULL,
    origem_cep CHAR(8) NOT NULL,
    destino_cep CHAR(8) NOT NULL,
    FOREIGN KEY (cpf_passageiro) REFERENCES Passageiro(cpf),
    FOREIGN KEY (cpf_motorista) REFERENCES Motorista(cpf),
    FOREIGN KEY (origem_cep) REFERENCES Endereco(cep),
    FOREIGN KEY (destino_cep) REFERENCES Endereco(cep)
);

-- ================================================
-- TABELA PARADAS INTERMEDIARIAS
-- ================================================
CREATE TABLE Parada (
    id_viagem INT NOT NULL,
    cep CHAR(8) NOT NULL,
    PRIMARY KEY (id_viagem, cep),
    FOREIGN KEY (id_viagem) REFERENCES Viagem(id_viagem),
    FOREIGN KEY (cep) REFERENCES Endereco(cep)
);

-- ================================================
-- TABELA PAGAMENTO
-- ================================================
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    forma ENUM('PIX', 'DINHEIRO', 'CARTAO_CREDITO', 'CARTAO_DEBITO') NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_hora DATETIME NOT NULL,
    id_viagem INT NOT NULL,
    FOREIGN KEY (id_viagem) REFERENCES Viagem(id_viagem)
);

-- ================================================
-- TABELA AVALIACAO
-- ================================================
CREATE TABLE Avaliacao (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    nota INT CHECK(nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_hora DATETIME NOT NULL,
    id_viagem INT NOT NULL,
    cpf_passageiro CHAR(11) NOT NULL,
    FOREIGN KEY (id_viagem) REFERENCES Viagem(id_viagem),
    FOREIGN KEY (cpf_passageiro) REFERENCES Passageiro(cpf)
);

-- ================================================
-- TABELA CANCELAMENTO
-- ================================================
CREATE TABLE Cancelamento (
    id_viagem INT PRIMARY KEY,
    motivo TEXT,
    data_hora DATETIME NOT NULL,
    FOREIGN KEY (id_viagem) REFERENCES Viagem(id_viagem)
);
