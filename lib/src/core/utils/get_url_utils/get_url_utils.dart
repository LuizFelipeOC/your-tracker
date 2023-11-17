class GetUrlUtils {
  String getUrl() {
    const baseUrl = String.fromEnvironment('url');
    return baseUrl;
  }
}
