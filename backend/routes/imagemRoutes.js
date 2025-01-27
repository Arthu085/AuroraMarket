const express = require('express');
const { buscarImagens } = require('../controllers/imagemController');

const router = express.Router();

router.get('/', buscarImagens);

module.exports = router;
