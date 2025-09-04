    CREATE DATABASE IF NOT EXISTS cinco_irmoes;
    USE cinco_irmoes;

    CREATE TABLE IF NOT EXISTS cliente(
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        telefone VARCHAR(15) NOT NULL,
        data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS funcionario(
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        cpf VARCHAR(11) NOT NULL UNIQUE,
        inicio_expediente TIME NOT NULL,
        fim_expediente TIME NOT NULL,
        telefone VARCHAR(15) NOT NULL,
        cargo VARCHAR(50) NOT NULL,
        salario DECIMAL(10,2) NOT NULL,
        data_admissao DATE NOT NULL,
        data_demissao DATE NULL,
        data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS veiculo(
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        marca VARCHAR(100) NOT NULL,
        tipo ENUM('carro', 'moto', 'camionete') NOT NULL,
        modelo VARCHAR(100) NOT NULL,
        cor VARCHAR(50) NOT NULL,
        ano INT NOT NULL,
        n_portas INT NULL,
        combustivel VARCHAR(50) NOT NULL, 
        cambio VARCHAR(50) NOT NULL,
        km INT NOT NULL,
        preco DECIMAL(12,2) NOT NULL,
        status ENUM('disponivel', 'vendido', 'alugado', 'reservado') NOT NULL DEFAULT 'disponivel',
        data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS locacao(
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        id_cliente INT UNSIGNED NOT NULL,
        id_funcionario INT UNSIGNED NOT NULL,
        id_veiculo INT UNSIGNED NOT NULL,
        data_locacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        data_devolucao TIMESTAMP NULL,
        status ENUM('ativa', 'finalizada', 'cancelada') NOT NULL DEFAULT 'ativa',
        FOREIGN KEY (id_cliente) REFERENCES cliente(id),
        FOREIGN KEY (id_funcionario) REFERENCES funcionario(id),
        FOREIGN KEY (id_veiculo) REFERENCES veiculo(id)
    );

    CREATE TABLE IF NOT EXISTS venda(
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        id_cliente INT UNSIGNED NOT NULL,
        id_funcionario INT UNSIGNED NOT NULL,
        id_veiculo INT UNSIGNED NOT NULL,
        data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        valor DECIMAL(12,2) NOT NULL,
        FOREIGN KEY (id_cliente) REFERENCES cliente(id),
        FOREIGN KEY (id_funcionario) REFERENCES funcionario(id),
        FOREIGN KEY (id_veiculo) REFERENCES veiculo(id)
    );

    INSERT INTO veiculo(marca, tipo, modelo, cor, ano, n_portas, combustivel, cambio, km, preco, status)
    VALUES("Chevrolet", "carro" ,"Chevette", "Prata", 1978, 2, "Gasolina", "Manual", 100, 75000, "disponivel");