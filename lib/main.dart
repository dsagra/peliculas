import 'package:flutter/material.dart';
import 'package:peliculas/paginas/pagina_principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PaginaPrincipal(),
    );
  }
}
