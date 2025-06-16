-- Script SQL pour modifier les droits d'un utilisateur PostgreSQL

-- Exemple : utilisateur concerné
-- Remplace 'app_user' par le nom du rôle ciblé si besoin


-- Supprimer le droit de lecture (SELECT)
REVOKE SELECT ON TABLE users FROM app_user;

-- Révoquer tous les privilèges existants sur la table 'users'
REVOKE ALL PRIVILEGES ON TABLE users FROM app_user;

-- Révoquer les droits de création dans le schéma public
REVOKE CREATE ON SCHEMA public FROM app_user;

-- Accorder uniquement les droits nécessaires
-- Ici, lecture (SELECT) uniquement
GRANT SELECT ON TABLE users TO app_user;

-- Si besoin : accès aux séquences (UUID, SERIAL, etc.)
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO app_user;

-- Vérification manuelle recommandée via :
-- \z users
-- ou :
-- SELECT grantee, privilege_type FROM information_schema.role_table_grants WHERE table_name = 'users';
