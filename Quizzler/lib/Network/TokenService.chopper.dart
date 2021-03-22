// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TokenService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$TokenService extends TokenService {
  _$TokenService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TokenService;

  @override
  Future<Response<dynamic>> getSessionToken(String command) {
    final $url = '/api_token.php';
    final $params = <String, dynamic>{'command': command};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> resetSessionToken(String command, String token) {
    final $url = '/api_token.php';
    final $params = <String, dynamic>{'command': command, 'token': token};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
