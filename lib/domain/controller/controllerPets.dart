import 'package:SocialMascot/data/services/peticionesPets.dart';
import 'package:SocialMascot/domain/models/pets.dart';
import 'package:SocialMascot/domain/models/utiles.dart';
import 'package:get/get.dart';

class ControlPets extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<Pets>> listaPets = Rxn<List<Pets>>([]);

  Future<void> getPetsGral() async {
    listaPets.value = await PeticionesPets.getListPets();
  }

  Future<void> crearPets(
      String foto, String nombre, String raza, int iduser) async {
    _listarMensajes.value =
        (await PeticionesPets.registrarPets(foto, nombre, raza, iduser));
    await getPetsGral();
  }

  Future<void> modPets(
      int id, String foto, String nombre, String raza, int iduser) async {
    _listarMensajes.value =
        (await PeticionesPets.modificarPets(id, foto, nombre, raza, iduser));
    await getPetsGral();
  }

  Future<void> deletePets(int id) async {
    _listarMensajes.value = (await PeticionesPets.eliminarPets(id));
    await getPetsGral();
  }

  Future<void> validarPet(int id) async {
    listaPets.value = await PeticionesPets.validarPets(id);
  }

  List<Pets>? get listaPetsFinal => listaPets.value;
  List<Mensajes>? get listaMensajes => _listarMensajes.value;
}
