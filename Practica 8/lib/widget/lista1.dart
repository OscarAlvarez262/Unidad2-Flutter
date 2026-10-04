import 'package:flutter/material.dart'; // Importa componentes UI de Material Design

class Lista1 extends StatefulWidget {
  // Widget con estado (StatefulWidget) llamado Lista1
  @override // Sobrescribe el método para vincular la clase de estado
  State<StatefulWidget> createState() {
    // Crea el estado asociado al widget
    return Clase2(); // Devuelve la instancia de la clase que gestiona el estado
  } // Fin de createState
} // Fin de la clase Lista1

class Item {
  // Clase modelo para representar cada elemento de la lista
  final String
  titulo; // Propiedad inmutable para almacenar el nombre del producto
  final String
  subtitulo; // Propiedad inmutable para almacenar el precio o detalle
  Item(
    this.titulo,
    this.subtitulo,
  ); // Constructor para inicializar titulo y subtitulo
} // Fin de la clase Item

class Clase2 extends State<Lista1> {
  // Clase que gestiona el estado y la UI de Lista1
  final List<Item> items = [
    // Lista de objetos 'Item' con los datos a mostrar
    Item('Jabon', '120.00'), // Instancia de Item para Jabon
    Item('Agua', '10.00'), // Instancia de Item para Agua
    Item('Sal', '20.00'), // Instancia de Item para Sal
    Item('Harina', '150.00'), // Instancia de Item para Harina
    Item('Refresco', '200.00'), // Instancia de Item para Refresco
  ]; // Fin de la lista de elementos

  @override // Sobrescribe el método de construcción
  Widget build(BuildContext context) {
    // Construye la interfaz gráfica de la pantalla
    return Scaffold(
      // Estructura base con barra superior y cuerpo
      appBar: AppBar(
        // Barra superior de navegación de la pantalla
        backgroundColor:
            Colors.indigoAccent, // Define el color de fondo azul índigo
        title: Text(
          // Título que se muestra en la barra superior
          'Practica de listas', // Texto del título
          style: TextStyle(
            color: Colors.white,
          ), // Estilo: color de texto blanco
        ), // Fin de Text
      ), // Fin de AppBar
      body: ListView.builder(
        // Construye dinámicamente una lista desplegable optimizada
        itemCount:
            items.length, // Define la cantidad total de elementos a construir
        itemBuilder: (context, index) => Card(
          // Genera una tarjeta (Card) para cada elemento según su índice
          child: ListTile(
            // Estructura estándar de fila con icono, título y subtítulo
            leading: Icon(
              Icons.add_alert,
            ), // Icono ubicado al inicio de la fila
            // title: Text('Lista'), // Comentario con código anterior no utilizado
            // subtitle: Text('Subtitulo de la lista'), // Comentario con código anterior no utilizado
            title: Text(
              items[index].titulo,
            ), // Muestra el título del ítem según la posición 'index'
            subtitle: Text(
              items[index].subtitulo,
            ), // Muestra el subtítulo del ítem según la posición 'index'
            trailing: Icon(
              Icons.airline_seat_flat_angled_outlined,
            ), // Icono ubicado al final de la fila
          ), // Fin de ListTile
        ), // Fin de Card
      ), // Fin de ListView.builder
    ); // Fin de Scaffold
  } // Fin de build
} // Fin de la clase Clase2
