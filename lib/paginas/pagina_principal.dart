import 'package:flutter/material.dart';
import 'package:peliculas/paginas/pantalla_busqueda.dart';
import 'package:peliculas/widgets/lista_de_peliculas.dart';
import 'package:peliculas/widgets/titulo_principal.dart';

class PaginaPrincipal extends StatefulWidget {
  PaginaPrincipal({Key key}) : super(key: key);
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  String paginaAMostrar = 'popular';
  int indicePagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset('images/logo.png'),
            onPressed: () {},
          ),
          automaticallyImplyLeading: false,
          title: Text('Peliculas'),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.home),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PaginaPrincipal();
                }));
              },
            ),
            IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PantallaDeBusqueda();
                }));
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/home_fondo_gris.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TituloPrincipal('Las más populares'),
                  ListaDePeliculas('popular'),
                  TituloPrincipal('En cartelera'),
                  ListaDePeliculas('now_playing'),
                  TituloPrincipal('Proximamente...'),
                  ListaDePeliculas('upcoming'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
