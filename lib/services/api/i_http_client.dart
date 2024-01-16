abstract class IHttpClient {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, dynamic body);
  // Add other HTTP methods as needed
}
