import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:section_5/models/resource_model.dart';

part 'resource_service.g.dart';

@RestApi(
  baseUrl: 'https://reqres.in/api/',
)
abstract class ResourceService {
  factory ResourceService(Dio dio, {String baseUrl}) = _ResourceService;

  @GET('{resource}')
  Future<List<Resource>> getResources();
}
