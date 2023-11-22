import 'dart:ui';

import 'package:flutter/material.dart';

errorUsuario(BuildContext context, String processo, String executar) {
  Widget voltarButton = TextButton(
    child: const Text(
      "voltar",
      style: TextStyle(
        color: Color.fromARGB(230, 162, 222, 166),
        fontSize: 20
      ),
    ),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.black,
    title: Text(
      "Erro ao $processo!",
      style: TextStyle(
        color: Colors.white
      ),
    ),
    content: Text(
      "$executar",
      style: TextStyle(
        color: Colors.white,
        fontSize: 15
      ),
    ),
    actions: [
      voltarButton,
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