
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class Serverhandler {
  Handler get handler {
    final router = Router();
    router.get('/', (Request request){
      return Response(200, body: 'Primeira rota');
    });
    router.get('/ola/mundo', (Request request, String usuario){
      return Response.ok(headers: {'Content-Type': 'text/plain'}, 'Olá Mundo $usuario!!');
    });
    //HTTP GET
    //http://localhost:8080/query?nome=Crom&idade=18
    router.get('/query', (Request request){
      String? nome = request.url.queryParameters['nome'];
      String? idade = request.url.queryParameters['idade'];
      return Response.ok(headers: {'Content-Type': 'text/plain'}, 'Query eh: $nome, $idade');
    });
    return router;
  }
}