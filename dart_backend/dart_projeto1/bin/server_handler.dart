import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class Serverhandler {
  Handler get handler {
    final router = Router();
    router.get('/', (Request request) {
      return Response(200,
          body: '<h1>Primeira rota<h1>',
          headers: {'content-type': 'text/html'});
    });
    router.get('/ola/mundo', (Request request, String usuario) {
      return Response.ok(
          headers: {'Content-Type': 'text/plain'}, 'Olá Mundo $usuario!!');
    });
    //HTTP GET
    //http://localhost:8080/query?nome=Crom&idade=18
    router.get('/query', (Request request) {
      String? nome = request.url.queryParameters['nome'];
      String? idade = request.url.queryParameters['idade'];
      return Response.ok(
          headers: {'Content-Type': 'text/plain'}, 'Query eh: $nome, $idade');
    });
    router.post('/login', (Request request) async {
      var result = await request.readAsString();
      Map json = jsonDecode(result);
      if (json['tipo'] == 'adm' && json['senha'] == 'uDroga') {
        Map result = {'token': '12345678', 'id_user': 1};
        var jsonResponse = jsonEncode(result);
        return Response.ok(
          jsonResponse,
          headers: {
            'content-type' : 'application/json'
          }
        );
      } else
        return Response.ok('loko e soinhádô');
    });
    return router;
  }
}