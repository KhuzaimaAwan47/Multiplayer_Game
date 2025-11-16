import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multiplayer_game/widget_tree.dart';

import 'configs/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multiplayer Game',
      theme: lightTheme,
      home: const WidgetTree(),
    );
  }
}






