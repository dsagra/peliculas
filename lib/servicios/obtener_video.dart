import 'package:dio/dio.dart';
import 'package:peliculas/clases/video_pelicula.dart';

import 'api_key.dart';

Future<VideoPelicula> obtenerVideo(int id) async {
  String url = 'https://api.themoviedb.org/3/movie/' +
      id.toString() +
      '/videos?api_key=' +
      apiKey +
      '&language=es';
  try {
    Response response = await Dio().get(url);
    final json = response.data['results'];
    var listadoDePeliculas = json
        .map((peliculaJson) => VideoPelicula.fromJson(peliculaJson))
        .toList();

    return listadoDePeliculas[0];
  } catch (e) {
    return VideoPelicula(key: '');
  }
}
