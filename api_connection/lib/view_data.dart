import 'dart:convert';

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
    String uri = "http://localhost/api_connection/usuario_selecionar.php";
    //try{
      var res = await http.post(Uri.parse(uri));
      setState(() {
        usuarios = jsonDecode(res.body);
      });
    //}
    //catch(e){
      //print(e);
    //}
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
              leading: const Icon(
                CupertinoIcons.heart,
                 color: Colors.red,
              ),
              title: Text(usuarios[i]["nome_usu"]),
              subtitle: Text(usuarios[i]["email_usu"]),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                 onPressed: deletarUsuario,
              ),
            ),
          );
        }),
    );
  }

  Future<void> deletarUsuario() async {}
}
