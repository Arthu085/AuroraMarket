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

-- População da tabela 'categoria'
INSERT INTO categoria (nome_categoria) VALUES
('aneis'),
('aliancas'),
('brincos'),
('colares'),
('correntes'),
('pingentes'),
('pulseiras');

-- População da tabela 'material'
INSERT INTO material (nome_material) VALUES
('ouro'),
('prata'),
('platina'),
('aço inoxidável'),
('titânio'),
('couro');

-- População da tabela 'produto'
INSERT INTO produto (nome, descricao, preco, material, id_categoria, id_status, id_material) VALUES
-- Produtos para "aneis"
('Anel Solitário', 'Anel solitário com diamante.', 2500.00, 'ouro', 1, 1, 1),
('Anel de Prata', 'Anel minimalista em prata.', 200.00, 'prata', 1, 1, 2),
('Anel de Platina', 'Anel luxuoso em platina.', 3000.00, 'platina', 1, 1, 3),
('Anel Inox Moderno', 'Anel moderno em aço inoxidável.', 150.00, 'aço inoxidável', 1, 1, 4),
('Anel de Titânio', 'Anel resistente em titânio.', 500.00, 'titânio', 1, 1, 5),
('Anel de Couro', 'Anel estiloso em couro.', 80.00, 'couro', 1, 1, 6),

-- Produtos para "aliancas"
('Aliança Clássica', 'Aliança em ouro 18k.', 1200.00, 'ouro', 2, 1, 1),
('Aliança de Prata', 'Aliança simples em prata.', 300.00, 'prata', 2, 1, 2),
('Aliança de Platina', 'Aliança premium em platina.', 2500.00, 'platina', 2, 1, 3),
('Aliança Inox', 'Aliança moderna em aço inoxidável.', 180.00, 'aço inoxidável', 2, 1, 4),
('Aliança de Titânio', 'Aliança resistente em titânio.', 600.00, 'titânio', 2, 1, 5),
('Aliança de Couro', 'Aliança única em couro.', 100.00, 'couro', 2, 1, 6),

-- Produtos para "brincos"
('Brinco de Ouro', 'Brinco delicado em ouro.', 700.00, 'ouro', 3, 1, 1),
('Brinco de Prata', 'Brinco elegante em prata.', 150.00, 'prata', 3, 1, 2),
('Brinco de Platina', 'Brinco sofisticado em platina.', 1200.00, 'platina', 3, 1, 3),
('Brinco de Inox', 'Brinco casual em aço inoxidável.', 90.00, 'aço inoxidável', 3, 1, 4),
('Brinco de Titânio', 'Brinco inovador em titânio.', 350.00, 'titânio', 3, 1, 5),
('Brinco de Couro', 'Brinco artesanal em couro.', 60.00, 'couro', 3, 1, 6),

-- Produtos para "colares"
('Colar de Ouro', 'Colar fino em ouro 18k.', 1800.00, 'ouro', 4, 1, 1),
('Colar de Prata', 'Colar delicado em prata.', 250.00, 'prata', 4, 1, 2),
('Colar de Platina', 'Colar luxuoso em platina.', 3500.00, 'platina', 4, 1, 3),
('Colar de Inox', 'Colar robusto em aço inoxidável.', 200.00, 'aço inoxidável', 4, 1, 4),
('Colar de Titânio', 'Colar durável em titânio.', 600.00, 'titânio', 4, 1, 5),
('Colar de Couro', 'Colar rústico em couro.', 120.00, 'couro', 4, 1, 6),

-- Produtos para "correntes"
('Corrente de Ouro', 'Corrente de ouro com elos finos.', 2200.00, 'ouro', 5, 1, 1),
('Corrente de Prata', 'Corrente simples em prata.', 300.00, 'prata', 5, 1, 2),
('Corrente de Platina', 'Corrente luxuosa em platina.', 4000.00, 'platina', 5, 1, 3),
('Corrente de Inox', 'Corrente resistente em aço inoxidável.', 250.00, 'aço inoxidável', 5, 1, 4),
('Corrente de Titânio', 'Corrente estilosa em titânio.', 700.00, 'titânio', 5, 1, 5),
('Corrente de Couro', 'Corrente original em couro.', 140.00, 'couro', 5, 1, 6),

-- Produtos para "pingentes"
('Pingente de Ouro', 'Pingente delicado em ouro.', 800.00, 'ouro', 6, 1, 1),
('Pingente de Prata', 'Pingente elegante em prata.', 180.00, 'prata', 6, 1, 2),
('Pingente de Platina', 'Pingente sofisticado em platina.', 1500.00, 'platina', 6, 1, 3),
('Pingente de Inox', 'Pingente casual em aço inoxidável.', 100.00, 'aço inoxidável', 6, 1, 4),
('Pingente de Titânio', 'Pingente inovador em titânio.', 400.00, 'titânio', 6, 1, 5),
('Pingente de Couro', 'Pingente artesanal em couro.', 70.00, 'couro', 6, 1, 6),

-- Produtos para "pulseiras"
('Pulseira de Ouro', 'Pulseira elegante em ouro.', 1200.00, 'ouro', 7, 1, 1),
('Pulseira de Prata', 'Pulseira delicada em prata.', 200.00, 'prata', 7, 1, 2),
('Pulseira de Platina', 'Pulseira luxuosa em platina.', 2500.00, 'platina', 7, 1, 3),
('Pulseira de Inox', 'Pulseira casual em aço inoxidável.', 150.00, 'aço inoxidável', 7, 1, 4),
('Pulseira de Titânio', 'Pulseira inovadora em titânio.', 500.00, 'titânio', 7, 1, 5),
('Pulseira de Couro', 'Pulseira rústica em couro.', 90.00, 'couro', 7, 1, 6);
