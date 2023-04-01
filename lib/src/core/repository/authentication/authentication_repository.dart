part of 'base_authentication_repository.dart';

class AuthenticationRepository implements BaseAuthenticationRepository {
  final BaseLocalStorageClient localStorageClient;
  final BaseApiClient apiClient;

  AuthenticationRepository({
    required this.apiClient,
    required this.localStorageClient,
  });

  @override
  Future<String?> getFcmTokenFromServer() {
    // TODO: implement getFcmTokenFromServer
    throw UnimplementedError();
  }

  @override
  Future getProfileFromLocalStorage() {
    // TODO: implement getProfileFromLocalStorage
    throw UnimplementedError();
  }

  @override
  Future<void> removeFcmTokenFromServer() {
    // TODO: implement removeFcmTokenFromServer
    throw UnimplementedError();
  }

  @override
  Future<void> resetLocalStorage() {
    // TODO: implement resetLocalStorage
    throw UnimplementedError();
  }

  @override
  Future<User?> resetPassword({required String userName}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserToLocalStorage(User user) {
    // TODO: implement saveUserToLocalStorage
    throw UnimplementedError();
  }

  @override
  Future<void> setPassword({required String password, required String token}) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }

  @override
  Future<User?> signIn(
      {required String userName, required String password}) async {
    Response response = await apiClient.post(
      Url.baseUrl + Url.login,
      data: {
        'username': userName,
        'password': password,
      },
    );

    return User.fromJson(response.data['data']);
  }

  @override
  Future<User?> signUp({required User user}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future subscribePushNotification(
      {required String fcmToken, required String token}) {
    // TODO: implement subscribePushNotification
    throw UnimplementedError();
  }

  @override
  Future unsubscribePushNotification(
      {required String fcmToken,
      required String iSafeNo,
      required String token}) {
    // TODO: implement unsubscribePushNotification
    throw UnimplementedError();
  }
}
