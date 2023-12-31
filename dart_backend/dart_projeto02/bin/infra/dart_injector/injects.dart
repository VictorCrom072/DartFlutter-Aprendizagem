import '../../api/login_api.dart';
import '../../api/noticia_api.dart';
import '../../models/noticia_model.dart';
import '../../services/generic_service.dart';
import '../../services/noticia_service.dart';
import '../database/db_configuration.dart';
import '../database/mysql_db_configuration.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize(){
    var di = DependencyInjector();

    di.register<DBConfiguration>(
      () => MySqlDBConfiguration(),
    );

    di.register<SecurityService>(
      () => SecurityServiceImp(),
    );

    di.register<LoginApi>(
      () => LoginApi(di.get()),
    );

    di.register<GenericService<NoticiaModel>>(
      () => NoticiaService(),
    );

    di.register<BlogApi>(
      () => BlogApi(di.get()),
    );

    return di;
  }
}