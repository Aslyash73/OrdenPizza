import 'package:flutter/material.dart';

class Rutas extends StatelessWidget {
  const Rutas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina Inicial"),

        centerTitle: true, toolbarHeight: 70, toolbarOpacity: 10,

        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
      ),
      body: Row(children: [
        ElevatedButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/Principal');
          },
          child: const Text('Ordenar'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/OrdenPizza');
          },
          child: const Text('ordenPizza'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red, // Fondo rojo
            onPrimary: Colors.white, // Texto blanco
          ),
        ),
      ]),
    );
  }
}
