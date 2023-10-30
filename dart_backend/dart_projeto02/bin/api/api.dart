import 'package:shelf/shelf.dart';

abstract class Api {
  Handler getHandler();
  
  Handler createHandler({
    required Handler router,
    List<Middleware>? middlewares,
  }) {
    middlewares ??= [];
    var pipe = Pipeline();
    middlewares.forEach((element) => pipe = pipe.addMiddleware(element));
    return pipe.addHandler(router);
  }
}