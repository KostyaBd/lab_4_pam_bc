import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/feed.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/action_item.dart';
import '../../domain/entities/speciality.dart';
import '../../domain/entities/specialist.dart';

import 'user_model.dart';
import 'action_item_model.dart';
import 'speciality_model.dart';
import 'specialist_model.dart';

part 'feed_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FeedModel {
  final UserModel user;
  final List<ActionItemModel> actions;
  final List<SpecialityModel> specialities;
  final List<SpecialistModel> specialists;

  const FeedModel({
    required this.user,
    required this.actions,
    required this.specialities,
    required this.specialists,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) =>
      _$FeedModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedModelToJson(this);

  Feed toEntity() {
    return Feed(
      user: user.toEntity(),
      actions: actions.map((e) => e.toEntity()).toList(),
      specialities: specialities.map((e) => e.toEntity()).toList(),
      specialists: specialists.map((e) => e.toEntity()).toList(),
    );
  }
}
