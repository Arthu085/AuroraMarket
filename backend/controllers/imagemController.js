const axios = require('axios');

const buscarImagens = async (req, res) => {
    const { query } = req.query;
    try {
        const response = await axios.get('https://api.pexels.com/v1/search', {
            headers: { Authorization: process.env.PEXELS_API_KEY },
            params: { query, per_page: 10 },
        });
        res.json(response.data.photos.map(photo => photo.src.medium));
    } catch (error) {
        res.status(500).json({ error: 'Erro ao buscar imagens' });
    }
};

module.exports = { buscarImagens };
