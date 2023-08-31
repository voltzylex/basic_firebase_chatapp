import 'package:firebase_chat_app/imports.dart';

class AuthServices extends ChangeNotifier {
  // instance of auth from firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // Sign user in
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credentail = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credentail;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      throw Exception(e.message);
    }
  }
// Sign Up

  Future<UserCredential> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final signUp = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
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
