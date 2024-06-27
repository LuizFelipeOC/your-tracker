class Env {
  String get url => _url;

  static const String _url = String.fromEnvironment('API_URL');
}
