import 'dart:convert';
import 'package:SocialMascot/domain/models/pets.dart';
import 'package:SocialMascot/domain/models/utiles.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PeticionesPets {
  static Future<List<Pets>> getListPets() async {
    var url = Uri.parse(
        "https://unrewarded-guest.000webhostapp.com/petsAPI/listaPets.php");

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static List<Pets> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Pets>((json) => Pets.desdeJson(json)).toList();
  }

  static Future<List<Mensajes>> registrarPets(
      String foto, String nombre, String raza, int iduser) async {
    var url = Uri.parse(
        "https://unrewarded-guest.000webhostapp.com/petsAPI/addPets.php");

    final response = await http.post(url, body: {
      'foto': foto,
      'nombre': nombre,
      'raza': raza,
      'iduser': iduser.toString()
    });

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista1, response.body);
  }

  static List<Mensajes> convertirAlista1(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<Mensajes>> modificarPets(
      int id, String foto, String nombre, String raza, int iduser) async {
    var url = Uri.parse(
        "https://unrewarded-guest.000webhostapp.com/petsAPI/modificarPets.php");

    final response = await http.post(url, body: {
      'id': id.toString(),
      'foto': foto,
      'nombre': nombre,
      'raza': raza,
      'iduser': iduser.toString()
    });

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista1, response.body);
  }

  static Future<List<Mensajes>> eliminarPets(int id) async {
    var url = Uri.parse(
        "https://unrewarded-guest.000webhostapp.com/petsAPI/eliminarPets.php");

    final response = await http.post(url, body: {'id': id.toString()});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista1, response.body);
  }

  static Future<List<Pets>> validarPets(int id) async {
    var url = Uri.parse(
        "https://unrewarded-guest.000webhostapp.com/petsAPI/validarPets.php");

    final response = await http.post(url, body: {'id': id.toString()});

    return compute(convertirAlista2, response.body);
  }

  static List<Pets> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Pets>((json) => Pets.desdeJson(json)).toList();
  }
}
