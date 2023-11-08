import 'package:mysql1/mysql1.dart';

class MysqlConfig {

  Future<MySqlConnection> conectar(){
    return MySqlConnection.connect(
      ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: '12345678',
        db: 'dart'
      )
    );
  }
}