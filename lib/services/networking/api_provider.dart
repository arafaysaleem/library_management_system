import 'http_service.dart';

import '../../utils/enums/endpoint_enum.dart';

class ApiProvider {
  final String _baseUrl =
      "https://mvzo6ikn6kswnep-db202010291259.adb.me-dubai-1.oraclecloudapps.com/ords/lms/";
  final String _scheme = 'https';

  final HttpService _httpService = HttpService();

  Future<List<dynamic>> getEndPointData(EndPoint endPoint, {id}) async {
    final Uri uri = Uri(
      scheme: _scheme,
      host: _baseUrl,
      path: endPoint.getPath(id: id),
    );
    final data = await _httpService.get(uri);
    return data["items"];
  }
}
