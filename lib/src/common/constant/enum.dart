enum AuthMetaType {
  signIn,
  signOut,
  forgotPassword,
  resetPassword,
}

/// * offline : data / wifi disconnect
/// * online : data / wifi online + connect to api success
/// * offlineNotConnected : data / wifi online but fail to connect to api
///
enum ConnectionStatus {
  offline,
  online,
  undefined,
}