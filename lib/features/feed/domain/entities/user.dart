import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String location;
  final String profileImage;

  const User({
    required this.name,
    required this.location,
    required this.profileImage,
  });

  @override
  List<Object?> get props => [name, location, profileImage];
}
