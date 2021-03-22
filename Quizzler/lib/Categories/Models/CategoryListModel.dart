import 'package:json_annotation/json_annotation.dart';

part 'CategoryListModel.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryListModel {
  /// The root level List Model contains only a list
  ///  that populates a model of type CategoryModel
  @JsonKey(name: 'trivia_categories')
  List<CategoryModel> triviaCategories;

  // The default condstructor
  CategoryListModel({this.triviaCategories});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, CategorylistModel
  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListModelToJson(this);
}

@JsonSerializable()
class CategoryModel {
  /// Category ID
  @JsonKey(required: true, name: 'id')
  int categoryId;

  // Category Name
  @JsonKey(required: true, name: 'name')
  String categoryName;

  @JsonKey(ignore: true)
  String categoryImageUrl = '';

  // The default constructor
  CategoryModel({this.categoryId, this.categoryName});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, CategorylistModel
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
