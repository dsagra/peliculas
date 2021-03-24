import 'package:flutter/material.dart';
import 'package:peliculas/paginas/pagina_busqueda_resultados.dart';
import 'package:peliculas/paginas/pagina_principal.dart';
import '../clases/pelicula.dart';

class PantallaDeBusqueda extends StatefulWidget {
  @override
  _PantallaDeBusquedaState createState() => _PantallaDeBusquedaState();
}

class _PantallaDeBusquedaState extends State<PantallaDeBusqueda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Buscar una pelicula'),
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
      body: PantallaBuscar(),
    );
  }
}

class PantallaBuscar extends StatefulWidget {
  PantallaBuscar({Key key}) : super(key: key);

  @override
  _PantallaBuscarState createState() => _PantallaBuscarState();
}

class _PantallaBuscarState extends State<PantallaBuscar> {
  String buscar = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          TextField(
            onChanged: (valor) {
              buscar = valor;
            },
            decoration: InputDecoration(
              hintText: 'Ingrese pelicula a buscar',
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PaginaBusquedaResultados(buscar)),
            ),
            child: Text('Buscar'),
          ),
        ],
      ),
    );
  }
}
