import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class update_record extends StatefulWidget{
  String nome;
  String email;
  String senha;
  update_record(this.nome, this.email, this.senha);

  @override
  State<StatefulWidget> createState() => _update_recordState();
}

class _update_recordState extends State<update_record>{

  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  Future<void> editarUsuario() async {
    try{
      String uri = "http://10.0.2.2/api_connection/usuario_alterar.php";
      try{
        var res = await http.post(
          Uri.parse(uri),
          headers: {
            'content':'application/json'
          },
          body: {
            "nome": nome.text,
            "email": email.text,
            "senha": senha.text,
          },
        );
        var response = jsonDecode(jsonEncode(res.body));
        if(response[1] == true){
          print("Usuário alterado");
        }
        else{
          print("Erro ao alterar usuário");
        }
      }
      catch(e){
        print(e);
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    nome.text = widget.nome;
    email.text = widget.email;
    senha.text = widget.senha;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Record'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: nome,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Digite o Nome') 
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Digite o E-mail') 
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: senha,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Digite a Senha') 
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                editarUsuario();
              },
              child: const Text('Editar'),
            ),
          ),
        ],
      ),
    );
  }

}