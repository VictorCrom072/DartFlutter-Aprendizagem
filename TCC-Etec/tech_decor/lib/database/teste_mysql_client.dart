import 'package:mysql_client/mysql_client.dart';

class MysqlConfig {

  Future<MySQLConnection> conectar(){
    return MySQLConnection.createConnection
      (
        host: '10.0.2.2',
        port: 3306,
        userName: 'root',
        password: '12345678',
        databaseName: 'dart'
      );
  }
}