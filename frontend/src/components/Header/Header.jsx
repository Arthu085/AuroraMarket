import './Header.css'
import { Link } from 'react-router-dom';

const Header = () => {
  return (
    <div>
        <header>
            <nav className='nav-header'>
                <div className='link-home'>
                    <Link to='/' className='home-link'>AURORA MARKET</Link>
                </div>
                <div className='links-header'>
                    <div className='link-pages'>
                        <Link to='' className='page-link'>Anéis</Link>
                        <Link to='' className='page-link'>Alianças</Link>
                        <Link to='' className='page-link'>Brincos</Link>
                        <Link to='' className='page-link'>Colares</Link>
                        <Link to='' className='page-link'>Correntes</Link>
                        <Link to='' className='page-link'>Pingentes</Link>
                        <Link to='' className='page-link'>Pulseiras</Link>
                        <Link to='' className='page-link'>Ver Tudo</Link>
                    </div>
                    <div className='login-carrinho'>
                        <Link to='' className='page-link'>Entre ou <br/>cadastre-se</Link>
                        <Link to='' className='page-link'><img src="carrinho-de-compras.png" alt="Carrinho de Compras" /></Link>
                    </div>
                </div>
            </nav>
        </header>
    </div>
  )
}

export default Header