import { useContext, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import AuthContext from '../contexts/AuthContext.jsx';

const Dashboard = () => {
  const { token, user, logout } = useContext(AuthContext);
  const [profile, setProfile] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    if (!token) {
      navigate('/login');
      return;
    }
    const fetchProfile = async () => {
      const res = await fetch('/api/users/me', {
        headers: { Authorization: `Bearer ${token}` }
      });
      if (res.ok) {
        const data = await res.json();
        setProfile(data);
      }
    };
    fetchProfile();
  }, [token, navigate]);

  if (!token) return null;

  return (
    <div>
      <h1>Dashboard {user?.role === 'admin' ? 'Admin' : 'Utilisateur'}</h1>
      <button onClick={() => { logout(); navigate('/'); }}>Se déconnecter</button>
      {profile && (
        <ul>
          <li>Nom: {profile.nom}</li>
          <li>Prénom: {profile.prenom}</li>
          <li>Email: {profile.email}</li>
          <li>Rôle: {profile.role}</li>
        </ul>
      )}
    </div>
  );
};

export default Dashboard;
