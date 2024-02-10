import 'package:e_book/Views/HomePage.dart';
import 'package:e_book/Views/WelcomPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  void signinWithEmail() async {
    try {
      final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleuser?.authentication;

      final Credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      await auth.signInWithCredential(Credential);

      Get.offAll(HomePage());
    } catch (e) {
      throw e;
    }
  }

  void signOut() async {
    await auth.signOut();
    Get.offAll(WelcomePage());
  }
}
