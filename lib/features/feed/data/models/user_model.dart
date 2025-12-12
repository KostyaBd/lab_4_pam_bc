import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String location;

  @JsonKey(name: 'profile_image')
  final String profileImage;

  const UserModel({
    required this.name,
    required this.location,
    required this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() => User(
    name: name,
    location: location,
    profileImage: profileImage,
  );
}
