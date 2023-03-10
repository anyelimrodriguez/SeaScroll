import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

class Auth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async{
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, password: password);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async{
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password);
  }

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  Future<void> updateName({
    required String name
  }) async{
    await currentUser?.updateDisplayName(name);
  }

  Future<void> updateProfilePic({
    required String photoURL
  }) async{
    await currentUser?.updatePhotoURL(photoURL);
  }
}