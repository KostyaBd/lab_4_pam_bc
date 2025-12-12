import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/action_item.dart';

part 'action_item_model.g.dart';

@JsonSerializable()
class ActionItemModel {
  final String title;
  final String image;

  const ActionItemModel({
    required this.title,
    required this.image,
  });

  factory ActionItemModel.fromJson(Map<String, dynamic> json) =>
      _$ActionItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActionItemModelToJson(this);

  ActionItem toEntity() => ActionItem(
    title: title,
    image: image,
  );
}
