const sql = require('../config/dbConfig');

// Função genérica para consultas
const query = async (text, params) => {
    try {
        const res = await sql.unsafe(text, params); // Usa o método unsafe corretamente para passar o comando SQL
        return res;
    } catch (error) {
        console.error('Erro ao executar a consulta:', error);
        throw error;
    }
};

module.exports = { query };
