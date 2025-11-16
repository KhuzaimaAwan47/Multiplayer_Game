import 'package:flutter/material.dart';

class UserGames extends StatefulWidget{
  const UserGames({super.key});

  @override
  State<StatefulWidget> createState() => UserGamesState();

}

class UserGamesState extends State<UserGames> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: null,
     body: Center(child: Text('Games Page')),
   );
  }
}