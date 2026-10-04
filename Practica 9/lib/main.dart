import 'package:flutter/material.dart'; // Importa los componentes visuales de Material Design
import 'package:flutter_application_1/widget/Lista.dart'; // Importa la pantalla o widget personalizado 'Lista'

void main() {
  // Punto de entrada principal de la aplicación
  runApp(const MyApp()); // Inicia y ejecuta el widget raíz de la app
} // Fin de la función main

class MyApp extends StatelessWidget {
  // Widget sin estado que representa la app
  const MyApp({
    super.key,
  }); // Constructor constante con clave única para el widget

  // Este widget es la raíz de la aplicación.
  @override // Sobrescribe el método de construcción de la interfaz
  Widget build(BuildContext context) {
    // Método que define la estructura visual del widget
    return MaterialApp(
      home: Lista(),
    ); // Crea la app Material y define 'Lista' como pantalla inicial
  } // Fin del método build
} // Fin de la clase MyApp
