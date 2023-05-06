import 'package:SocialMascot/domain/controller/controllerPets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModPets extends StatefulWidget {
  final int id;
  final String foto;
  final String nombre;
  final String raza;
  final String iduser;

  const ModPets(
      {required this.id,
      required this.foto,
      required this.nombre,
      required this.raza,
      required this.iduser,
      super.key});

  @override
  State<ModPets> createState() => _ModPetsState();
}

class _ModPetsState extends State<ModPets> {
  @override
  Widget build(BuildContext context) {
    ControlPets controlp = Get.find();
    TextEditingController id =
        TextEditingController(text: widget.id.toString());
    TextEditingController foto = TextEditingController(text: widget.foto);
    TextEditingController nombre = TextEditingController(text: widget.nombre);
    TextEditingController raza = TextEditingController(text: widget.raza);
    TextEditingController iduser =
        TextEditingController(text: widget.iduser.toString());

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 80),
            child: const Text(
              "Gestión\nMascota",
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.27),
              child: Column(children: [
                TextField(
                  controller: id,
                  readOnly: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'Id mascota',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: foto,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'URL image',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: nombre,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'Nombre',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: raza,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'Raza',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: iduser,
                  readOnly: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'Id user',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (foto.text.isEmpty ||
                            nombre.text.isEmpty ||
                            raza.text.isEmpty ||
                            iduser.text.isEmpty) {
                          Get.snackbar(
                              'Mascotas', 'Todos los campos deben estar llenos',
                              duration: const Duration(seconds: 3),
                              icon: const Icon(Icons.info),
                              shouldIconPulse: true,
                              backgroundColor: Colors.grey[200]);
                        } else {
                          controlp
                              .modPets(
                                  int.parse(id.text),
                                  foto.text,
                                  nombre.text,
                                  raza.text,
                                  int.parse(iduser.text))
                              .then((value) {
                            Get.snackbar(
                                'Mascotas', controlp.listaMensajes![0].mensaje,
                                duration: const Duration(seconds: 3),
                                icon: const Icon(Icons.info),
                                shouldIconPulse: true,
                                backgroundColor: Colors.grey[100]);
                            controlp.getPetsGral();
                          });
                        }
                      },
                      child: const Text('Modificar'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            controlp
                                .deletePets(int.parse(id.text))
                                .then((value) {
                              Get.snackbar('Mascotas',
                                  controlp.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor: Colors.grey[100]);
                              controlp.getPetsGral();
                            });
                          },
                          child: const Text('Eliminar')),
                    )
                  ],
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
