/// Build-time environment configs
///
/// These values are coming from `--dart-define` command arguments
class EnvConfig {
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
  );

  static get uriBaseUrl => Uri.parse(baseUrl);

  static const defaultMsTimeout = int.fromEnvironment(
    'DEFAULT_MS_TIMEOUT',
    defaultValue: 30000,
  );

  static const sentryDsn = String.fromEnvironment(
    'SENTRY_DSN',
    defaultValue: '',
  );
}
