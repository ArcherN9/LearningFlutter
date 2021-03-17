// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CategoryService extends CategoryService {
  _$CategoryService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CategoryService;

  @override
  Future<Response<dynamic>> getCategories() {
    final $url = '/api_category.php';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
