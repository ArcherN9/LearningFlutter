// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListModel _$CategoryListModelFromJson(Map<String, dynamic> json) {
  return CategoryListModel(
    triviaCategories: (json['trivia_categories'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryListModelToJson(CategoryListModel instance) =>
    <String, dynamic>{
      'trivia_categories':
          instance.triviaCategories?.map((e) => e?.toJson())?.toList(),
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'name']);
  return CategoryModel(
    categoryId: json['id'] as int,
    categoryName: json['name'] as String,
  );
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.categoryId,
      'name': instance.categoryName,
    };
