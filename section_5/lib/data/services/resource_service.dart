import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:section_5/models/common_responses.dart';
import 'package:section_5/models/resource_model.dart';

part 'resource_service.g.dart';

@RestApi()
abstract class ResourceService {
  factory ResourceService(Dio dio, {String baseUrl}) = _ResourceService;

  @GET('{resource}')
  Future<ResourcePagingResponse> getResources({
    @Query('page') int? page,
    @Query('per_page') int perPage = 100,
  });

  @POST('{resource}')
  Future<Resource> createResource(@Body() Resource resource);

  @PUT('{resource}/{id}')
  Future<UpdateResponse> updateResource(
    @Path('id') int id,
    @Body() Resource resource,
  );
}
