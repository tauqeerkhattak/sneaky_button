import 'package:flutter/material.dart';

import 'ui/home/home.dart';

void main() {
  runApp(const SneakyButtonApp());
}

class SneakyButtonApp extends StatelessWidget {
  const SneakyButtonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
