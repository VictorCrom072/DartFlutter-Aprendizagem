
import 'dao/usuario_dao.dart';

void main() async {
  var dao = UsuarioDao();
  print(await dao.findAll());
  print(await dao.find(2));
}
