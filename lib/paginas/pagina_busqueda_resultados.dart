import 'package:flutter/material.dart';
import 'package:peliculas/paginas/pagina_principal.dart';
import 'package:peliculas/paginas/pantalla_busqueda.dart';
import 'package:peliculas/widgets/lista_de_peliculas_busqueda.dart';

import 'package:peliculas/widgets/titulo_principal.dart';

class PaginaBusquedaResultados extends StatelessWidget {
  PaginaBusquedaResultados(String buscar) {
    this.buscar = buscar;
  }
  String buscar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Busqueda'),
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
                  TituloPrincipal('Busqueda: $buscar'),
                  ListaDePeliculas(buscar),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
