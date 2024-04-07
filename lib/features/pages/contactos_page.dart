import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';
import 'package:vidar_app/utils/functions/colors.dart';

class ContactosPage extends StatefulWidget {
  const ContactosPage({super.key});

  @override
  State<ContactosPage> createState() => _ContactosPageState();
}

class _ContactosPageState extends State<ContactosPage> {
  List<Contact> _contactos = [];

  @override
  void initState() {
    super.initState();
    obtenerContactos();
  }

  Future<void> _llamarContacto(BuildContext context, Contact contacto) async {
    try {
      if (contacto.phones != null && contacto.phones!.isNotEmpty) {
        final phoneNumber = contacto.phones!.first;
        final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber.value!);
        await launchUrl(launchUri);
      }
    } catch (error) {
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(TTexts.msjErrorAlLlamarContacto),
            content: Text(error.toString()),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Aceptar"),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> obtenerContactos() async {
    PermissionStatus permissionStatus = await Permission.contacts.request();
    if (permissionStatus.isGranted) {
      List<Contact> contactos = await ContactsService.getContacts();
      setState(() {
        _contactos = contactos;
      });
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Permiso necesario'),
                content: const Text(TTexts.msjPermisosContactosNecesario),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar')),
                  TextButton(
                      child: const Text('Aceptar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Permission.contacts
                            .request()
                            .then((PermissionStatus status) {
                          if (status.isGranted) {
                            obtenerContactos();
                          }
                        });
                      })
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.navbarBackgroundColor,
        title: const Text(
          TTexts.tituloPrincipalContactos,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                Contact contact = _contactos[index];
                return Column(
                  children: [
                    ListTile(
                      leading:
                          (contact.avatar != null && contact.avatar!.isNotEmpty)
                              ? CircleAvatar(
                                  backgroundImage: MemoryImage(
                                      contact.avatar!.buffer.asUint8List()),
                                )
                              : CircleAvatar(
                                  foregroundColor: Colors.white,
                                  backgroundColor: TColors.secondaryAppColor,
                                  child: Text(contact.initials()),
                                ),
                      title: Text(contact.displayName ?? ''),
                      subtitle: Text(contact.phones!.isNotEmpty ? contact.phones!.first.value ?? '' : '-'),
                      onTap: () {
                        _llamarContacto(context, contact);
                      },
                    ),
                    const Divider(
                      height: 0.5,
                      color: TColors.dark,
                    )
                  ],
                );
              },
              childCount: _contactos.length,
            ),
          ),
        ],
      ),
    );
  }
}
