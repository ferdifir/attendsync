import 'dart:convert';
import 'package:attendsync/services/api/i_http_client.dart';
import 'package:http/http.dart' as http;

class HttpClient implements IHttpClient {
  @override
  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return _processResponse(response);
  }

  @override
  Future<dynamic> post(String url, dynamic body) async {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    return _processResponse(response);
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
