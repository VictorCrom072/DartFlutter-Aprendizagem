import 'package:flutter/material.dart';
import 'package:tech_decor/controller/usuario_dao.dart';
import 'package:tech_decor/pages/home.page.dart';

class SignupPage extends StatelessWidget {
  TextEditingController uNome = TextEditingController();
  TextEditingController uEmail = TextEditingController();
  TextEditingController uSenha = TextEditingController();
  TextEditingController uConfSenha = TextEditingController();
  void cadastrar(BuildContext context) async {
    if(uNome.text == "" || uEmail.text == "" || uSenha.text == "" || uConfSenha.text == ""){
      print("Preencha todos os campos");
    }
    else if(uSenha.text != uConfSenha.text){
      print("Senhas não são iguais");
    }
    else{
      var uDao = UsuarioDao();
      bool result = await uDao.inserir(uNome.text, uEmail.text, uSenha.text);
      if(result == true){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              width: 300,
              height: 300, 
               alignment: Alignment(0.0, 1.15),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/profile-tech-decor.jpg"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: uNome,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome do Usuário",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              controller: uEmail,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "E-mail do Usuário",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              controller: uSenha,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              controller: uConfSenha,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirmar Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color.fromARGB(230, 162, 222, 166),
                    Color.fromARGB(230, 173, 212, 237),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {cadastrar(context);},
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              alignment: Alignment.bottomCenter,
              child: TextButton(
                style: ButtonStyle(
                ),
                child: Text(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontSize: 20,
                  ),
                  "Cancelar",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
