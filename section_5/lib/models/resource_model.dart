import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

@JsonSerializable()
class Resource extends Equatable {
  final int? id;

  final String name;

  final int year;

  final String color;

  @JsonKey(name: 'pantone_value')
  final String pantoneValue;

  const Resource({
    this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        year,
        color,
        pantoneValue,
      ];

  @override
  bool get stringify => true;
}

@JsonSerializable()
class ResourcePagingResponse extends Equatable {
  final int page;

  @JsonKey(name: 'per_page')
  final int perPage;

  final int total;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  final List<Resource> data;

  const ResourcePagingResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory ResourcePagingResponse.fromJson(Map<String, dynamic> json) =>
      _$ResourcePagingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResourcePagingResponseToJson(this);

  @override
  List<Object?> get props => [
        page,
        perPage,
        total,
        totalPages,
        data,
      ];

  @override
  bool get stringify => true;
}
