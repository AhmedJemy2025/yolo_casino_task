import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yolo_casino_task/presentation/ui/characters_page.dart';

import 'di/characters_di_module.dart';

void main() {
  CharactersDIModule().configure(GetIt.I);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: CharactersPage(),
    );
  }
}

