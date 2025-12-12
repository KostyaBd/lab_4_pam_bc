import 'package:equatable/equatable.dart';

class Specialist extends Equatable {
  final int id;
  final String name;
  final String speciality;
  final double rating;
  final bool available;
  final String image;

  const Specialist({
    required this.id,
    required this.name,
    required this.speciality,
    required this.rating,
    required this.available,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, speciality, rating, available, image];
}
