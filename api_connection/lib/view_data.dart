import 'dart:convert';

import 'package:api_connection/update_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class View_data extends StatefulWidget {
  const View_data({super.key});

  @override
  State<View_data> createState() => _View_dataState();
}

class _View_dataState extends State<View_data> {
  List usuarios=[];
  Future<void> getUsuarios () async {
    String uri = "http://10.0.2.2/api_connection/usuario_selecionar.php";
    try{
      var res = await http.post(Uri.parse(uri));
      setState(() {
        usuarios = jsonDecode(jsonEncode(res.body));
      });
    }
    catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    getUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Usuários"),
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, i){
          return Card(
            margin: const EdgeInsets.all(15),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>update_record(
                  usuarios[i]["nome_usu"],
                  usuarios[i]["email_usu"],
                  usuarios[i]["senha_usu"],
                )));
              },
              leading: const Icon(
                CupertinoIcons.heart,
                 color: Colors.red,
              ),
              title: Text(usuarios[i]["nome_usu"]),
              subtitle: Text(usuarios[i]["email_usu"]),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  deletarUsuario(usuarios[i]['id_usu']);
                },
              ),
            ),
          );
        }),
    );
  }

  Future<void> deletarUsuario(String id) async {
    String uri = "http://10.0.2.2/api_connection/usuario_selecionar.php";
    try{
      var res = await http.post(
        Uri.parse(uri),
        body: {
          'id': id
        }
      );
      var response = jsonDecode(jsonEncode(res.body));
      if(response[1] == true){
        print("Usuário deletado");
        getUsuarios();
      }
      else{
        print("Erro ao deletar usuário");
      }
    }
    catch(e){
      print(e);
    }
  }
}
