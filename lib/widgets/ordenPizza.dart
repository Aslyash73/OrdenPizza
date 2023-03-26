
import 'package:flutter_application_1/llamadas/ordenes.dart';
import 'package:flutter/material.dart';

class OrdenPizza extends StatefulWidget {
  const OrdenPizza({super.key});

  @override
  State<OrdenPizza> createState() => _OrdenPizza();
}

class _OrdenPizza extends State<OrdenPizza> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ordenes;
    String getToppings(){
      String toppings = "";
      for (String e in args.topping) {toppings = "$toppings$e, "; }
      return toppings;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recibo de la orden 🧾"),
        leading: const BackButton(),
      ),
      body: Table(
        border: TableBorder.all(width: 1.0, color: Colors.grey),
        children: [
          TableRow(
            children: [
              TableCell(child: Text("Nombres:", style: const TextStyle(fontWeight: FontWeight.bold),)),
              TableCell(child: Text(args.name)),
            ]
          ),
          TableRow(
            children: [
              TableCell(child: Text("Dirección:", style: const TextStyle(fontWeight: FontWeight.bold),)),
              TableCell(child: Text(args.address)),
            ]
          ),
          TableRow(
            children: [
              TableCell(child: Text("Tamaño de pizza:", style: const TextStyle(fontWeight: FontWeight.bold),)),
              TableCell(child: Text("${args.size} pulgadas")),
            ]
          ),
          TableRow(
            children: [
              TableCell(child: Text("Toppings:", style: const TextStyle(fontWeight: FontWeight.bold),)),
              TableCell(child: Text(getToppings())),
            ]
          ),
          TableRow(
            children: [
              TableCell(child: Text("Total a pagar:", style: const TextStyle(fontWeight: FontWeight.bold),)),
              TableCell(child: Text("💰${args.total}")),
            ]
          ),
        ],
      ),
    );
  }
}

