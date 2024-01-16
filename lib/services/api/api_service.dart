import 'package:attendsync/services/api/i_http_client.dart';

class ApiService {
  final IHttpClient _httpClient;

  ApiService(this._httpClient);

  Future<dynamic> login(String url, dynamic body) async {
    return await _httpClient.post(url, body);
  }

  Future<dynamic> register(String url, dynamic body) async {
    return await _httpClient.post(url, body);
  }
  
  Future<dynamic> fetchData(String url) async {
    return await _httpClient.get(url);
  }

  Future<dynamic> postData(String url, dynamic body) async {
    return await _httpClient.post(url, body);
  }
}
