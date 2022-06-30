import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

@JsonSerializable()
class Resource extends Equatable {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantoneValue;

  const Resource({
    required this.id,
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
