import 'package:equatable/equatable.dart';

class ActionItem extends Equatable {
  final String title;
  final String image;

  const ActionItem({required this.title, required this.image});

  @override
  List<Object?> get props => [title, image];
}
