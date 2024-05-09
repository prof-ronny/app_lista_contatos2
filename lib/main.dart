import 'package:app_lista_contatos/api/contato_adapter.dart';
import 'package:app_lista_contatos/model/contato.dart';
import 'package:app_lista_contatos/tela_cadastro.dart';
import 'package:flutter/material.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Contatos',
      initialRoute: '/',
      routes: {
        '/' : (context)=> ListaDeContatos(),
        '/cadastro' : (context)=> TelaCadastro()
      },
    );
  }
}

class ListaDeContatos extends StatefulWidget {
  @override
  State<ListaDeContatos> createState() => _ListaDeContatosState();
}

class _ListaDeContatosState extends State<ListaDeContatos> {
  List<Contato>? listaContatos=null;
  bool carregando = true;
  void CarregaContatos() async {


    setState(() {
      carregando = true;
    });

    var  lista= await getListaContatos();


    setState(() {
      listaContatos= lista;
      carregando = false;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CarregaContatos();
  }




  @override
  Widget build(BuildContext context) {
    // Esta lista pode ser substituída por dados vindos de uma API



    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
      ),
      body: carregando? Center(child: CircularProgressIndicator()):  ListView.builder(
        itemCount: listaContatos?.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(listaContatos?.elementAt(index).foto ?? ""),
                // Para imagens locais, use AssetImage ao invés de NetworkImage
              ),
              title: Text(listaContatos?.elementAt(index).nome??""),
              subtitle: Text(listaContatos?.elementAt(index).telefone??""),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, '/cadastro');
        },
      ),
    );
  }
}
