import 'package:shelf/shelf.dart';

 class MiddlewareInterception {
  static Middleware get middlerware{
    return createMiddleware(
      responseHandler: (Response res) {
        return res.change(
          headers: {
            'content-type' : 'application/json',
            'xpto' : '123'
          }
        );
      }
    );
  }
}