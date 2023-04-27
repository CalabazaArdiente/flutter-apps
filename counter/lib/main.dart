import 'package:counter/views/views.dart';
import 'package:flutter/material.dart';

void main(app) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 43, 1, 71),
      ),
      home: const CounterView(),
    );
  }
}
