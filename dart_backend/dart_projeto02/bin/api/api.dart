import 'package:shelf/shelf.dart';

import '../infra/dart_injector/dependency_injector.dart';
import '../infra/security/security_service.dart';

abstract class Api {
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false});
  
  Handler createHandler({
    required Handler router,
    List<Middleware>? middlewares,
    bool isSecurity = false,
  }) {
    final _di = DependencyInjector();
    middlewares ??= [];
    if(isSecurity){
      var _securityService = _di.get<SecurityService>();
      middlewares.addAll([
        _securityService.authorization,
        _securityService.verifiJwt,
      ]);
    }
    var pipe = Pipeline();
    middlewares.forEach((element) => pipe = pipe.addMiddleware(element));
    return pipe.addHandler(router);
  }
}