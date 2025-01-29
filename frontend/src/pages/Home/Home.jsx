import { useEffect, useState } from 'react';
import Header from '../../components/Header/Header'

export const Home = () => {

  const [produtos, setProdutos] = useState([]);

  const fetchProdutos = async () => {
    try {
      const response = await fetch('http://localhost:3000/api/produtos');
      const data = await response.json();
  
      if (response.ok) {
        setProdutos(data);
      } else {
        alert(`Erro ao buscar produtos: ${data.message}.`);
      }
    } catch (error) {
      console.error('Erro ao buscar produtos:', error);
    }
  };

  useEffect(() => {
    fetchProdutos();
  }, []);

  return (
    <div>
      <Header></Header>
      <h1>Lista de Produtos</h1>
      {produtos.length === 0 ? (
        <p>Nenhum produto encontrado.</p>
      ) : (
        <ul>
          {produtos.map((produto) => (
            <li key={produto.id_produto}>
              <strong>Nome:</strong> {produto.nome} <br />
              <strong>Descrição:</strong> R${produto.descricao} <br />
              <strong>Preço:</strong> R${produto.preco} <br />
              {produto.imagem_url && (
                <img
                  src={produto.imagem_url}
                  alt={`Imagem de ${produto.nome}`}
                  style={{ width: '100px', height: '100px' }}
                />
              )}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default Home
