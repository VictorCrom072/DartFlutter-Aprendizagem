import 'package:mysql1/mysql1.dart';
import 'db_config.dart';

class MySqlDBConfiguration implements DBConfiguration {
  MySqlConnection? _connection;

  @override
  Future<MySqlConnection> get connection async{
    if(_connection == null) _connection = await createConnection();
    if(_connection == null) throw Exception('Error DB -> Erro ao Criar Conexão: Verifica direito samerda!');
    return _connection!;
  }

  @override
  Future<MySqlConnection> createConnection() async {
    return await MySqlConnection.connect(
      ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: '12345678',
        db: 'db_api',
      ),
    );
  }
}
