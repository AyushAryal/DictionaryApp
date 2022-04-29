import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(const DictionaryApp());
}

class DictionaryApp extends StatelessWidget {
  const DictionaryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
