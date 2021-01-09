import 'package:flutter/foundation.dart';

import 'http_service.dart';

import '../../utils/enums/endpoint_enum.dart';

class ApiService {
  final String _baseUrl =
      "https://mvzo6ikn6kswnep-db202010291259.adb.me-dubai-1.oraclecloudapps.com/ords/lms/";
  final HttpService _httpService = HttpService();

  ApiService._();

  /// Singleton instance of a ApiService class.
  static final instance = ApiService._();

  String getUrl(EndPoint endPoint, String id) => _baseUrl + endPoint.getPath(id: id);

  Stream<List<T>> collectionStream<T>({
    @required EndPoint endPoint,
    String id = '',
    @required T Function(Map<String, dynamic> data) builder,
  }) async* {
    final String url = getUrl(endPoint, id);

    //Entire map of response
    final data = await _httpService.get(url);

    //Items of table as json
    final List<dynamic> items = data['items'];

    //Streaming the deserialized objects
    yield items.map((dataMap) => builder(dataMap)).toList();
  }

  Stream<T> documentStream<T>({
    @required EndPoint endPoint,
    @required String id,
    @required T Function(Map<String, dynamic> data) builder,
  }) async* {
    final String url = getUrl(endPoint, id);

    //Table item map
    final data = await _httpService.get(url);

    //Streaming the deserialized objects
    yield builder(data);
  }

  Future<T> documentFuture<T>({
    @required EndPoint endPoint,
    @required String id,
    @required T Function(Map<String, dynamic> data) builder,
  }) async {
    final String url = getUrl(endPoint, id);
    //Table item map
    final data = await _httpService.get(url);

    //Items of table as json
    final List<dynamic> items = data['items'];

    //Returning the promise of the deserialized objects
    return builder(items[0]);
  }

  Future<T> setData<T>({
    @required EndPoint endPoint,
    String id = '',
    @required Map<String, dynamic> data,
    @required T Function(Map<String, dynamic> response) builder,
  }) async {
    final String url = getUrl(endPoint, id);

    //Entire map of response
    final dataMap = await _httpService.post(url, data);

    return builder(dataMap);
  }

  Future<T> updateData<T>({
    @required EndPoint endPoint,
    String id = '',
    @required Map<String, dynamic> data,
    @required T Function(Map<String, dynamic> response) builder,
  }) async {
    final String url = getUrl(endPoint, id);

    //Entire map of response
    final dataMap = await _httpService.put(url, data);

    return builder(dataMap);
  }

  Future<T> deleteData<T>({
    @required EndPoint endPoint,
    String id = '',
    @required T Function(Map<String, dynamic> response) builder,
  }) async {
    final String url = getUrl(endPoint, id);

    //Entire map of response
    final dataMap = await _httpService.delete(url);

    return builder(dataMap);
  }
}
