import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vidar_app/components/my_button_login.dart';
import 'package:vidar_app/components/my_textfield_login.dart';
import 'package:vidar_app/components/square_tile.dart';
import 'package:vidar_app/services/auth_service.dart';

class RegisterPage extends StatefulWidget {

  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  
  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

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

    //Try crear usuario
    try {
      //Verificar que las contraseñas coincidan
      if(passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
        );
      } else {
        mensajeDeError('Las contraseñas no coinciden.');
      }

      //pop circulo de carga
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      //pop circulo de carga
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      //Mail o contraseña incorrectas
      if (e.code == 'user-not-found' || e.code == 'wrong-password' || e.code == 'INVALID_LOGIN_CREDENTIALS') {
        mensajeDeError('Mail o contraseña incorrecta. Por favor, intenta de nuevo.');
      }
    }
  }

  //Mensade de mail incorrecto en popup
  void mensajeDeError(String mensaje) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 207, 207, 207),
            title: Center(
              child: Text(
                mensaje,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
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
                          width: 240,
                          height: 225,
                          child: SvgPicture.asset(
                            'assets/images/VIDAR.svg',
                            semanticsLabel: 'mi logo',
                            height: 240,
                            width: 240,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            // ignore: deprecated_member_use
                            color: const Color(0xFF17203A),
                          ),
                        ),
                      )),

                  //ESLOGAN
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Crea tu cuenta en ',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        TextSpan(
                          text: 'VIDAR',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[400],
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

                  //CONFIRM PASSWORD TEXT FIELD
                  MyTextFieldLogin(
                    controller: confirmPasswordController,
                    hintText: 'Confirmar contraseña',
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
                    text: 'Registrarse',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Google boton
                      SquareTile(
                        imagePath: 'assets/images/google.png',
                        onTap: () => AuthService().signInWithGoogle(),
                      ),

                      const SizedBox(width: 25),

                      //Apple boton
                      SquareTile(
                        imagePath: 'assets/images/facebook.png',
                        onTap: () => {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),

                  //No tienes una cuenta? registrate ahora
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Ya tienes una cuenta?'),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text('Inicia sesion ahora',
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold)),
                      )
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
