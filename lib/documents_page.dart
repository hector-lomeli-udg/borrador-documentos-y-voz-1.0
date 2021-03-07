import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:file_picker/file_picker.dart';


class DocumentsPage extends StatelessWidget {
  //const DocumentsPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DOCUMENTOS'),
      ),
      body: MyDocumentsPage(),
    );
  }
}

class MyDocumentsPage extends StatefulWidget {
  //MyDocumentsPage({Key key}) : super(key: key);

  @override
  _MyDocumentsPageState createState() => _MyDocumentsPageState();
}

class _MyDocumentsPageState extends State<MyDocumentsPage> {
  
  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
              child: file != null ? PDF.file(file, height: 700, width: 500,) : 
              RaisedButton(
                onPressed: () async{
                  File pickedFile = await FilePicker.getFile(
                    //allowedExtensions: ['pdf','png'],
                    allowedExtensions: ['pdf'],
                    type: FileType.custom
                  );
                  setState(() {
                    file = pickedFile;
                  });
                },
                child: Text('Grab a file'),
              ) ,
          ),
          RaisedButton(
            child: Text('ATRAS'),
            onPressed: () {
               Navigator.pop(context);
               speak('Inicio');
            }
          ),
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