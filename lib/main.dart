// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_karla/ContatoEntity.dart';
import 'package:projeto_karla/NovoCadastroScreen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

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
  const MyHomePage({required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //está declarando uma lista chamada contatos que só pode conter objetos do tipo ContatoEntity. [] está inicializando vazia
  List<ContatoEntity> contatos = <ContatoEntity>[];

  void _novoContato() async {
    // passando por parâmetro exibe telas como uma pilha usando a transição correta animações,Para navegar até uma nova tela
    //async await foi adicionado depois,para aguardar o retorno do nosso cadastro recem realizado
    ContatoEntity? contatoEntity = await Navigator.of(context).push(
      MaterialPageRoute(
        // nessa builder vamos chamar a nova pagina
        builder: (context) => const NovoCadastroScreen(),
      ),
    );

    //  se for diferente de nulo, vamos adicionar a lista de contatos
    if (contatoEntity != null) {
      // precisa abrir o setState para mudar o estado da nossa pagina, ou seja atualizar e exibir as novas informações
      setState(() {
        contatos.add(contatoEntity);
      });
    }
  }

  Future<void> _launchUrl(telefone) async {
    final Uri _url = Uri(scheme: 'tel', path: telefone);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
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
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              for (ContatoEntity contato in contatos)
                ListTile(
                  title: Text(contato
                      .nome!), // a exclamação é utilizado para indicar ao compilador que você tem certeza de que uma expressão não será nula durante o tempo de execução.
                  subtitle: Text(contato.telefone!),
                  leading: Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
                  trailing: Icon(
                    Icons.phone,
                    size: 35,
                  ),
                  onTap: () {
                    _launchUrl(contato.telefone);
                  },
                )
            ],
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _novoContato,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
