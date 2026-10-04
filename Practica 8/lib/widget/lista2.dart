import 'package:flutter/material.dart'; // Importa componentes UI de Material Design

class Lista2 extends StatefulWidget {
  // Widget con estado (StatefulWidget) llamado Lista2
  @override // Sobrescribe el método para vincular la clase de estado
  State<StatefulWidget> createState() {
    // Crea el estado asociado al widget
    return Clase2(); // Devuelve la instancia de la clase que gestiona el estado
  } // Fin de createState
} // Fin de la clase Lista2

class Item {
  // Clase modelo para representar cada producto de la lista
  final String titulo; // Propiedad inmutable para el nombre del producto
  final String subtitulo; // Propiedad inmutable para el precio del producto
  Item(
    this.titulo,
    this.subtitulo,
  ); // Constructor que inicializa los valores del producto
} // Fin de la clase Item

class Clase2 extends State<Lista2> {
  // Clase que gestiona el estado y la UI de Lista2
  TextEditingController producto =
      new TextEditingController(); // Controlador para el campo del nombre
  TextEditingController Precio =
      new TextEditingController(); // Controlador para el campo del precio

  final List<Item> items = [
    // Lista inicial con datos de prueba
    Item('Jabon', '\$120.00'), // Instancia de Item para Jabon
    Item('Agua', '\$10.00'), // Instancia de Item para Agua
    Item('Sal', '\$20.00'), // Instancia de Item para Sal
  ]; // Fin de la lista inicial

  void _MostrarDatos(String nombre, String precioindex) {
    // Función para abrir un cuadro de diálogo detallado
    print(nombre + precioindex); // Imprime los datos en la consola
    showDialog(
      // Muestra el diálogo modal en pantalla
      context: context, // Contexto necesario para posicionar la alerta
      builder: (BuildContext context) {
        // Constructor de la vista del cuadro de diálogo
        return Dialog(
          // Ventana emergente personalizada
          backgroundColor: Colors.transparent, // Fondo transparente para aplicar bordes redondeados
          child: Container(
            // Contenedor del contenido del diálogo
            padding: EdgeInsets.all(24), // Margen interno alrededor del diálogo
            decoration: BoxDecoration(
              // Estilos para la caja flotante
              color: Colors.white, // Fondo blanco para la tarjeta
              borderRadius: BorderRadius.circular(
                15,
              ), // Bordes redondeados de 15px
            ), // Fin de decoration
            child: Column(
              // Organiza los elementos del diálogo en columna
              mainAxisSize:
                  MainAxisSize.min, // Ajusta el alto al contenido mínimo
              children: [
                // Lista de elementos del cuadro de diálogo
                Container(
                  // Contenedor circular para el icono
                  width: 100, // Ancho de 100px
                  height: 100, // Alto de 100px
                  decoration: BoxDecoration(
                    // Estilo del círculo de fondo
                    color: const Color.fromARGB(
                      255,
                      238,
                      238,
                      238,
                    ), // Color gris claro de fondo
                    shape: BoxShape.circle, // Forma circular
                  ), // Fin de decoration
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.blue,
                    size: 40,
                  ), // Icono de bolsa de compras
                ), // Fin de Container del icono
                SizedBox(height: 10), // Espaciador vertical de 10px
                Text(
                  nombre,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ), // Muestra el nombre en negrita
                SizedBox(height: 10), // Espaciador vertical de 10px
                Text(
                  // Muestra el precio en negrita
                  precioindex, // Texto con el precio
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ), // Estilo en negrita
                ), // Fin de Text del precio
                // ignore: avoid_unnecessary_containers
                Container(
                  // Contenedor para el botón de cierre
                  child: SizedBox(
                    // Fuerza el ancho completo del botón
                    width: double.infinity, // Ocupa todo el ancho disponible
                    child: ElevatedButton(
                      // Botón para cerrar el diálogo
                      onPressed: () {
                        // Evento al presionar el botón
                        Navigator.pop(
                          context,
                        ); // Cierra la ventana emergente actual
                      }, // Fin de onPressed
                      child: Text(
                        // Etiqueta del botón
                        'Cerrar', // Texto del botón
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ), // Texto en negrita
                      ), // Fin de Text
                    ), // Fin de ElevatedButton
                  ), // Fin de SizedBox
                ), // Fin de Container
              ], // Fin de children
            ), // Fin de Column
          ), // Fin de Container
        ); // Fin de Dialog
      }, // Fin de builder
    ); // Fin de showDialog
  } // Fin de _MostrarDatos

  void _agregar() {
    // Función para añadir un nuevo producto a la lista
    String pd = producto.text; // Guarda el texto del campo producto
    String pc = Precio.text; // Guarda el texto del campo precio
    if (pd.isNotEmpty && pc.isNotEmpty) {
      // Verifica que ambos campos tengan texto
      setState(() {
        // Notifica los cambios para redibujar la UI
        items.insert(
          0,
          Item(pd, '\$$pc'),
        ); // Inserta el nuevo ítem al inicio de la lista
      }); // Fin de setState
      producto.clear(); // Limpia la caja de texto del producto
      Precio.clear(); // Limpia la caja de texto del precio
      ScaffoldMessenger.of(context).showSnackBar(
        // Muestra una notificación emergente abajo
        SnackBar(
          // Configuración del mensaje
          content: Text(
            'Numero agregado',
          ), // Texto indicando que se agregó el ítem
          behavior:
              SnackBarBehavior.floating, // Hace flotar la barra sobre la UI
        ), // Fin de SnackBar
      ); // Fin de showSnackBar
    } else {
      // Si alguna caja de texto está vacía
      ScaffoldMessenger.of(context).showSnackBar(
        // Muestra advertencia al usuario
        SnackBar(
          // Configuración del mensaje de error
          content: Text(
            'Completa los datos',
          ), // Mensaje pidiendo completar los campos
          behavior:
              SnackBarBehavior.floating, // Hace flotar la barra sobre la UI
        ), // Fin de SnackBar
      ); // Fin de showSnackBar
    } // Fin del bloque if-else
  } // Fin de _agregar

  @override // Sobrescribe el método de construcción de la interfaz
  Widget build(BuildContext context) {
    // Método build principal
    return Scaffold(
      // Estructura base de la pantalla
      appBar: AppBar(
        // Barra superior de la aplicación
        backgroundColor: Colors.indigoAccent, // Color azul índigo de la barra
        title: Text(
          // Título principal de la barra
          'Practica de listas', // Texto del título
          style: TextStyle(color: Colors.white), // Texto en color blanco
        ), // Fin de Text
        actions: [
          // Acciones o widgets ubicados a la derecha de la barra
          Padding(
            // Margen para el contador
            padding: EdgeInsets.only(right: 18), // Espacio de 18px a la derecha
            child: Center(
              // Centra el contador verticalmente
              child: Container(
                // Caja decorada con la cantidad de productos
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ), // Margen interno horizontal y vertical
                decoration: BoxDecoration(
                  // Estilos de la etiqueta contadora
                  color: Colors.white, // Fondo blanco para resaltar
                  borderRadius: BorderRadius.circular(
                    5,
                  ), // Esquinas redondeadas
                ), // Fin de decoration
                child: Text(
                  // Texto que muestra la cantidad de ítems
                  '${items.length} Productos', // Interpolación con la cantidad total de la lista
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ), // Texto en negrita
                ), // Fin de Text
              ), // Fin de Container
            ), // Fin de Center
          ), // Fin de Padding
        ], // Fin de actions
      ), // Fin de AppBar
      body: Padding(
        // Aplica margen externo al cuerpo
        padding: const EdgeInsets.all(8.0), // Margen exterior de 8px
        child: Padding(
          // Segundo nivel de margen interno
          padding: const EdgeInsets.all(8.0), // Margen interno de 8px
          child: Column(
            // Organiza el formulario y la lista verticalmente
            children: [
              // Elementos dentro del cuerpo principal
              Container(
                // Contenedor superior para la tarjeta del formulario
                width: double.infinity, // Ocupa todo el ancho
                child: Card(
                  // Tarjeta envolvente para los campos de entrada
                  elevation: 8, // Sombra proyectada por la tarjeta
                  shape: RoundedRectangleBorder(
                    // Define la forma del borde
                    borderRadius: BorderRadiusGeometry.circular(
                      2,
                    ), // Bordes redondeados leves
                  ), // Fin de shape
                  child: Column(
                    // Organiza las cajas de texto y el botón
                    children: [
                      // Lista de widgets del formulario
                      TextField(
                        // Campo de entrada para el producto
                        controller:
                            producto, // Conecta con el controlador 'producto'
                        decoration: InputDecoration(
                          // Configuración visual de la entrada
                          label: Text(
                            'Escribe el producto',
                          ), // Etiqueta flotante del campo
                        ), // Fin de InputDecoration
                      ), // Fin de TextField
                      TextField(
                        // Campo de entrada para el precio
                        controller:
                            Precio, // Conecta con el controlador 'Precio'
                        decoration: InputDecoration(
                          // Configuración visual de la entrada
                          label: Text(
                            'Escribe el Precio',
                          ), // Etiqueta flotante del campo
                        ), // Fin de InputDecoration
                      ), // Fin de TextField
                      Container(
                        // Contenedor envolvente para el botón
                        width:
                            double.infinity, // Expande el botón horizontalmente
                        child: ElevatedButton.icon(
                          // Botón con icono
                          onPressed: _agregar, // Ejecuta la función _agregar al hacer clic
                          label: Text('Agregar'), // Etiqueta del botón
                        ), // Fin de ElevatedButton.icon
                      ), // Fin de Container
                    ], // Fin de children del formulario
                  ), // Fin de Column
                ), // Fin de Card
              ), // Fin de Container
              SizedBox(
                height: 20,
              ), // Separador vertical de 20px entre formulario y lista
              Expanded(
                // Expande el ListView para ocupar el espacio vertical restante
                child: Container(
                  // Contenedor para la lista de productos
                  width: double.infinity, // Ocupa todo el ancho disponible
                  child: ListView.builder(
                    // Constructor dinámico eficiente para listas
                    itemCount:
                        items.length, // Define cuántos elementos se construirán
                    itemBuilder: (context, index) => Card(
                      // Construye una tarjeta para cada posición
                      child: ListTile(
                        // Fila interactiva reutilizable de la lista
                        leading: Icon(
                          Icons.add_alert,
                        ), // Icono al inicio de la fila
                        title: Text(
                          items[index].titulo,
                        ), // Nombre del producto según el índice
                        subtitle: Text(
                          items[index].subtitulo,
                        ), // Precio del producto según el índice
                        trailing: Icon(
                          Icons.airline_seat_flat_angled_outlined,
                        ), // Icono al final de la fila
                        onTap: () {
                          // Evento al tocar la fila entera
                          _MostrarDatos(
                            // Llama a la función para ver los detalles
                            items[index].titulo, // Envía el título actual
                            items[index].subtitulo, // Envía el precio actual
                          ); // Fin de _MostrarDatos
                        }, // Fin de onTap
                      ), // Fin de ListTile
                    ), // Fin de Card
                  ), // Fin de ListView.builder
                ), // Fin de Container
              ), // Fin de Expanded
            ], // Fin de children de la columna principal
          ), // Fin de Column
        ), // Fin de Padding
      ), // Fin de Padding
    ); // Fin de Scaffold
  } // Fin del método build
} // Fin de la clase Clase2
