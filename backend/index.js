require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

// Importar rotas
const produtoRoutes = require('./routes/produtoRoutes');
const imagemRoutes = require('./routes/imagemRoutes');

// Configurações do servidor
const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(bodyParser.json());
app.use(cors());

// Rotas
app.use('/api/produtos', produtoRoutes);
app.use('/api/imagens', imagemRoutes);

// Inicialização do servidor
app.listen(PORT, () => {
    console.log(`Servidor rodando em http://localhost:${PORT}`);
});
