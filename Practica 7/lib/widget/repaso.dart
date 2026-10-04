import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/pantalla.dart';

class Repaso extends StatefulWidget {
  const Repaso({super.key});
  @override
  State<StatefulWidget> createState() {
    return Imagenes();
  }
}

class Imagenes extends State<Repaso> {
  final TextEditingController n1 = TextEditingController();
  String dato = "";
  void validar() {
    setState(() {
      String t = n1.text;
      final int d = int.tryParse(n1.text) ?? 0;
      if (t == "") {
        dato = "La caja esta vacia";
      } else {
        dato = "La caja no esta vacia";
      }
      if (d == 0) {
        alertas("Error", "Datos incorrectos");
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Pantalla(dato: n1.text)),
        );
      }
    });
  }

  void alertas(String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            titulo,
            style: TextStyle(fontSize: 25, color: Colors.red),
          ),
          content: Text(
            mensaje,
            style: TextStyle(fontSize: 25, color: Colors.red),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(controller: n1),
                      SizedBox(height: 20),
                      Container(
                        child: ElevatedButton(
                          onPressed: validar,
                          child: Text('Enviar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dato,
                    style: TextStyle(
                      fontSize: 34,
                      fontFamily: "comics saen",
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
