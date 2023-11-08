import 'database/mysql_config.dart';

void main() async {
  var conn = await MysqlConfig().conectar();
  var results = await conn.query('select * from usuarios;');
  results = await conn.query('select * from usuarios;');
  print(results);
}
