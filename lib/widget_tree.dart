import 'package:flutter/material.dart';
import 'package:multiplayer_game/view/home.dart';
import 'package:multiplayer_game/view/login_register_page.dart';
import 'controller/auth.dart';

class WidgetTree extends StatefulWidget{
  const WidgetTree({super.key});

  @override
  State<StatefulWidget> createState() => WidgetTreeState();

}

class WidgetTreeState extends State<WidgetTree>{
  @override
  Widget build(BuildContext context) {
   return StreamBuilder(
       stream: Auth().authStateChanges,
    builder: (context, snapshot){
      if (snapshot.hasData){
        return HomePage();
      } else {
        return LoginPage();
    }
    },
   );
  }
}