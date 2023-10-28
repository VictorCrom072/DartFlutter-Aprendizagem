import '../../utils/custom_env.dart';
import 'security_service.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class SecurityServiceImp implements SecurityService<JWT>{
  @override
  Future<String> generateJWT(String userId) async {
    var jwt = JWT({
      'iat': DateTime.now().microsecondsSinceEpoch,
      'userId': userId,
      'roles': ['admin', 'user'] 
    });
    String key = await CustomEnv.get(key: 'jwt_key');
    String token = jwt.sign(SecretKey(key));
    return token;
  }

  @override
  validateJWT(String token) {
    // TODO: implement validateJWT
    throw UnimplementedError();
  }

} 