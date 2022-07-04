import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:section_5/models/users/create_user_model.dart';
import 'package:section_5/models/users/login_model.dart';
import 'package:section_5/models/users/user_model.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET('users')
  Future<UserPagingResponse> getUsers({
    @Query('page') int? page,
    @Query('per_page') int perPage = 100,
  });

  @DELETE('users/{id}')
  Future<void> deleteUser(@Path('id') int id);

  @POST('users')
  Future<CreateUserResponse> createUser(@Body() CreateUserRequest request);

  @POST('login')
  Future<TokenResponse> logInUser(@Body() LoginUserRequest request);
}
