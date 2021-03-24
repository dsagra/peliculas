import 'package:dio/dio.dart';
import 'package:peliculas/clases/pelicula.dart';

import 'api_key.dart';

Future<List<Pelicula>> obtenerPeliculas(String buscar) async {
  String url = 'https://api.themoviedb.org/3/search/movie?query=' +
      buscar +
      '&language=es&api_key=' +
      apiKey;
  try {
    Response response = await Dio().get(url);
    final json = response.data['results'];

    var listadoDePeliculas =
        json.map((peliculaJson) => Pelicula.fromJson(peliculaJson)).toList();

    return List<Pelicula>.from(listadoDePeliculas);
  } catch (e) {
    return [];
  }
}
