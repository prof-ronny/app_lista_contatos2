
import 'package:app_lista_contatos/api/contato_adapter.dart';
import 'package:app_lista_contatos/model/contato.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  var txtNome = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtEmail = TextEditingController();
  var txtEndereco = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contato'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: TextField(
                controller: txtNome,
                style: TextStyle(

                ) ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome'
                ) ,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: TextField(
                controller: txtEmail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email'
                ) ,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: TextField(
                controller: txtTelefone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Telefone'
                ) ,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: TextField(
                controller: txtEndereco,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Endereco'
                ) ,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: ElevatedButton(
                  onPressed: () async {
                    var contato = Contato(
                      nome: txtNome.text,
                      email: txtEmail.text,
                      endereco: txtEndereco.text,
                      telefone: txtTelefone.text,
                      foto: '#'
                    );
                    showAboutDialog(context: context,children: [Text("Ok")]);
                    await cadastrarContato(contato);



                  },
                  child: Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
