import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskr/data/firestore.dart';

abstract class AuthenticateFirestoreAuth {
  Future<void> login(String email, String password);
  Future<void> register(String email, String password, String confirmPassword);
}

class Authenticate extends AuthenticateFirestoreAuth {
  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  }

  @override
  Future<void> register(
      String email, String password, String confirmPassword) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(), password: password.trim());
    FirestoreData().createUser(email);
  }
}
