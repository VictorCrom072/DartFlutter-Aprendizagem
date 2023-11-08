import '../database/mysql_config.dart';
import '../models/usuario.dart';
import 'dao_config.dart';

class UsuarioDao implements DaoConfig<Usuario>{
  @override
  Future create(Usuario value) {
    throw UnimplementedError();
  }

  @override
  Future delete(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Usuario> find(int id) async {
    String cmd = 'select * from usuarios where id = $id;';
    var conn = await MysqlConfig().conectar();
    var result = await conn.query(cmd);
    result = await conn.query(cmd);
    return Usuario.fromMap(result.first.fields);
  }

  @override
  Future<List<Usuario>> findAll() async {
    String cmd = 'select * from usuarios;';
    var conn = await MysqlConfig().conectar();
    var results = await conn.query(cmd);
    results = await conn.query(cmd);
    return results.map((e) => Usuario.fromMap(e.fields)).toList();
  }

  @override
  Future update(Usuario value) {
    throw UnimplementedError();
  }

}