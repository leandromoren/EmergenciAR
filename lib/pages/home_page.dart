import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //Obtiene tu numbre de usuario
  final user = FirebaseAuth.instance.currentUser;

  //Metodo cerrar sesion
  void cerrarSesion() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: cerrarSesion,
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Center(
        child: Text('Es un placer tenerte con nosotros ${user!.email}!',
          style: const TextStyle(
            fontSize: 15
          ),
        ),
      ),
    );
  }
}