import 'package:json_annotation/json_annotation.dart';

part 'TokenModel.g.dart';

@JsonSerializable(explicitToJson: true)
class TokenModel {
  @JsonKey(name: 'response_code')
  int responseCode;

  @JsonKey(name: 'response_message', defaultValue: '')
  String responseMessage;

  @JsonKey(name: 'token', defaultValue: '')
  String token;

  TokenModel({this.responseCode, this.responseMessage, this.token});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, CategorylistModel
  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
