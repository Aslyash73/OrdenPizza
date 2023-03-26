import 'package:flutter/material.dart';
import 'package:flutter_application_1/llamadas/ordenes.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key});

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  TextEditingController txtNombres = TextEditingController();
  TextEditingController textDireccion = TextEditingController();
//
  bool valuepep = false;
  bool valueceb = false;
  bool valuecha = false;

  String size = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Welcome to CyberPizza 🍕",
            textAlign: TextAlign.center,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: txtNombres,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombres',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: textDireccion,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Direccion',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Tamaño:',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                const Divider(),
                Expanded(
                  child: RadioListTile(
                    title: const Text('8 pulgadas'),
                    value: '8',
                    groupValue: size,
                    onChanged: (value) {
                      setState(() {
                        size = value.toString();
                      });
                    },
                    activeColor: Colors.green, // Agregamos el color activo
                    selected: size == '8', // Agregamos la propiedad selected
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text('10 pulgadas'),
                    value: 10,
                    groupValue: size,
                    onChanged: (value) {
                      setState(() {
                        size = value.toString();
                      });
                    },
                    activeColor: Colors.green, // Agregamos el color activo
                    selected: size == '10',
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text('12 pulgadas'),
                    value: 12,
                    groupValue: size,
                    onChanged: (value) {
                      setState(() {
                        size = value.toString();
                      });
                    },
                    activeColor: Colors.green, // Agregamos el color activo
                    selected: size == '12', 
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Toppings:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Checkbox(
                  value: valuepep,
                  onChanged: (value) {
                    setState(() {
                      valuepep = !valuepep;
                    });
                  },
                ),
                const Text('Pepperoni'),
                Checkbox(
                  value: valueceb,
                  onChanged: (value) {
                    setState(() {
                      valueceb = !valueceb;
                    });
                  },
                ),
                const Text('Cebollas'),
                Checkbox(
                  value: valuecha,
                  onChanged: (value) {
                    setState(() {
                      valuecha = !valuecha;
                    });
                  },
                ),
                const Text('Champiñones'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                 if (txtNombres.text.trim().isEmpty || textDireccion.text.trim().isEmpty || size.trim().isEmpty) {
                    return;
                  } else {
                    double total = 0;
                    List<String> topping = [];

                    if (valuepep) {
                      total = total + 3000;
                      topping.add("Pepperoni");
                    }

                    if (valueceb) {
                      total = total + 3000;
                      topping.add("Cebollas");
                    }

                    if (valuecha) {
                      total = total + 3000;
                      topping.add("champiñones");
                    }

                    switch (size.trim()) {
                      case "8":
                        total = total + 24000;
                        break;
                      case "10":
                        total = total + 28000;
                        break;
                      case "12":
                        total = total + 30000;
                        break;
                    }

                    Navigator.pushNamed
                    (context, '/ordenPizza', arguments: ordenes(txtNombres.text.trim(),
                    textDireccion.text.trim(), size, topping, total));
                  }
                },
                child: const Text('Ordenar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
