import 'package:flutter/material.dart';

class SinglePlayer extends StatelessWidget{
  const SinglePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Player'),
        centerTitle: true,
      ),
    );

  }
}