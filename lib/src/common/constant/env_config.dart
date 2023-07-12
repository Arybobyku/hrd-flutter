/// Build-time environment configs
///
/// These values are coming from `--dart-define` command arguments
class EnvConfig {
  //TODO: remove ip
  String ip = "192.168.1.4";
  static const env = String.fromEnvironment(
    'ENV',
    defaultValue: 'DEV',
  );
  static const envTag = String.fromEnvironment(
    'ENV_TAG',
    defaultValue: '',
  );
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://192.168.1.13/hrd-web/public/api'
  );

  static get uriBaseUrl => Uri.parse(baseUrl);

  static const defaultMsTimeout = int.fromEnvironment(
    'DEFAULT_MS_TIMEOUT',
    defaultValue: 16000,
  );

  static const sentryDsn = String.fromEnvironment(
    'SENTRY_DSN',
    defaultValue: '',
  );
}
