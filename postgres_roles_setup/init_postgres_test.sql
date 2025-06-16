
-- 1. Création de la base de données
CREATE DATABASE test_app;

-- 2. Connexion à la base
\c test_app

-- 3. Activation de l'extension pour les UUIDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 4. Création de la table users
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    adresse TEXT NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telephone VARCHAR(20) NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    password VARCHAR(255),
    role VARCHAR(20) DEFAULT 'user' NOT NULL CHECK (role IN ('user', 'admin'))
);

-- 5. Insertion de quelques utilisateurs (avec mot de passe fictif pour test)
INSERT INTO users (nom, prenom, adresse, email, telephone, password, role)
VALUES 
('Dupont', 'Jean', '10 rue des Lilas', 'jean@example.com', '0601020304', 'hash1', 'user'),
('Martin', 'Sophie', '21 avenue République', 'sophie@example.com', '0605060708', 'hash2', 'admin');

-- 6. Vérification du contenu de la table
SELECT * FROM users;
