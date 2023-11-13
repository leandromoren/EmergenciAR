// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Obtiene tu nombre de usuario
  final user = FirebaseAuth.instance.currentUser;

  //Metodo cerrar sesion
  void cerrarSesion() async {
    await FirebaseAuth.instance.signOut();
  }

  String traerFechaActual(){
    var now = DateTime.now();
    var formatterDate = DateFormat('dd/MM/yy');
    String actualDate = formatterDate.format(now);
    return actualDate;
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatterDate = DateFormat.yMMMMd('en_US');
    String actualDate = formatterDate.format(now);

    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '${user!.email}!',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        actualDate,
                        style: TextStyle(
                            
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[200]
                            ),
                      ),
                    ],
                  ),
                  //NOTIFICACION
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(5),
                    child: IconButton(
                      onPressed: cerrarSesion,
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

    /*Scaffold(
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
    );*/
  }
}
