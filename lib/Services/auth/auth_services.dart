import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat_app/imports.dart';

class AuthServices extends ChangeNotifier {
  // instance of auth from firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  // Sign user in
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credentail = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // add a new doucment if the user is not already exists
      _fireStore.collection("users").doc(credentail.user!.uid).set(
        {"uid": credentail.user!.uid, "email": email},
        SetOptions(merge: true),
      );
      return credentail;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      throw Exception(e.message);
    }
  }
// Sign Up

  Future<UserCredential> signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final signUp = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      // After Creating a user,create a new document of user in usercollection
      _fireStore.collection("users").doc(signUp.user!.uid).set({
        "name": name,
        "uid": signUp.user!.uid,
        "email": email,
      });
      return signUp;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  // Sign user out
  Future<void> singOut() async {
    return await _firebaseAuth.signOut();
  }
}
