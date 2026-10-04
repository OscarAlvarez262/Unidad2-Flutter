import 'package:flutter/material.dart';

class Pantalla extends StatefulWidget {
  final String dato;
  const Pantalla({super.key, required this.dato});
  @override
  State<StatefulWidget> createState() {
    return metodo();
  }
}

class metodo extends State<Pantalla> {
  String d = "";
  @override
  void initState() {
    super.initState();
    d = widget.dato;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(d)));
  }
}
