# 📦 backend-api-template

Une API RESTful construite avec **Node.js**, **Express**, **PostgreSQL**, **JWT** et **Multer** pour la gestion des utilisateurs, des authentifications et des uploads de fichiers.

---

## 🚀 Fonctionnalités

- Authentification avec **JWT**
- Gestion des utilisateurs (inscription, connexion, etc.)
- Connexion sécurisée à **PostgreSQL**
- Upload de fichiers (images, PDF, etc.) via **Multer**
- Protection des routes privées
- Sécurité améliorée avec **Helmet** et **CORS**

---

## 📁 Arborescence du projet

```
backend/
├── src/
│   ├── controllers/
│   ├── middlewares/
│   ├── routes/
│   ├── uploads/
│   ├── app.js
│   └── server.js
├── .env
├── package.json
└── README.md
```

---

## 🔧 Installation

1. **Cloner le repo**
   ```bash
   git clone https://github.com/ton-utilisateur/backend-api-template.git
   cd backend-api-template
   ```

2. **Installer les dépendances**
   ```bash
   npm install
   ```

3. **Configurer les variables d’environnement**
   Crée un fichier `.env` à la racine :

   ```env
   PORT=3000
   JWT_SECRET=une_phrase_ultra_secrète
   DATABASE_URL=postgresql://user:password@localhost:5432/ma_base
   ```

4. **Lancer le serveur en développement**
   ```bash
   npm run dev
   ```

---

## 🧪 Exemple de requêtes Postman

### 📤 Inscription (Signup)
`POST /api/users/signup`

```json
{
  "nom": "Doe",
  "prenom": "John",
  "email": "john.doe@example.com",
  "password": "123456"
}
```

### 🔐 Connexion (Login)
`POST /api/users/login`

```json
{
  "email": "john.doe@example.com",
  "password": "123456"
}
```

### 🔒 Accès à une route protégée
`GET /api/profile`  
Ajoute un header :
```
Authorization: Bearer <votre_token_JWT>
```

---

## 📸 Upload de fichier
`POST /api/upload`  
Content-Type : `multipart/form-data`  
Clé : `file` → (sélectionner un fichier local)

---

## 🧰 Stack utilisée

- Node.js
- Express.js
- PostgreSQL
- JSON Web Token (JWT)
- Multer
- Helmet
- CORS
- Dotenv

---

## 🛡️ Sécurité

- Les mots de passe sont hachés avec **bcrypt**
- JWT pour les sessions sécurisées
- Middleware pour vérifier l’authentification
- En-têtes de sécurité avec **helmet**
- Origines contrôlées avec **CORS**

---

## 📄 Licence

Ce projet est sous licence **MIT**.