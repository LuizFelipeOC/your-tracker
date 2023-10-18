class GetUrlUtils {
  String _getUrl() {
    const envUrl = String.fromEnvironment('url');

    return envUrl;
  }

  String get url => _getUrl();
}
