import 'dart:convert';
import 'dart:math';

import 'package:app_lista_contatos/model/contato.dart';
import 'package:http/http.dart' as http;

Future<List<Contato>> getListaContatos() async {
  final response = await http.get(Uri.parse(
      'https://web-euphrs0vk3kk.up-de-fra1-k8s-1.apps.run-on-seenode.com/contatos'));

  if (response.statusCode == 200) {
    List<Contato> minhalista = (json.decode(response.body) as List)
        .map((item) => Contato.fromJson(item))
        .toList();
    return minhalista;
  } else {
    throw Exception("falha ao carregar contatos");
  }
}

Future<Contato> cadastrarContato(Contato contato) async {
  var corpo= json.encode( contato.toJson());
  final response = await http.post(
      Uri.parse(
          'https://web-euphrs0vk3kk.up-de-fra1-k8s-1.apps.run-on-seenode.com/contatos'),
      headers: {"Content-Type": "application/json"},
      body: corpo);
  if (response.statusCode == 201) {
      var contatoResp = Contato.fromJson(json.decode(response.body) as Map<String, dynamic> );
      return contatoResp;

  }
  else
  {
    throw Exception("falha ao cadastrar contatos");
  }
}
