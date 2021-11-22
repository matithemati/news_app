import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/models/userData.model.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final String _usersCollection = 'users';

  Future addRegisterInfo(UserData user) async {
    try {
      await _db.collection(_usersCollection).doc(user.email).set(user.toMap());
    } catch (e) {
      print(e);
    }
  }

  Future<bool> checkIfExist(String email) async {
    DocumentSnapshot user =
        await _db.collection(_usersCollection).doc(email).get();
    return user.exists;
  }

  Future<String> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      bool exist = await checkIfExist(email);

      if (!exist) {
        await addRegisterInfo(UserData(
            uid: userCredential.user!.uid,
            email: email,
            registerDate: Timestamp.now(),
            isAdmin: false,
            photoUrl: null));
      }
    } catch (e) {
      print(e);
      return e.toString().split('] ')[1];
    }

    return 'OK';
  }

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
      return e.toString().split('] ')[1];
    }

    return 'OK';
  }

  Future<bool> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        UserCredential user = await _auth.signInWithCredential(credential);

        bool exist = await checkIfExist(user.user!.email as String);

        if (!exist) {
          await addRegisterInfo(UserData(
              uid: user.user!.uid,
              email: user.user!.email as String,
              registerDate: Timestamp.now(),
              isAdmin: false,
              photoUrl: user.user!.photoURL));
        }
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
