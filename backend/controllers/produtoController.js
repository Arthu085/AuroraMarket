const db = require('../models/db'); // Aqui você importa a função query

// Função para buscar todos os produtos
const getProdutos = async (req, res) => {
    try {
        const produtos = await db.query('SELECT * FROM auroramarket.produto', []);
        res.json(produtos); // Retorna todos os produtos encontrados
    } catch (error) {
        console.error('Erro ao buscar produtos:', error);
        res.status(500).json({ error: 'Erro ao buscar produtos' });
    }
};

// Função para adicionar um novo produto
const addProduto = async (req, res) => {
    const { nome, descricao, preco, id_categoria, id_status, id_material, imagem_url } = req.body;

    try {
        const queryText = `
            INSERT INTO auroramarket.produto (nome, descricao, preco, id_categoria, id_status, id_material, imagem_url) 
            VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *;
        `;

        const params = [nome, descricao, preco, id_categoria, id_status, id_material, imagem_url];

        const produto = await db.query(queryText, params);

        res.status(201).json(produto[0]);
    } catch (error) {
        console.error('Erro ao adicionar produto:', error);
        res.status(500).json({ error: 'Erro ao adicionar produto' });
    }
};



module.exports = { getProdutos, addProduto };
