const express = require('express');
const { getProdutos, addProduto } = require('../controllers/produtoController');

const router = express.Router();

router.get('/', getProdutos);
router.post('/', addProduto);

module.exports = router;
