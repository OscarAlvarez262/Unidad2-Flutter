import 'package:flutter/material.dart'; // Importa componentes UI de Material Design

import 'datos.dart'; // Importa el archivo local 'datos.dart' para tener acceso a la clase modelo Item

class Lista extends StatefulWidget {
  // Widget con estado (StatefulWidget) llamado Lista
  final List<Item>
  items; // Propiedad inmutable para recibir la lista de productos
  const Lista({
    super.key,
    required this.items,
  }); // Constructor con parámetro obligatorio 'items'
  @override // Sobrescribe el método para vincular la clase de estado
  State<StatefulWidget> createState() => _ListaState(); // Crea y devuelve la instancia de _ListaState
} // Fin de la clase Lista

class _ListaState extends State<Lista> {
  // Clase privada que gestiona el estado y la UI de Lista
  @override // Sobrescribe el método de construcción de la interfaz
  Widget build(BuildContext context) {
    // Método build principal
    final items = widget
        .items; // Referencia local a la lista 'items' recibida desde el widget
    return Scaffold(
      // Estructura base de la pantalla
      appBar: AppBar(
        // Barra superior de navegación
        title: Text('Lista de productos'), // Título de la barra
        backgroundColor: Colors.lightGreen, // Fondo de color verde claro
      ), // Fin de AppBar
      body:
          items
              .isEmpty // Comprueba si la lista de productos está vacía
          ? Center(
              // Si está vacía, muestra un mensaje centrado
              child: Text(
                'Lista vacia',
                style: TextStyle(color: Colors.red),
              ), // Mensaje en color rojo
            ) // Fin del bloque verdadero (lista vacía)
          : Center(
              // Si contiene elementos, muestra la lista centrada
              child: Padding(
                // Aplica un margen exterior a la lista
                padding: EdgeInsets.all(
                  15,
                ), // Margen de 15px en todos los bordes
                child: ListView.builder(
                  // Constructor dinámico eficiente para la lista
                  itemCount:
                      items.length, // Cantidad total de productos a renderizar
                  itemBuilder: (context, index) {
                    // Función que construye cada elemento según su índice
                    final item = items[index]; // Obtiene el producto en la posición 'index'
                    return Card(
                      // Tarjeta envolvente para cada fila
                      margin: EdgeInsets.all(
                        5,
                      ), // Margen externo de 5px alrededor de la tarjeta
                      child: ListTile(
                        // Fila interactiva con icono, título, subtítulo y botón
                        leading: Icon(
                          Icons.production_quantity_limits,
                        ), // Icono decorativo al inicio
                        title: Text(item.producto), // Nombre del producto
                        subtitle: Column(
                          // Organiza la descripción y precio verticalmente
                          children: [
                            // Widgets hijos del subtítulo
                            Text(item.descripcion), // Descripción del producto
                            Text(
                              'Precio:${item.precio}',
                            ), // Muestra el precio del producto
                          ], // Fin de children de Column
                        ), // Fin de Column
                        trailing: IconButton(
                          // Botón con icono situado al final de la fila
                          onPressed: () {
                            // Evento al presionar el botón eliminar
                            setState(() {
                              // Actualiza el estado y redibuja la pantalla
                              //print('Eliminar $index'); // Comentario con código de pruebas
                              items.removeAt(index); // Elimina el elemento de la lista en la posición 'index'
                            }); // Fin de setState
                          }, // Fin de onPressed
                          icon: Icon(
                            Icons.delete,
                          ), // Icono de papelera de reciclaje
                          color: Colors
                              .red, // Color rojo para el icono de eliminación
                        ), // Fin de IconButton
                      ), // Fin de ListTile
                    ); // Fin de Card
                  }, // Fin de itemBuilder
                ), // Fin de ListView.builder
              ), // Fin de Padding
            ), // Fin del bloque falso (lista con elementos)
    ); // Fin de Scaffold
  } // Fin del método build
} // Fin de la clase _ListaState
