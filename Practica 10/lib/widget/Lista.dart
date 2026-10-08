import 'package:flutter/material.dart'; // Importa componentes UI de Material Design

class Lista extends StatefulWidget {
  // Widget con estado (StatefulWidget) llamado Lista
  final String Nomb; // Variable inmutable para recibir el nombre del usuario
  const Lista({
    super.key,
    required this.Nomb,
  }); // Constructor con parámetro Nomb obligatorio
  @override // Sobrescribe el método para vincular la clase de estado
  State<StatefulWidget> createState() {
    // Crea el estado asociado al widget
    return lis(); // Devuelve la instancia de la clase que gestiona el estado
  } // Fin de createState
} // Fin de la clase Lista

class Item {
  // Clase modelo para representar cada contacto
  final String
  name; // Propiedad inmutable para almacenar el nombre del contacto
  final String
  numero; // Propiedad inmutable para almacenar el teléfono del contacto
  Item(this.name, this.numero); // Constructor para inicializar name y numero
} // Fin de la clase Item

class lis extends State<Lista> {
  // Clase que gestiona el estado y la UI de Lista
  String n = ""; // Variable local para almacenar el nombre del usuario
  void initState() {
    // Se ejecuta automáticamente al inicializar el estado del widget
    super.initState(); // Ejecuta la inicialización de la clase base State
    n = widget.Nomb; // Asigna a 'n' el valor recibido en 'Nomb' desde el widget
  } // Fin de initState

  TextEditingController name = new TextEditingController(); // Controlador para la caja de texto del nombre
  TextEditingController phone = new TextEditingController(); // Controlador para la caja de texto del teléfono
  void _agregar() {
    // Función para abrir el diálogo emergente y agregar un contacto
    showDialog(
      // Despliega un cuadro de diálogo en pantalla
      context: context, // Contexto de la interfaz para posicionar el diálogo
      builder: (context) {
        // Constructor que define el contenido del diálogo
        return AlertDialog(
          // Cuadro de diálogo emergente
          actions: [
            // Lista de widgets que conforman el contenido del diálogo
            TextField(
              // Campo de texto para el nombre del contacto
              controller: name, // Conecta con el controlador 'name'
              decoration: InputDecoration(
                label: Text('Ingresa el nombre'),
              ), // Etiqueta del campo
            ), // Fin de TextField name
            TextField(
              // Campo de texto para el teléfono del contacto
              controller: phone, // Conecta con el controlador 'phone'
              decoration: InputDecoration(
                label: Text('Telefono'),
              ), // Etiqueta del campo
            ), // Fin de TextField phone
            Center(
              // Centra el botón de acción
              child: TextButton(
                // Botón de texto para confirmar la acción
                onPressed: () {
                  // Evento al hacer clic en 'Aceptar'
                  String nm = name
                      .text; // Guarda el texto escrito en la caja del nombre
                  String phn = phone
                      .text; // Guarda el texto escrito en la caja del teléfono
                  if (nm.isNotEmpty && phn.isNotEmpty) {
                    // Comprueba que ambas cajas tengan texto
                    setState(() {
                      // Actualiza el estado para reflejar el nuevo ítem en la interfaz
                      items.insert(
                        0,
                        Item(nm, phn),
                      ); // Inserta el nuevo contacto al inicio de la lista
                    }); // Fin de setState
                    name.clear(); // Limpia la caja de texto del nombre
                    phone.clear(); // Limpia la caja de texto del teléfono
                    Navigator.of(context)
                        .pop(); // Cierra la ventana del cuadro de diálogo
                  } else {
                    // Si falta por llenar alguno de los dos campos
                    ScaffoldMessenger.of(context).showSnackBar(
                      // Muestra un mensaje emergente
                      SnackBar(
                        // Configuración del mensaje flotante
                        content: Text('Faltan datos'), // Texto de advertencia
                        behavior: SnackBarBehavior
                            .floating, // Posición flotante sobre la UI
                      ), // Fin de SnackBar
                    ); // Fin de showSnackBar
                  } // Fin del bloque if-else
                }, // Fin de onPressed
                child: Text('Aceptar'), // Etiqueta del botón
              ), // Fin de TextButton
            ), // Fin de Center
          ], // Fin de actions
        ); // Fin de AlertDialog
      }, // Fin de builder
    ); // Fin de showDialog
  } // Fin de la función _agregar

  final List<Item> items =
      []; // Lista vacía para almacenar los objetos 'Item' agregados
  @override // Sobrescribe el método de construcción de la interfaz
  Widget build(BuildContext context) {
    // Método build principal
    return Scaffold(
      // Estructura base de la pantalla
      appBar: AppBar(
        // Barra superior de navegación
        backgroundColor: Colors.blueGrey, // Color de fondo gris azulado
        title: Text(
          n,
        ), // Muestra el nombre del usuario en el título de la barra
        actions: [
          // Acciones ubicadas a la derecha de la barra superior
          Padding(
            // Aplica margen derecho al botón
            padding: EdgeInsets.only(right: 18), // Margen de 18px a la derecha
            child: Center(
              // Centra verticalmente el botón
              child: Container(
                // Contenedor envolvente del botón
                child: ElevatedButton.icon(
                  // Botón elevado con un icono
                  onPressed:
                      _agregar, // Ejecuta la función _agregar al presionar
                  label: Icon(Icons.add), // Muestra el icono de suma/agregar
                ), // Fin de ElevatedButton.icon
              ), // Fin de Container
            ), // Fin de Center
          ), // Fin de Padding
        ], // Fin de actions
      ), // Fin de AppBar
      body: Center(
        // Centra el contenedor de la lista en el cuerpo
        child: Container(
          // Contenedor para el ListView
          child: ListView.builder(
            // Constructor dinámico eficiente para renderizar la lista
            itemCount: items.length, // Define la cantidad total de filas según la lista 'items'
            itemBuilder: (context, index) => Card(
              // Genera una tarjeta para cada posición
              child: ListTile(
                // Estructura estándar de fila con imagen, título y subtítulo
                leading: Image.asset(
                  "assets/contacto.png",
                ), // Muestra una imagen local de contacto al inicio
                title: Text(
                  items[index].name,
                ), // Muestra el nombre del contacto según el índice
                subtitle: Text(
                  items[index].numero,
                ), // Muestra el teléfono del contacto según el índice
                onTap: () {
                  // Evento que se ejecuta al tocar cualquier elemento de la lista
                  ScaffoldMessenger.of(context).showSnackBar(
                    // Muestra una barra emergente con información
                    SnackBar(
                      // Configuración del mensaje
                      content: Text(
                        'Indice seleccionado: $index',
                      ), // Muestra la posición tocada
                      behavior: SnackBarBehavior
                          .floating, // Hace flotar el mensaje sobre la UI
                    ), // Fin de SnackBar
                  ); // Fin de showSnackBar
                }, // Fin de onTap
              ), // Fin de ListTile
            ), // Fin de Card
          ), // Fin de ListView.builder
        ), // Fin de Container
      ), // Fin de Center
    ); // Fin de Scaffold
  } // Fin del método build
} // Fin de la clase lis
