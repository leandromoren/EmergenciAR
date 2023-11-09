import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google sign In
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //Obtener detalles del usuario
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    //Crear credencial para el usuario 
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    //Iniciar sesion con el usuario
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithFacebook() async {
    
  }
}