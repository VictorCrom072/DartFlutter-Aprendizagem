import 'dart:convert';

import 'package:api_connection/view_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  Future<void> inserirUsuario() async {
    if(nome.text == "" || email.text == "" || senha.text == ""){
      print("Preencha todos os campos");
    }
    else{
      String uri = "http://localhost/api_connection/usuario_inserir.php";
      //try{
        var res = await http.post(Uri.parse(uri), body: {
          "name": nome.text,
          "email": email.text,
          "senha": senha.text,
        });
        var response = jsonDecode(res.body);
        if(response["sucess"] == true){
          print("Usuário inserido");
        }
        else{
          print("Erro ao inserir usuário");
        }
      //}
      //catch(e){
        //print(e);
      //}
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crom api_connection',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastrar Usuário'),
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
                onPressed: inserirUsuario,
                child: const Text('Inserir'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Builder(
                builder: (cntext){
                  return ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>View_data()));
                    },
                    child: const Text("Ver Usuários"),
                  );
                } 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
