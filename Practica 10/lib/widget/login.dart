import 'package:flutter/material.dart'; // Importa componentes UI de Material Design
import 'package:flutter_application_2/widget/Lista.dart'; // Importa la pantalla destino 'Lista'

class Login extends StatefulWidget {
  // Widget con estado (StatefulWidget) llamado Login
  @override // Sobrescribe el método para vincular la clase de estado
  State<StatefulWidget> createState() {
    // Crea el estado asociado al widget
    return inicio(); // Devuelve la instancia de la clase que gestiona el estado
  } // Fin de createState
} // Fin de la clase Login

class inicio extends State<Login> {
  // Clase que gestiona el estado y la UI de Login
  TextEditingController nombre =
      new TextEditingController(); // Controlador para el campo del nombre
  TextEditingController correo =
      new TextEditingController(); // Controlador para el campo del correo
  TextEditingController contra =
      new TextEditingController(); // Controlador para el campo de la contraseña

  void _validar() {
    // Función para validar los datos del formulario antes de navegar
    String n = nombre.text; // Guarda el texto escrito en la caja de nombre
    String c = correo.text; // Guarda el texto escrito en la caja de correo
    String P = contra.text; // Guarda el texto escrito en la caja de contraseña
    if (n.isNotEmpty && c.isNotEmpty && P.isNotEmpty) {
      // Verifica que ningún campo esté vacío
      if (int.tryParse(P) == null) {
        // Comprueba si la contraseña no es un valor numérico
        ScaffoldMessenger.of(context).showSnackBar(
          // Muestra alerta de contraseña no numérica
          SnackBar(
            // Configuración de la barra emergente
            content: Text(
              'La contrasena no es numero',
            ), // Mensaje de advertencia
            behavior: SnackBarBehavior.floating, // Flota sobre la pantalla
          ), // Fin de SnackBar
        ); // Fin de showSnackBar
      } else {
        // Si la contraseña es numérica
        if ((P.length >= 5 && P.length <= 10) && (n.length >= 3)) {
          // Valida longitud de contraseña (5-10) y nombre (>=3)
          Navigator.pushReplacement(
            // Reemplaza la pantalla actual con la nueva pantalla
            context, // Contexto de la interfaz
            MaterialPageRoute(
              builder: (context) => Lista(Nomb: nombre.text),
            ), // Navega a Lista enviando el nombre
          ); // Fin de pushReplacement
        } else {
          // Si las longitudes de texto no cumplen la regla
          ScaffoldMessenger.of(context).showSnackBar(
            // Muestra alerta de revisión de datos
            SnackBar(
              // Configuración de la barra emergente
              content: Text(
                'Revisa los datos',
              ), // Mensaje pidiendo revisar entradas
              behavior: SnackBarBehavior.floating, // Flota sobre la pantalla
            ), // Fin de SnackBar
          ); // Fin de showSnackBar
        } // Fin del bloque if-else de longitud
      } // Fin del bloque if-else de parseo numérico
    } else {
      // Si falta algún campo por llenar
      ScaffoldMessenger.of(context).showSnackBar(
        // Muestra alerta de datos faltantes
        SnackBar(
          // Configuración de la barra emergente
          content: Text('Falta un dato'), // Mensaje indicando campo incompleto
          behavior: SnackBarBehavior.floating, // Flota sobre la pantalla
        ), // Fin de SnackBar
      ); // Fin de showSnackBar
    } // Fin del bloque if-else principal
  } // Fin de la función _validar

  @override // Sobrescribe el método de construcción de la interfaz
  Widget build(BuildContext context) {
    // Método build principal
    return Scaffold(
      // Estructura base de la pantalla
      body: Center(
        // Centra la tarjeta horizontal y verticalmente
        child: Padding(
          // Aplica un margen exterior a la tarjeta
          padding: EdgeInsetsGeometry.all(
            15,
          ), // Margen de 15px alrededor de la tarjeta
          child: Card(
            // Tarjeta contenedora con elevación y sombra
            elevation: 8, // Sombra proyectada por la tarjeta
            shadowColor: Colors.black, // Color negro para la sombra
            shape: RoundedRectangleBorder(
              // Define la forma de los bordes
              borderRadius: BorderRadiusGeometry.circular(
                15,
              ), // Bordes redondeados de 15px
            ), // Fin de shape
            child: Padding(
              // Aplica un margen interno a los campos del formulario
              padding: EdgeInsetsGeometry.all(
                8,
              ), // Margen de 8px dentro de la tarjeta
              child: Column(
                // Organiza los elementos del formulario en columna
                mainAxisSize: MainAxisSize
                    .min, // Ajusta el alto al contenido mínimo necesario
                children: [
                  // Lista de widgets hijos dentro del formulario
                  Text(
                    // Título del formulario
                    'Ingresa tus credenciales', // Texto del encabezado
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ), // Estilo: tamaño 20 y negrita
                  ), // Fin de Text
                  TextField(
                    // Campo de entrada para el nombre
                    controller: nombre, // Vincula con el controlador 'nombre'
                    decoration: InputDecoration(
                      // Configuración visual de la entrada
                      labelText: 'Nombre', // Etiqueta flotante del campo
                      icon: Icon(Icons.person), // Icono de usuario al inicio
                    ), // Fin de InputDecoration
                  ), // Fin de TextField nombre
                  TextField(
                    // Campo de entrada para el correo
                    controller: correo, // Vincula con el controlador 'correo'
                    decoration: InputDecoration(
                      // Configuración visual de la entrada
                      labelText: 'Correo', // Etiqueta flotante del campo
                      icon: Icon(Icons.email), // Icono de correo al inicio
                    ), // Fin de InputDecoration
                  ), // Fin de TextField correo
                  TextField(
                    // Campo de entrada para la contraseña
                    controller: contra, // Vincula con el controlador 'contra'
                    decoration: InputDecoration(
                      // Configuración visual de la entrada
                      labelText: 'Contrasena', // Etiqueta flotante del campo
                      icon: Icon(
                        Icons.password,
                      ), // Icono de contraseña al inicio
                    ), // Fin de InputDecoration
                  ), // Fin de TextField contraseña
                  ElevatedButton(
                    onPressed: _validar,
                    child: Text('Validar'),
                  ), // Botón que ejecuta la función _validar
                ], // Fin de children
              ), // Fin de Column
            ), // Fin de Padding interno
          ), // Fin de Card
        ), // Fin de Padding externo
      ), // Fin de Center
    ); // Fin de Scaffold
  } // Fin del método build
} // Fin de la clase inicio
