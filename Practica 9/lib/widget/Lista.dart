import 'package:flutter/material.dart'; // Importa componentes UI de Material Design

class Lista extends StatefulWidget {
  // Widget con estado (StatefulWidget) llamado Lista
  @override // Sobrescribe el método para vincular la clase de estado
  State<StatefulWidget> createState() {
    // Crea el estado asociado al widget
    return Clase2(); // Devuelve la instancia de la clase que gestiona el estado
  } // Fin de createState
} // Fin de la clase Lista

class Item {
  // Clase modelo para representar cada número de la lista
  final String
  num; // Propiedad inmutable para guardar el valor numérico en texto
  Item(this.num); // Constructor que inicializa la propiedad 'num'
} // Fin de la clase Item

class Clase2 extends State<Lista> {
  // Clase que gestiona el estado y la UI de Lista
  int pa = 0; // Contador de números pares
  int inpa = 0; // Contador de números impares
  TextEditingController numero = TextEditingController(); // Controlador para el campo de entrada del número
  final List<Item> items =
      []; // Lista donde se guardan los objetos 'Item' ingresados
  void _AgregarNumero() {
    // Función que procesa y valida la entrada de números
    String n = numero.text; // Guarda el texto ingresado en la variable 'n'
    if (n.isNotEmpty) {
      // Verifica si el campo de texto no está vacío
      if (int.tryParse(n) != null) {
        // Valida si el texto se puede convertir a un entero
        int nu = int.parse(n); // Convierte la cadena de texto a un valor entero
        setState(() {
          // Notifica los cambios para actualizar la interfaz
          if (nu % 2 == 0) {
            // Evalúa si el número es par (residuo 0 al dividir entre 2)
            pa++; // Incrementa en 1 el contador de pares
          } else {
            // Si no es par, es impar
            inpa++; // Incrementa en 1 el contador de impares
          } // Fin de la validación par/impar
          items.insert(
            0,
            Item(n),
          ); // Agrega el nuevo ítem al inicio de la lista
        }); // Fin de setState
        numero.clear(); // Limpia la caja de texto tras agregar el número
      } else {
        // Si la conversión a entero falla (no es un número)
        ScaffoldMessenger.of(context).showSnackBar(
          // Muestra una alerta informativa emergente
          SnackBar(
            // Configuración del mensaje
            content: Text(
              'No es un numero',
            ), // Texto que indica error de formato
            behavior: SnackBarBehavior.floating, // Flota sobre la pantalla
          ), // Fin de SnackBar
        ); // Fin de showSnackBar
      } // Fin de la validación numérica
    } else {
      // Si la caja de texto estaba vacía
      ScaffoldMessenger.of(context).showSnackBar(
        // Muestra advertencia flotante
        SnackBar(
          // Configuración del mensaje
          content: Text(
            'Agrega un numero',
          ), // Texto solicitando ingresar un número
          behavior: SnackBarBehavior.floating, // Flota sobre la pantalla
        ), // Fin de SnackBar
      ); // Fin de showSnackBar
    } // Fin de la comprobación vacía
  } // Fin de la función _AgregarNumero

  @override // Sobrescribe el método de construcción de la interfaz
  Widget build(BuildContext context) {
    // Método build principal
    return Scaffold(
      // Estructura base de la pantalla
      appBar: AppBar(
        // Barra superior de la aplicación
        backgroundColor: Colors.lightGreen, // Fondo verde claro para la barra
        actions: [
          // Lista de widgets alineados a la derecha
          Padding(
            // Aplica margen alrededor del contador total
            padding: EdgeInsetsGeometry.only(
              right: 18,
            ), // Espacio de 18px a la derecha
            child: Center(
              // Centra verticalmente el contenedor
              child: Container(
                // Caja para el contador total de números
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ), // Margen interno
                decoration: BoxDecoration(
                  // Estilo del contador
                  color: Colors.white, // Fondo blanco
                  borderRadius: BorderRadius.circular(5), // Bordes suavizados
                ), // Fin de decoration
                child: Text(
                  // Muestra el total de elementos
                  '${items.length} Numeros', // Muestra la cantidad total guardada en 'items'
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
        // Primer nivel de margen alrededor del cuerpo
        padding: EdgeInsets.all(8), // Margen de 8px en todos los bordes
        child: Padding(
          // Segundo nivel de margen interno
          padding: EdgeInsets.all(8), // Margen de 8px
          child: Column(
            // Organiza los elementos verticalmente
            children: [
              // Lista de widgets de la columna principal
              Container(
                // Contenedor para la tarjeta del formulario
                width: double.infinity, // Ocupa todo el ancho horizontal
                child: Card(
                  // Tarjeta visual con sombra para la entrada
                  elevation: 8, // Define el nivel de sombra
                  shape: RoundedRectangleBorder(
                    // Define la forma del borde
                    borderRadius: BorderRadiusGeometry.circular(
                      2,
                    ), // Bordes ligeramente redondeados
                  ), // Fin de shape
                  child: Column(
                    // Organiza el TextField y el botón verticalmente
                    children: [
                      // Elementos dentro de la tarjeta
                      TextField(
                        // Campo de entrada para escribir el número
                        controller: numero, // Conectado al controlador 'numero'
                        decoration: InputDecoration(
                          // Configura la etiqueta del campo
                          label: Text(
                            'Escribe el numero',
                          ), // Etiqueta descriptiva
                        ), // Fin de InputDecoration
                      ), // Fin de TextField
                      Container(
                        // Contenedor para expandir el botón
                        width:
                            double.infinity, // Expande el botón horizontalmente
                        child: ElevatedButton(
                          // Botón para ejecutar el guardado
                          onPressed:
                              _AgregarNumero, // Ejecuta la función al presionar
                          child: Text('Agregar'), // Etiqueta del botón
                        ), // Fin de ElevatedButton
                      ), // Fin de Container
                    ], // Fin de children dentro de la tarjeta
                  ), // Fin de Column de la tarjeta
                ), // Fin de Card
              ), // Fin de Container de la tarjeta
              SizedBox(height: 20), // Separador transparente de 20px de alto
              Row(
                // Fila horizontal para mostrar los contadores de pares e impares
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Distribuye los elementos en los extremos
                children: [
                  // Elementos de la fila
                  Padding(
                    // Margen para la caja de pares
                    padding: EdgeInsets.only(right: 18), // Margen derecho
                    child: Center(
                      // Centra el contenedor
                      child: Container(
                        // Caja que contiene el contador de pares
                        padding: EdgeInsets.symmetric(
                          // Margen interno
                          vertical: 8, // 8px arriba y abajo
                          horizontal: 12, // 12px a los lados
                        ), // Fin de EdgeInsets.symmetric
                        decoration: BoxDecoration(
                          // Estilos para la caja de pares
                          color: Colors.white, // Fondo blanco
                          borderRadius: BorderRadius.circular(
                            5,
                          ), // Bordes redondeados
                        ), // Fin de decoration
                        child: Text(
                          // Muestra el total de números pares
                          '${pa} Pares', // Muestra el contador 'pa'
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ), // Texto en negrita
                        ), // Fin de Text
                      ), // Fin de Container
                    ), // Fin de Center
                  ), // Fin de Padding de pares
                  Padding(
                    // Margen para la caja de impares
                    padding: EdgeInsets.only(right: 18), // Margen derecho
                    child: Center(
                      // Centra el contenedor
                      child: Container(
                        // Caja que contiene el contador de impares
                        padding: EdgeInsets.symmetric(
                          // Margen interno
                          vertical: 8, // 8px arriba y abajo
                          horizontal: 12, // 12px a los lados
                        ), // Fin de EdgeInsets.symmetric
                        decoration: BoxDecoration(
                          // Estilos para la caja de impares
                          color: Colors.white, // Fondo blanco
                          borderRadius: BorderRadius.circular(
                            5,
                          ), // Bordes redondeados
                        ), // Fin de decoration
                        child: Text(
                          // Muestra el total de números impares
                          '${inpa} Impares', // Muestra el contador 'inpa'
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ), // Texto en negrita
                        ), // Fin de Text
                      ), // Fin de Container
                    ), // Fin de Center
                  ), // Fin de Padding de impares
                ], // Fin de children de la fila
              ), // Fin de Row
              SizedBox(height: 20), // Separador transparente de 20px de alto
              Expanded(
                // Hace que el contenedor de la lista ocupe el resto del espacio disponible
                child: Container(
                  // Contenedor envolvente de la lista
                  width: double.infinity, // Ocupa todo el ancho disponible
                  child: ListView.builder(
                    // Constructor dinámico eficiente para renderizar la lista
                    itemCount: items.length, // Define la cantidad total de filas según 'items'
                    itemBuilder: (context, index) => Card(
                      // Construye una tarjeta para cada posición
                      child: ListTile(
                        // Fila estándar de lista
                        leading: Icon(
                          Icons.add_alert,
                        ), // Icono ubicado al inicio de la fila
                        title: Text(
                          items[index].num,
                        ), // Muestra el número almacenado en esa posición
                        trailing: Icon(
                          Icons.numbers,
                        ), // Icono de numeral ubicado al final de la fila
                      ), // Fin de ListTile
                    ), // Fin de Card
                  ), // Fin de ListView.builder
                ), // Fin de Container
              ), // Fin de Expanded
            ], // Fin de children de la columna principal
          ), // Fin de Column
        ), // Fin de Padding interno
      ), // Fin de Padding principal
    ); // Fin de Scaffold
  } // Fin del método build
} // Fin de la clase Clase2
