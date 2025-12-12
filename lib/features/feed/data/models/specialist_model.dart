import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/specialist.dart';

part 'specialist_model.g.dart';

@JsonSerializable()
class SpecialistModel {
  final int id;
  final String name;
  final String speciality;
  final double rating;
  final bool available;
  final String image;

  const SpecialistModel({
    required this.id,
    required this.name,
    required this.speciality,
    required this.rating,
    required this.available,
    required this.image,
  });

  factory SpecialistModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialistModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialistModelToJson(this);

  Specialist toEntity() => Specialist(
    id: id,
    name: name,
    speciality: speciality,
    rating: rating,
    available: available,
    image: image,
  );
}
