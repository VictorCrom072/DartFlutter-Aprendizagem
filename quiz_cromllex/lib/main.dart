import 'package:flutter/material.dart';
import 'package:quiz_cromllex/questao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 15,
          shadowColor: const Color.fromARGB(255, 64, 96, 255),
          centerTitle: true,
          title: Container( 
            child: Text("Quiz Espacial 🚀 🌟", 
            style: TextStyle(fontSize: 28, 
            color: Colors.white))
          ) ,
          backgroundColor:  Colors.indigo,
        ),
        body: PaginaInicial(),
      ),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  List q1 = Questao().getQuestoes();
  
  int i = 0;
  int acertos = 0;

  showAlertDialog2(BuildContext context) {
  Widget continuaButton = ElevatedButton(
    child: const Text("Sim"),
    onPressed:  () {
      setState(() {
        i = 0;
        acertos = 0;
      });
      Navigator.pop(context);
    },
  );
  Widget pararButton = ElevatedButton(
    child: const Text("Não"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Fim de jogo paiasso! Você acertou $acertos pontos!"),
    content: const Text("Recomeçar?"),
    actions: [
      continuaButton,
      pararButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  void responder(int indice){
    if(q1[i].indiceRespCorreta == indice){
      ++acertos;
    }
    if(i + 1 >= q1.length){
      showAlertDialog2(context);
    }

    print("indice pergunta $i");
    setState(() {
      if(i + 1 < q1.length){
        i++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Center(
          child: Text(q1[i].pergunta),

        ),
        ElevatedButton(
          onPressed: () => responder(0),
          child: Text(q1[i].respostas[0]),
        ),
        ElevatedButton(
          onPressed: () => responder(1),
          child: Text(q1[i].respostas[1]),
        ),
        ElevatedButton(
          onPressed: () => responder(2),
          child: Text(q1[i].respostas[2]),
        ),
        ElevatedButton(
          onPressed: () => responder(3),
          child: Text(q1[i].respostas[3]),
        ),
        ],
    );
  }
}