import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'dart:io';

class RemoteDataSource {
  Future<http.Response> get(String url) async {
    final response = await http.get(url);
    return response;
  }
}
