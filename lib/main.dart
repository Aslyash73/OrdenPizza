import 'package:flutter/material.dart';
import 'widgets/welcome.dart';
import 'widgets/ordenPizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Principal(),
        '/ordenPizza': (context) => const OrdenPizza(),
      },
    );
  }
}
