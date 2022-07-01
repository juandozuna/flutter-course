import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:section_5/models/user_model.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET('users')
  Future<UserPagingResponse> getUsers({
    @Query('page') int? page,
    @Query('per_page') int perPage = 100,
  });
}
