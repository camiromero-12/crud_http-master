import 'package:SocialMascot/domain/controller/controllerPets.dart';
import 'package:SocialMascot/domain/controller/controllerUser.dart';
import 'package:SocialMascot/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ControlUser());
  Get.put(ControlPets());
  runApp(const App());
}
