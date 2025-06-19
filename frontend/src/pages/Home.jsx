import { Link } from 'react-router-dom';

const Home = () => (
  <div>
    <h1>Accueil</h1>
    <Link to="/login">Se connecter</Link>
  </div>
);

export default Home;
