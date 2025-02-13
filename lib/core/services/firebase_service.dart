import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Méthode pour l'inscription d'un utilisateur
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Erreur lors de l'inscription: $e");
      return null;
    }
  }

  // Méthode pour la connexion
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Erreur lors de la connexion: $e");
      return null;
    }
  }

  // Méthode pour se déconnecter
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Méthode pour vérifier l'utilisateur connecté
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
