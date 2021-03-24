import 'package:flutter/material.dart';
import 'package:peliculas/clases/pelicula_detalle.dart';
import 'package:peliculas/clases/video_pelicula.dart';
import 'package:peliculas/paginas/pagina_principal.dart';
import 'package:peliculas/paginas/pantalla_busqueda.dart';
import 'package:peliculas/servicios/obtener_detalle_pelicula.dart';
import 'package:peliculas/servicios/obtener_video.dart';
import 'package:peliculas/widgets/lista_de_peliculas.dart';
import 'package:peliculas/widgets/titulo_principal.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../clases/pelicula.dart';

class PantallaDetallePelicula extends StatelessWidget {
  PantallaDetallePelicula({Key key, this.pelicula}) : super(key: key);

  Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    //Future<VideoPelicula> videoKey = obtenerVideo(pelicula);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(pelicula.title),
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
      body: FutureBuilder<PeliculaDetalle>(
        future: obtenerDetallePelicula(pelicula),
        builder: (context, snapshot) => snapshot.data != null
            ? verPeliculaDetalle(snapshot.data)
            //Text(snapshot.data.key)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class verPeliculaDetalle extends StatelessWidget {
  verPeliculaDetalle(PeliculaDetalle peliculaDetalle) {
    this.peliculaDetalle = peliculaDetalle;
  }

  PeliculaDetalle peliculaDetalle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/home_fondo_detalle.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            FutureBuilder<VideoPelicula>(
              future: obtenerVideo(peliculaDetalle.id),
              builder: (context, snapshot2) => snapshot2.data != null
                  ? mostrarVideo(snapshot2.data.key)
                  : Center(child: CircularProgressIndicator()),
            ),
            TituloPrincipal(peliculaDetalle.title),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  '${peliculaDetalle.originalTitle} (Titulo original)',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text('${peliculaDetalle.voteAverage.toString()} / 10'),
                    ],
                  ),
                  Text(
                      '${peliculaDetalle.releaseDate.substring(0, 4)} - Duracion: ${peliculaDetalle.runTime} minutos'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                peliculaDetalle.overview,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.justify,
              ),
            ),
            TituloPrincipal('Peliculas similares'),
            ListaDePeliculas('${peliculaDetalle.id}/similar'),
          ],
        ),
      ),
    );
  }

  mostrarVideo(String key) {
    if (key == '') {
      return FadeInImage(
        image: NetworkImage(
            "https://image.tmdb.org/t/p/w500/${peliculaDetalle.backdropPath}"),
        placeholder: AssetImage("images/foto_error2.jpg"),
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(
            "images/foto_error2.jpg",
          );
        },
      );
    } else {
      YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: key,
        flags: YoutubePlayerFlags(
          autoPlay: false,
        ),
      );

      return YoutubePlayer(
        controller: _controller,
        liveUIColor: Colors.amber,
      );
    }
  }
}
