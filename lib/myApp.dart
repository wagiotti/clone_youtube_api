import 'package:clone_youtube/customSearchDelegate.dart';
import 'package:clone_youtube/telas/biblioteca.dart';
import 'package:clone_youtube/telas/em_alta.dart';
import 'package:clone_youtube/telas/inicio.dart';
import 'package:clone_youtube/telas/inscricao.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _indiceAtual = 0;
  String _resultado = '';
  @override
  Widget build(BuildContext context) {
    List<Widget> _telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1,
        ),
        title: Image.asset(
          'images/youtube.png',
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                setState(
                  () {
                    _resultado = res;
                  },
                );
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _indiceAtual,
        onTap: (index) {
          setState(() {
            _indiceAtual = index;
          });
        },
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            title: Text('Inicio'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Em Alta'),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            title: Text('Inscrições'),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            title: Text('Biblioteca'),
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
