import 'package:mysql1/mysql1.dart';
import 'package:shelf/shelf.dart';

import 'api/noticia_api.dart';
import 'api/login_api.dart';
import 'infra/custom_server.dart';
import 'infra/dart_injector/injects.dart';
import 'infra/database/db_configuration.dart';
import 'infra/middleware.interception.dart';
import 'models/usuario_model.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile('.env');

  final _di = Injects.initialize();

  var conn = await _di.get<DBConfiguration>().connection;
  var results = await conn.query("SELECT * FROM usuarios;");
  results = await conn.query("SELECT * FROM usuarios;");
  print(results);
  for (ResultRow r in results) {
    UsuarioModel usuario = UsuarioModel.fromMap(r.fields);
    print(usuario.toString());
  }

  var cascadeHandler = Cascade()
    .add(_di.get<LoginApi>().getHandler())
    .add(_di.get<BlogApi>().getHandler(isSecurity : true))
    .handler;

  var handler = Pipeline()
    .addMiddleware(logRequests())
    .addMiddleware(MiddlewareInterception.middlerware)
    .addHandler(cascadeHandler);
  await CustomServer()
    .initialize(
      handler: handler,
      address: await CustomEnv.get<String>(key: 'server_address'),
      port: await CustomEnv.get<int>(key: 'server_port'),
    );
}
