import express from 'express';
import { signup, login, getProfile } from '../controllers/user.controller.js';
import { authenticateToken } from '../middlewares/authenticateToken.js';

const router = express.Router();

/**
 * @route   POST /api/v1/users/signup
 * @desc    Créer un nouvel utilisateur
 * @access  Public
 */
router.post('/signup', signup);

/**
 * @route   POST /api/v1/users/login
 * @desc    Authentifier un utilisateur et renvoyer un token
 * @access  Public
 */
router.post('/login', login);

/**
 * @route   GET /api/v1/users/me
 * @desc    Obtenir le profil de l'utilisateur connecté
 * @access  Privé (JWT)
 */
router.get('/me', authenticateToken, getProfile);

export default router;