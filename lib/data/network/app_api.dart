import 'package:dio/dio.dart';
import 'package:eco_one/app/constants.dart';
import 'package:eco_one/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(AppConstants.loginAPI)
  Future<AuthenticationResponse> login(
    @Field("email") String login,
    @Field("password") String password,
  );
}
