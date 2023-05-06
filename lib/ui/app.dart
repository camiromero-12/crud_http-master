import 'package:SocialMascot/ui/auth/login.dart';
import 'package:SocialMascot/ui/auth/register.dart';
import 'package:SocialMascot/ui/content/pets/addPets.dart';
import 'package:SocialMascot/ui/content/pets/listPets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SocialMascot',
      theme: ThemeData(primarySwatch: Colors.amber),
      initialRoute: '/login',
      routes: {
        "/login": (context) => const Login(),
        "/register": (context) => const Register(),
        "/listPets": (context) => const ListPets(),
        "/addPets": (context) => const RegisterPets()
      },
    );
  }
}
