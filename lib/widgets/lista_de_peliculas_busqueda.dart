import 'package:flutter/material.dart';
import 'package:peliculas/clases/pelicula.dart';
import 'package:peliculas/servicios/obtener_peliculas_busqueda.dart';

import 'package:peliculas/widgets/pelicula_widget.dart';

class ListaDePeliculas extends StatelessWidget {
  ListaDePeliculas(String buscar) {
    this.buscar = buscar;
  }

  String buscar;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: FutureBuilder<List<Pelicula>>(
        future: obtenerPeliculas(buscar),
        builder: (context, snapshot) => snapshot.data != null
            ? ListView.builder(
                itemBuilder: (context, index) => PeliculaWidget(
                  pelicula: snapshot.data[index],
                ),
                itemCount: snapshot.data.length,
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
