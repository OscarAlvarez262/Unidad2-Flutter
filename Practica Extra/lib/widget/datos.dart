import 'package:flutter/material.dart'; // Importa componentes UI de Material Design
import 'package:flutter_application_3/widget/lista.dart'; // Importa la pantalla destino 'Lista'

class Datos extends StatefulWidget {
  // Widget con estado (StatefulWidget) llamado Datos
  const Datos({super.key}); // Constructor de Datos con clave opcional
  @override // Sobrescribe el método para vincular la clase de estado
  State<StatefulWidget> createState() => _DatosState(); // Crea y devuelve el estado asociado '_DatosState'
} // Fin de la clase Datos

class Item {
  // Clase modelo para representar un producto
  final String producto; // Propiedad inmutable para el nombre del producto
  final String descripcion; // Propiedad inmutable para la descripción
  final String precio; // Propiedad inmutable para el precio del producto
  Item(
    this.producto,
    this.descripcion,
    this.precio,
  ); // Constructor para inicializar producto, descripcion y precio
} // Fin de la clase Item

class _DatosState extends State<Datos> {
  // Clase privada que gestiona el estado y la UI de Datos
  TextEditingController pre = TextEditingController(); // Controlador para el campo del nombre del producto
  TextEditingController des =
      TextEditingController(); // Controlador para el campo de la descripción
  TextEditingController prec =
      TextEditingController(); // Controlador para el campo del precio

  List<Item> items =
      []; // Lista vacía para almacenar los objetos 'Item' registrados

  void _Agregar() {
    // Función para validar y agregar un nuevo producto a la lista
    setState(() {
      // Notifica los cambios para redibujar la interfaz de usuario
      String p = pre.text; // Guarda el texto del campo producto en 'p'
      String d = des.text; // Guarda el texto del campo descripción en 'd'
      String pr = prec.text; // Guarda el texto del campo precio en 'pr'
      if (p.isNotEmpty && d.isNotEmpty && pr.isNotEmpty) {
        // Comprueba que los tres campos contengan texto
        items.add(Item(p, d, pr)); // Crea un nuevo objeto 'Item' y lo añade al final de la lista 'items'
        pre.clear(); // Limpia el campo de entrada del producto
        des.clear(); // Limpia el campo de entrada de la descripción
        prec.clear(); // Limpia el campo de entrada del precio
        ScaffoldMessenger.of(
          // Muestra una notificación confirmando la adición
          context, // Contexto de la interfaz de usuario
        ).showSnackBar(
          SnackBar(content: Text('Datos agregados a la lista')),
        ); // Muestra la barra emergente con el texto
      } else {
        // Si falta algún campo por completar
        ScaffoldMessenger.of(
              context,
            ) // Muestra una notificación pidiendo completar los datos
            .showSnackBar(
              SnackBar(content: Text('Faltan datos')),
            ); // Muestra la barra emergente de advertencia
      } // Fin del bloque if-else
    }); // Fin de setState
  } // Fin de la función _Agregar

  void _Enviar() async {
    // Función asíncrona para navegar a la pantalla 'Lista'
    Navigator.push(
      // Navega a una nueva pantalla manteniendo la actual en la pila de navegación
      context, // Contexto de la interfaz de usuario
      MaterialPageRoute(
        builder: (context) => Lista(items: items),
      ), // Pasa la lista 'items' a la pantalla Lista
    ); // Fin de push
    setState(() {}); // Fuerza un redibujado de la pantalla al regresar
  } // Fin de la función _Enviar

  @override // Sobrescribe el método de construcción de la interfaz
  Widget build(BuildContext context) {
    // Método build principal
    return Scaffold(
      // Estructura base de la pantalla
      appBar: AppBar(
        // Barra superior de navegación
        title: Text('Datos'), // Título mostrado en la barra superior
        backgroundColor: Colors
            .lightGreen, // Define el color de fondo verde claro para la barra
        actions: [
          IconButton(onPressed: _Enviar, icon: Icon(Icons.list)),
        ], // Botón con icono de lista que llama a _Enviar
      ), // Fin de AppBar
      body: Center(
        // Centra horizontal y verticalmente la tarjeta en la pantalla
        child: Padding(
          // Aplica un margen externo general
          padding: EdgeInsets.all(20), // Margen de 20px en todos los lados
          child: Card(
            // Tarjeta contenedora con sombra y bordes
            elevation: 8, // Define el nivel de elevación y sombra de la tarjeta
            shape: RoundedRectangleBorder(
              // Define los bordes redondeados
              borderRadius: BorderRadiusGeometry.circular(
                15,
              ), // Radio de curvatura de 15px en los bordes
            ), // Fin de shape
            child: Padding(
              // Aplica un margen interno dentro de la tarjeta
              padding: const EdgeInsets.all(15), // Margen interno de 15px
              child: Column(
                // Organiza los campos y botón verticalmente
                mainAxisSize: MainAxisSize
                    .max, // Ocupa el espacio vertical máximo permitido
                children: [
                  // Lista de widgets que conforman el formulario
                  TextField(
                    // Campo de texto para ingresar el nombre del producto
                    controller: pre, // Conecta con el controlador 'pre'
                    decoration: InputDecoration(
                      // Aplica diseño al campo
                      labelText:
                          'Escribe el producto', // Etiqueta flotante del campo
                      border: OutlineInputBorder(), // Añade un borde rectangular cerrado
                    ), // Fin de InputDecoration
                  ), // Fin de TextField producto
                  TextField(
                    // Campo de texto para ingresar la descripción
                    controller: des, // Conecta con el controlador 'des'
                    decoration: InputDecoration(
                      // Aplica diseño al campo
                      labelText: 'Escribe la descripcion', // Etiqueta flotante del campo
                      border: OutlineInputBorder(), // Añade un borde rectangular cerrado
                    ), // Fin de InputDecoration
                  ), // Fin de TextField descripción
                  TextField(
                    // Campo de texto para ingresar el precio
                    controller: prec, // Conecta con el controlador 'prec'
                    decoration: InputDecoration(
                      // Aplica diseño al campo
                      labelText:
                          'Escribe el precio', // Etiqueta flotante del campo
                      border: OutlineInputBorder(), // Añade un borde rectangular cerrado
                    ), // Fin de InputDecoration
                  ), // Fin de TextField precio
                  SizedBox(
                    height: 20,
                  ), // Separador transparente de 20px de alto
                  SizedBox(
                    // Ajusta el tamaño del botón
                    width: double.infinity, // Extiende el botón a todo el ancho disponible
                    child: ElevatedButton.icon(
                      // Botón elevado con icono
                      onPressed:
                          _Agregar, // Ejecuta la función _Agregar al presionar
                      label: Text('Agregar'), // Texto mostrado dentro del botón
                    ), // Fin de ElevatedButton.icon
                  ), // Fin de SizedBox del botón
                ], // Fin de children
              ), // Fin de Column
            ), // Fin de Padding interno
          ), // Fin de Card
        ), // Fin de Padding externo
      ), // Fin de Center
    ); // Fin de Scaffold
  } // Fin del método build
} // Fin de la clase _DatosState
