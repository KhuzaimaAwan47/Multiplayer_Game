import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final User? user = Auth().currentUser;

  Future<void> _signOut() async {
    await Auth().signOut();
  }

  Widget _title(){
    return Text('FireBase Auth');
}

Widget _useruid(){
    return Text(user?.email ?? 'user email');
}

Widget _signOutButton(){
    return ElevatedButton(
        onPressed: _signOut,
        child: Text('Sign Out')
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue, Colors.white
            ]
          )
        ),
        child: Column(
          children: [
            _useruid(),
            _signOutButton()
          ],
        ),
      ),
    );
  }
}