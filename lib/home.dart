import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final TextEditingController _controller = TextEditingController();

List<String> mensagens = [];
String sorteada = "";

void _adicionarfrase() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        mensagens.add(_controller.text);
      });
      _controller.clear();
    };
  }

  void _sortearfrase() {
    if (mensagens.isNotEmpty) {
      final random = Random();
      setState(() {
        sorteada = mensagens[random.nextInt(mensagens.length)];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Frase motivacional de Hoje'),
        leading:
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () { _adicionarfrase(); },
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Frase motivacional de hoje: ', style: TextStyle(fontSize: 15),),
              SizedBox(height: 20),
              Text(
                sorteada, style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
              ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: (){
              _sortearfrase();
            },
            child: Text(
              'Sortear Frase',
              style: TextStyle(color: Colors.white,),
            ),
          ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'digite a frase aqui',
                  border: OutlineInputBorder(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
