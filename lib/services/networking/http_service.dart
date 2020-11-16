import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'custom_exception.dart';

class HttpService{
  Future<Map<String,dynamic>> get(Uri uri) async {
    Map<String,dynamic> decodedResponseJson;
    try {
      final response = await http.get(uri.toString());
      decodedResponseJson = _response(response, uri);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return decodedResponseJson;
  }

  dynamic _response(http.Response response, uri) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        print(
            'Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        print(
            'Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        print(
            'Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}