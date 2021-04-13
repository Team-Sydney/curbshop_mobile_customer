import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

class UserAgent extends http.BaseClient {
  final http.Client _client;

  UserAgent(this._client);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers['User-Agent'] = 'CustomerApp [${Platform.operatingSystem}]';
    return _client.send(request);
  }
}
