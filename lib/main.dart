// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_karla/NovoCadastroScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', //titulo da aplicaçao
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple), //cor principal do nosso aplicativo
        useMaterial3: true,
      ),
      home: const MyHomePage(
          title: 'Agenda'), //onde nosso aplicativo vai abrir no inicio
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _novoContato() {
    // passando por parâmetro exibe telas como uma pilha usando a transição correta animações,Para navegar até uma nova tela
    Navigator.of(context).push(
      MaterialPageRoute(
        // nessa builder vamos chamar a nova pagina
        builder: (context) => const NovoCadastroScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //esqueleto da nossa pagina
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        //menu sanduíche
        child: ListView(
          //filho do menu. ListView será um array
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: Icon(
                  Icons.account_circle_sharp,
                  size: 70,
                ),
                accountName: Text('Karla Cianfa'),
                accountEmail: Text('karla-cianfa@hotmail.com')),
            ListTile(
              //funcionalidade: add um text e uma ação
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {}, //esse parametro espera uma função
            ),
            ListTile(
              //funcionalidade: add um text e uma ação
              leading: Icon(Icons.account_circle_sharp),
              title: Text('Contatos'),
              onTap: () {}, //esse parametro espera uma função
            ),
            ListTile(
              //funcionalidade: add um text e uma ação
              leading: Icon(Icons.add),
              title: Text('Marcadores'),
              onTap: () {}, //esse parametro espera uma função
            ),
            Divider(), // como se fosse um <hr>
            ListTile(
              //funcionalidade: add um text e uma ação
              leading: Icon(Icons.block),
              title: Text('Bloqueados'),
              onTap: () {}, //esse parametro espera uma função
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _novoContato,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
