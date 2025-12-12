import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/speciality.dart';

part 'speciality_model.g.dart';

@JsonSerializable()
class SpecialityModel {
  final int id;
  final String name;
  final String icon;

  const SpecialityModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory SpecialityModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialityModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialityModelToJson(this);

  Speciality toEntity() => Speciality(
    id: id,
    name: name,
    icon: icon,
  );
}
