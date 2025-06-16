-- Script PostgreSQL pour création de rôles et de permissions

-- Étape 1 : Créer les rôles (avec mots de passe)
CREATE ROLE db_owner WITH LOGIN PASSWORD 'MotDePasseAdmin' CREATEDB;
CREATE ROLE app_user WITH LOGIN PASSWORD 'MotDePasseApp';
CREATE ROLE read_only_user WITH LOGIN PASSWORD 'MotDePasseReadOnly';

-- Étape 2 : Créer la base avec le bon propriétaire
CREATE DATABASE monappdb OWNER db_owner;

-- Étape 3 : À exécuter après connexion à la base
-- \c monappdb

-- Étape 4 : Créer la table users
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    adresse TEXT NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telephone VARCHAR(20) NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    password VARCHAR(255),
    role VARCHAR(20) DEFAULT 'user' CHECK (role IN ('user', 'admin')),
    is_active BOOLEAN DEFAULT true
);

-- Étape 5 : Accorder les permissions


--  ⚙️ À app_user (utilisé par le backend Node.js)
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE users TO app_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO app_user;

-- 👁️ À read_only_user (accès lecture seule)
GRANT SELECT ON TABLE users TO read_only_user;

-- ❌ Révocation de droits de création
REVOKE CREATE ON SCHEMA public FROM app_user;
REVOKE CREATE ON SCHEMA public FROM read_only_user;

-- CREATE SCHEMA app AUTHORIZATION db_owner - Dans la base, créer un schéma (si nécessaire);
CREATE SCHEMA app AUTHORIZATION db_owner;

-- Créer la base avec le bon owner
CREATE DATABASE monappdb OWNER db_owner;

-- DONNER LES DROITS :
-- Donner tous les droits à app_user uniquement sur certaines tables
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE users TO app_user;

-- Lecture seule
GRANT SELECT ON TABLE users TO read_only_user;

-- Donner accès aux séquences (UUID ou SERIAL)
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO app_user;

-- Facultatif : empêcher la création de tables par app_user
REVOKE CREATE ON SCHEMA public FROM app_user;

-- Requête SQL pour voir tous les droits d’un utilisateur
SELECT grantee, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE grantee = 'app_user';

ou \z users (users = Nom de la TABLE)