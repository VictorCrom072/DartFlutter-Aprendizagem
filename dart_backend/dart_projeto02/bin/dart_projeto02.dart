
import 'package:shelf/shelf.dart';

import 'api/noticia_api.dart';
import 'api/login_api.dart';
import 'infra/custom_server.dart';
import 'infra/middleware.interception.dart';
import 'infra/security/security_service_imp.dart';
import 'services/noticia_service.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile('.env');
  var _securityService = SecurityServiceImp();
  var cascadeHandler = Cascade()
    .add(LoginApi(_securityService).getHandler())
    .add(BlogApi(NoticiaService()).getHandler(
      middlewares: [
        _securityService.authorization,
        _securityService.verifiJwt,
      ]
    ))
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
