import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:documentos_y_voz/documents_page.dart';
import 'package:documentos_y_voz/write_text_page.dart';


void main() {
  runApp(TheApp());
}

class TheApp extends StatelessWidget {
  //const TheApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('INICIO'),
        ),
        body: MyApp(),
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    speak('Inicio');
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RaisedButton(
            child: Text('PAGINA DOCUMENTOS'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DocumentsPage()));
              speak('Documentos');
            }
          ),
          RaisedButton(
            child: Text('PAGINA ESCRIBIT TEXTO'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WriteTextPage()));
              speak('Escribir texto');
            }
          ),
        ],
      )
    );
  }
}


void speak(String texto) async{
  final FlutterTts flutterTts = FlutterTts();
  await flutterTts.setLanguage('es-ES');
  await flutterTts.setPitch(1);
  await flutterTts.speak(texto);
}