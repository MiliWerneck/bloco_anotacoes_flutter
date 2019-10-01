import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bloco de notas",
      home: Home(),
      // theme: ThemeData(
      //   primarySwatch: Colors.black,
      // ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _textController = TextEditingController();
  List<String> __blocoDeNotas = [];
  Widget _entryField() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _textController,
          ),
        ),
        
        IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: () {
            if (_textController.text.isNotEmpty)
              setState(() {
                __blocoDeNotas.add(_textController.text);
                _textController.text = '';
              });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bloco de Anotações",
         ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),


      
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          children: <Widget>[
            _entryField(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(),
                child: ListView.builder(
                  itemCount: __blocoDeNotas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(__blocoDeNotas[index]),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}