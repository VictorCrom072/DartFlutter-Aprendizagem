import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Crom_072")
        ),
        body: PaginaInicial(),
      ),
    );
  }

}

class PaginaInicial extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Clica Aqui"),
        onPressed: (){
          mostrarAlerta(context);
        },
      ),
    );
  }
  
  void mostrarAlerta(context) {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(content: Text("Olá mundo!!!"));
      }
    );
  }
}