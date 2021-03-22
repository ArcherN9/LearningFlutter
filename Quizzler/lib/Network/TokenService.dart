import "dart:async";
import 'package:chopper/chopper.dart';

part "TokenService.chopper.dart";

@ChopperApi(baseUrl: "/api_token.php")
abstract class TokenService extends ChopperService {
  // helper methods that help you instantiate your service
  static TokenService create([ChopperClient client]) => _$TokenService(client);

  @Get()
  Future<Response> getSessionToken(@Query('command') String command);

  @Get()
  Future<Response> resetSessionToken(
      @Query('command') String command, @Query('token') String token);
}
