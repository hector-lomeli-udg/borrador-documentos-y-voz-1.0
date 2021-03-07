import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WriteTextPage extends StatelessWidget {
  //const WriteTextPage({Key key}) : super(key: key);

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESCRIBIR TEXTO'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: textEditingController,
          ),
          RaisedButton(
            child: Text('CLICK PARA LEER LO ESCRITO'),
            onPressed: () => speak(textEditingController.text),
          ),
          RaisedButton(
            child: Text('ATRAS'),
            onPressed: () {
               Navigator.pop(context);
               speak('Inicio');
            }
          )
        ],
      ),
    );
  }
}


void speak(String texto) async{
  final FlutterTts flutterTts = FlutterTts();
  await flutterTts.setLanguage('es-ES');
  await flutterTts.setPitch(1);
  await flutterTts.speak(texto);
}