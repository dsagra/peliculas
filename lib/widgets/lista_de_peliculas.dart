import 'package:flutter/material.dart';
import 'package:peliculas/clases/pelicula.dart';
import 'package:peliculas/servicios/obtener_peliculas.dart';
import 'package:peliculas/widgets/pelicula_widget.dart';

class ListaDePeliculas extends StatelessWidget {
  ListaDePeliculas(String tipoDePeliculas) {
    this.tipoDePeliculas = tipoDePeliculas;
  }

  String tipoDePeliculas;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: FutureBuilder<List<Pelicula>>(
        future: obtenerPeliculas(tipoDePeliculas),
        builder: (context, snapshot) => snapshot.data != null
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
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
