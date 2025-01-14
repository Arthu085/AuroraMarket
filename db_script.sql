-- Criação da tabela 'status'
CREATE TABLE status (
    id_status SERIAL PRIMARY KEY,
    status_nome VARCHAR(15) NOT NULL CONSTRAINT CHK_StatusNome CHECK (status_nome IN ('ativo', 'desativado'))
);

-- Criação da tabela 'categoria'
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(20) NOT NULL
);

-- Criação da tabela 'produto'
CREATE TABLE produto (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    preco NUMERIC(6,2) NOT NULL,
    material VARCHAR(15),
    imagem_url TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_categoria INT NOT NULL REFERENCES categoria(id_categoria),
    id_status INT NOT NULL REFERENCES status(id_status)
);

-- Inserções na tabela 'status'
INSERT INTO status (status_nome) VALUES
('ativo'),
('desativado');

-- Criação da tabela 'material'
CREATE TABLE material (
    id_material SERIAL PRIMARY KEY,
    nome_material VARCHAR(30) NOT NULL
);

-- Alteração da tabela 'produto' para incluir a coluna 'id_material' como chave estrangeira
ALTER TABLE produto
ADD COLUMN id_material INT NOT NULL REFERENCES material(id_material);
