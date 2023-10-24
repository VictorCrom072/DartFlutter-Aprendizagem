import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart';

class CustomServer{
  Future<void> initialize(Handler h) async{
    String address = 'localhost';
    int port = 8080;
    await shelf_io.serve(h, address, port);
    print('Servidor inicializado => http://$address:$port');
  }
}