import 'package:SocialMascot/domain/controller/controllerPets.dart';
import 'package:SocialMascot/domain/controller/controllerUser.dart';
import 'package:SocialMascot/ui/content/pets/modPets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPets extends StatelessWidget {
  const ListPets({super.key});

  @override
  Widget build(BuildContext context) {
    ControlPets controlp = Get.find();
    ControlUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, ${controlu.listaUserLogin![0].nombre}'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controlp.listaPetsFinal!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(controlp.listaPetsFinal![index].foto),
              ),
              title: Text(controlp.listaPetsFinal![index].nombre),
              subtitle: Text(controlp.listaPetsFinal![index].raza),
              trailing: (controlp.listaPetsFinal![index].iduser ==
                      controlu.listaUserLogin![0].id)
                  ? IconButton(
                      onPressed: () {
                        Get.to(ModPets(
                            id: controlp.listaPetsFinal![index].id,
                            foto: controlp.listaPetsFinal![index].foto,
                            nombre: controlp.listaPetsFinal![index].nombre,
                            raza: controlp.listaPetsFinal![index].raza,
                            iduser: controlp.listaPetsFinal![index].iduser
                                .toString()));
                      },
                      icon: const Icon(Icons.edit_note_outlined),
                      color: Colors.grey[400],
                    )
                  : const Text(''),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_rounded),
          onPressed: () {
            Get.toNamed("/addPets");
          }),
    );
  }
}
