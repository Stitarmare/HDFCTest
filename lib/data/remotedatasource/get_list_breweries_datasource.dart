import 'package:http/http.dart' as http;

class RemoteDataSource {
  Future<http.Response> get(String url) async {
    final response = await http.get(url);
    return response;
  }
}
