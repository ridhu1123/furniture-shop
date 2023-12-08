import 'package:flutter/material.dart';

class Sofa extends StatefulWidget {
  const Sofa({super.key});

  @override
  State<Sofa> createState() => _SofaState();
}

class _SofaState extends State<Sofa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(
        
        color: Colors.black,
      ),
    )
    );
  }
}
