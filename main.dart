import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      title: "Uso de Navigator",
      home: PrimeraPantalla(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PrimeraPantalla extends StatelessWidget {
  var nombre = "";

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Primera Pantalla"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Nombre:"),
                  controller: _controller,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    onPressed: () => _submit(context),
                    child: Text("Enviar"),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  _submit(BuildContext context) {
    final nombre = _controller.text;
    final route = MaterialPageRoute(
        builder: (BuildContext context) => SegundaPantalla(nombre));
    Navigator.of(context).push(route);
  }
}

class SegundaPantalla extends StatelessWidget {
  final String nombre;

  SegundaPantalla(this.nombre);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Pantalla"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Hola: ${nombre}",
                style: TextStyle(fontSize: 30),
              ),
            ),
            RaisedButton(
              onPressed: () => _cerrar(context),
              child: Text("Cerrar"),
            ),
          ],
        ),
      ),
    );
  }

  _cerrar(BuildContext context) {
    Navigator.pop(context);
  }
}
