import 'package:equatable/equatable.dart';
import 'user.dart';
import 'action_item.dart';
import 'speciality.dart';
import 'specialist.dart';

class Feed extends Equatable {
  final User user;
  final List<ActionItem> actions;
  final List<Speciality> specialities;
  final List<Specialist> specialists;

  const Feed({
    required this.user,
    required this.actions,
    required this.specialities,
    required this.specialists,
  });

  @override
  List<Object?> get props => [user, actions, specialities, specialists];
}
