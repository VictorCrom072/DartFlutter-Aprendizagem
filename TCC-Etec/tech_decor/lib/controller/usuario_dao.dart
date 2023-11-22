
import 'package:tech_decor/database/teste_mysql_client.dart';

class UsuarioDao {
  Future<bool> logar(String uNome, String uSenha,) async {
    var conn = await MysqlConfig().conectar();
    await conn.connect();
    var result = await conn.execute("select * from usuarios where nome = '$uNome' and senha = '$uSenha';");
    await conn.close();
    if(result.numOfRows > 0) return true;
    else return false;
  }
  Future<bool> inserir(String uNome, String uEmail, String uSenha,) async {
    var conn = await MysqlConfig().conectar();
    await conn.connect();
    var result = await conn.execute("insert into usuarios values (default, '$uNome', '$uEmail', '$uSenha', default);");
    await conn.close();
    if(result.affectedRows > BigInt.zero) return true;
    else return false;
  }
}