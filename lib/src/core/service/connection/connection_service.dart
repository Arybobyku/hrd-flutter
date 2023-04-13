part of 'base_connection_service.dart';

class ConnectionService implements BaseConnectionService {
  final Connectivity connectivity;

  ConnectionService({required this.connectivity});

  @override
  Future<bool> canConnect() async {
    final ConnectivityResult connectResult =
        await connectivity.checkConnectivity();
    if (connectResult == ConnectivityResult.none) {
      return false;
    }

    return true;
  }

  @override
  StreamSubscription<ConnectivityResult> Function(
    void Function(ConnectivityResult)?, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) get listen => connectivity.onConnectivityChanged.listen;

}
