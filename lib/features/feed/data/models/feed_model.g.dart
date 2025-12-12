// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedModel _$FeedModelFromJson(Map<String, dynamic> json) => FeedModel(
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  actions: (json['actions'] as List<dynamic>)
      .map((e) => ActionItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  specialities: (json['specialities'] as List<dynamic>)
      .map((e) => SpecialityModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  specialists: (json['specialists'] as List<dynamic>)
      .map((e) => SpecialistModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FeedModelToJson(FeedModel instance) => <String, dynamic>{
  'user': instance.user.toJson(),
  'actions': instance.actions.map((e) => e.toJson()).toList(),
  'specialities': instance.specialities.map((e) => e.toJson()).toList(),
  'specialists': instance.specialists.map((e) => e.toJson()).toList(),
};
