import 'package:mysql1/mysql1.dart';

import '../../utils/custom_env.dart';
import 'db_configuration.dart';

class MySqlDBConfiguration implements DBConfiguration {

  MySqlConnection? _connection;

  @override
  Future<MySqlConnection> get connection async {
    if(_connection == null)
      _connection = await createConnection();
    if(_connection == null)
      throw Exception("Erro => Erro ao criar a conexão!");
    return _connection!;
  }

  @override
  Future<MySqlConnection> createConnection() async {
    return await MySqlConnection.connect(
      ConnectionSettings(
        host: await CustomEnv.get<String>(key: 'db_host'),
        port: await CustomEnv.get<int>(key: 'db_port'),
        user: await CustomEnv.get<String>(key: 'db_user'),
        password: await CustomEnv.get<String>(key: 'db_pass'),
        db: await CustomEnv.get<String>(key: 'db_database')
      )
    );
  }

}