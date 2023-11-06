import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vidar_app/components/my_button_login.dart';
import 'package:vidar_app/components/my_textfield_login.dart';
import 'package:vidar_app/components/square_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();
  
  final passwordController = TextEditingController();

  //metodo de usuario logeado
  void usuarioIniciado() async {
    //mostrar circulo de carga
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
        );

      //pop circulo de carga
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      //pop circulo de carga
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      //Mail o contraseña incorrectas
      if (e.code == 'user-not-found' || e.code == 'wrong-password' || e.code == 'INVALID_LOGIN_CREDENTIALS') {
        credencialesInvalidas();
      }
      else if (e.code == 'ERROR_MISSING_EMAIL'){
        campoEmailVacio();
      }
    }
  }

  //funcion de formato de mail incorrecto usando regex
  void campoEmailVacio() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
              backgroundColor: Colors.deepPurple,
              title: Center(
                  child: Text(
                'Por favor, introduce un correo electronico.',
              )));
        });
  }

  //Mensade de mail incorrecto en popup
  void credencialesInvalidas() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Color.fromARGB(255, 207, 207, 207),
            title: Center(
              child: Text(
                'Mail o contraseña incorrecta. Por favor, intenta de nuevo.',
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        });
  }

  void formatoMailInvalido() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
              backgroundColor: Colors.deepPurple,
              title: Center(
                  child: Text(
                'Por favor, introduce un formato de correo válido.',
              )));
        });
  }

//============================================WIDGET PRINCIPAL=======================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: FadeInUp(
              from: 250,
              delay: const Duration(seconds: 1),
              animate: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  /*<LOGO>, USAR ESTA CONFIGURACION PARA QUE NO TE MUEVA LOS DEMAS COMPONENTES
                  - El widget <Flexible> y <SingleChildScrollView> lo utilizo para que los componentes
                  - no se salgan de la pantalla al abrir el teclado
                  */
                  Flexible(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 400,
                          height: 300,
                          child: SvgPicture.asset(
                            'assets/images/VIDAR.svg',
                            semanticsLabel: 'mi logo',
                            height: 500,
                            width: 500,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            // ignore: deprecated_member_use
                            color: Colors.red[700],
                          ),
                        ),
                      )),

                  //ESLOGAN
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Te protegemos con ',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        TextSpan(
                          text: 'VIDAR',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.red[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),

                  //Email textfield
                  MyTextFieldLogin(
                    controller: emailController,
                    hintText: 'Correo electronico',
                    obscureText: 'false',
                  ),
                  const SizedBox(height: 10),

                  //PASSWORD TEXT FIELD
                  MyTextFieldLogin(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    obscureText: 'true',
                  ),
                  const SizedBox(height: 10),

                  //Olvido su contraseña?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Olvido su contraseña?',
                            style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),

                  //Iniciar Sesion boton
                  MyButtonLogin(
                    onTap: usuarioIniciado,
                  ),
                  const SizedBox(height: 25),

                  //O continuar boton
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('O continuar con...',
                              style: TextStyle(color: Colors.grey[700])),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  //Google + apple login butons
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Google boton
                      SquareTile(imagePath: 'assets/images/google.png'),

                      SizedBox(width: 25),

                      //Apple boton
                      SquareTile(imagePath: 'assets/images/apple.png'),
                    ],
                  ),
                  const SizedBox(height: 50),

                  //No tienes una cuenta? registrate ahora
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('No tienes una cuenta?'),
                      SizedBox(width: 4),
                      Text('Registrarse ahora',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
