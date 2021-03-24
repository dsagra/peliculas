import 'package:dio/dio.dart';
import 'package:peliculas/clases/pelicula.dart';
import 'package:peliculas/clases/pelicula_detalle.dart';

import 'api_key.dart';

Future<PeliculaDetalle> obtenerDetallePelicula(Pelicula pelicula) async {
  String url = 'https://api.themoviedb.org/3/movie/' +
      pelicula.id.toString() +
      '?language=es&api_key=' +
      apiKey;
  try {
    Response response = await Dio().get(url);
    final json = response.data;
    PeliculaDetalle peli = PeliculaDetalle.fromJson(response.data);

    return peli;
  } catch (e) {
    return null;
  }
}
