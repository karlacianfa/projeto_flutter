import 'package:flutter/material.dart';
import 'package:projeto_karla/ContatoEntity.dart';

class NovoCadastroScreen extends StatefulWidget {
  const NovoCadastroScreen();

  @override
  State<NovoCadastroScreen> createState() => _NovoCadastroScreenState();
}

class _NovoCadastroScreenState extends State<NovoCadastroScreen> {
  // obrigatorio para a key do scaffold, usado para validar se no textFormField tem conteúdo
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // instanciando nossa classe contatoentity (instanciando a classe)
  ContatoEntity contatoEntity = ContatoEntity();

  @override
  Widget build(BuildContext context) {
    // Montando o esqueleto da nova página
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Novo Cadastro'),
      ),
      body: Form(
        //child é usada quando haverá apenas um widget, children quando vai haver mais widgets dentro desse widget pai
        key: _formKey, //chave precisa ser instanciada no nosso form
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            margin: EdgeInsets.all(30.0),
            child: Column(children: [
              // o textFormField é como se fosse um input do form
              TextFormField(
                // inicializando com o value da nossa classe instanciada
                // initialValue: contatoEntity.nome, //foi alterado depois porque retornar dessa forma sem ter salvo em um banco de dados estava dando erro
                onChanged: (value) {
                  //value é o valor que está sendo pego no nosso input
                  contatoEntity.nome =
                      value; //então nossa classe contatoEntity.nome.
                },
                decoration: const InputDecoration(
                  hintText: 'Nome',
                ),
                validator: (value) {
                  // tratamento de validação do input
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatório.'; //mensagem de retorno quando o input for nulo ou estiver vazio
                  }
                  return null;
                },
              ),
              TextFormField(
                // initialValue: contatoEntity.email, //foi alterado depois porque retornar dessa forma sem ter salvo em um banco de dados estava dando erro
                onChanged: (value) {
                  //value é o valor que está sendo pego no nosso input
                  contatoEntity.email =
                      value; //então nossa classe contatoEntity.nome.
                },
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value) {
                  // tratamento de validação do input
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatório.'; //mensagem de retorno quando o input for nulo ou estiver vazio
                  }
                  return null;
                },
              ),
              TextFormField(
                // initialValue: contatoEntity.telefone, //foi alterado depois porque retornar dessa forma sem ter salvo em um banco de dados estava dando erro
                onChanged: (value) {
                  //value é o valor que está sendo pego no nosso input
                  contatoEntity.telefone =
                      value; //então nossa classe contatoEntity.nome.
                },
                decoration: const InputDecoration(
                  hintText: 'Telefone',
                ),
                validator: (value) {
                  // tratamento de validação do input
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatório.'; //mensagem de retorno quando o input for nulo ou estiver vazio
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    //aqui pega a nossa chave e faz a validação, para saber se nosso textformfield existe um valor
                    if (_formKey.currentState!.validate()) {
                      // depois que salvar o contato, vamos voltar para a tela anterior
                      // O ideal nesse momento era fazer uma requisição para api para retornar o cadastro recem realizado na exibição
                      // A maneira realizada no exemplo é passando por parametro nossa entidade recem adicionada, apenas passando por paramentro
                      Navigator.pop(context, contatoEntity);
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
