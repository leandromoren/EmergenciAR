import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vidar_app/pages/home_page.dart';
import 'package:vidar_app/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          //User logeado
          if (snapshot.hasData) {
            return HomePage();
          }
          //User no logeado 
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}