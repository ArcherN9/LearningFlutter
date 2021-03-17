import "dart:async";

import 'package:Quizzler/Categories/Models/CategoryListModel.dart';

import 'package:chopper/chopper.dart';

part "CategoryService.chopper.dart";

@ChopperApi(baseUrl: "/api_category.php")
abstract class CategoryService extends ChopperService {
  // helper methods that help you instantiate your service
  static CategoryService create([ChopperClient client]) =>
      _$CategoryService(client);

  @Get()
  Future<Response> getCategories();
}
