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
  Future<JWT?> validateJWT(String token) async {
    String key = await CustomEnv.get(key: 'jwt_key');
    try{
      return JWT.verify(token, SecretKey(key));
    } on JWTInvalidException{
      return null;
    } on JWTExpiredException{
      return null;
    } on JWTNotActiveException{
      return null;
    } on JWTUndefinedException{
      return null;
    } catch(e){
      return null;
    }
  }

} 