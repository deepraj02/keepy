/// Interface for the Auth Services.

abstract class IAuthService {
  Future<void> logIn(String email, String password);
  Future<void> signOut();
  Future<void> signUp(String email, String password, String userName);
}
