// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialistModel _$SpecialistModelFromJson(Map<String, dynamic> json) =>
    SpecialistModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      speciality: json['speciality'] as String,
      rating: (json['rating'] as num).toDouble(),
      available: json['available'] as bool,
      image: json['image'] as String,
    );

Map<String, dynamic> _$SpecialistModelToJson(SpecialistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'speciality': instance.speciality,
      'rating': instance.rating,
      'available': instance.available,
      'image': instance.image,
    };
