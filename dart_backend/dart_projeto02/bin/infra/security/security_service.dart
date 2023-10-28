abstract class SecurityService<T> {
  Future<String> generateJWT(String userId);
  T? validateJWT(String token);
}