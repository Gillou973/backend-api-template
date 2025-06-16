-- Script SQL pour gestion des rôles avancée

-- Étape 1 : Supprimer un utilisateur s'il existe (ici : app_user)
DROP ROLE IF EXISTS app_user;

-- Étape 2 : Créer un utilisateur avec rôle "admin" et des privilèges avancés
CREATE ROLE admin_user WITH LOGIN PASSWORD 'MotDePasseAdmin';
-- Optionnel : lui donner la capacité de créer d'autres rôles ou bases
-- ALTER ROLE admin_user CREATEDB CREATEROLE;

-- Étape 3 : Donner à admin_user tous les privilèges sur la table users
GRANT ALL PRIVILEGES ON TABLE users TO admin_user;

-- Étape 4 : Donne accès aux séquences (UUID/SERIAL)
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO admin_user;

-- Étape 5 : Facultatif : lui donner aussi le droit de créer des objets dans le schéma public
GRANT CREATE ON SCHEMA public TO admin_user;

-- Vérification recommandée :
-- \du
-- \z users
