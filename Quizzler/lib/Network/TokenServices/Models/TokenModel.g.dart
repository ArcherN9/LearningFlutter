// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TokenModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) {
  return TokenModel(
    responseCode: json['response_code'] as int,
    responseMessage: json['response_message'] as String ?? '',
    token: json['token'] as String ?? '',
  );
}

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'response_message': instance.responseMessage,
      'token': instance.token,
    };
