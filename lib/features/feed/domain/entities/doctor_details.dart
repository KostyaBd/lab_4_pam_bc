import 'package:equatable/equatable.dart';

class DoctorDetails extends Equatable {
  final Doctor doctor;
  final Appointment appointment;
  final List<TimingItem> timing;
  final List<LocationItem> locations;
  final List<String> tabs;

  const DoctorDetails({
    required this.doctor,
    required this.appointment,
    required this.timing,
    required this.locations,
    required this.tabs,
  });

  @override
  List<Object?> get props => [doctor, appointment, timing, locations, tabs];
}

class Doctor extends Equatable {
  final int id;
  final String name;
  final String speciality;
  final String qualification;
  final String profileImage;
  final double rating;
  final int reviewsCount;
  final int yearsOfExperience;
  final int patientsTreated;
  final bool isFavorite;

  const Doctor({
    required this.id,
    required this.name,
    required this.speciality,
    required this.qualification,
    required this.profileImage,
    required this.rating,
    required this.reviewsCount,
    required this.yearsOfExperience,
    required this.patientsTreated,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    speciality,
    qualification,
    profileImage,
    rating,
    reviewsCount,
    yearsOfExperience,
    patientsTreated,
    isFavorite,
  ];
}

class Appointment extends Equatable {
  final String type;
  final int fee;
  final String currency;
  final Hospital hospital;
  final List<AvailableDay> availableDays;

  const Appointment({
    required this.type,
    required this.fee,
    required this.currency,
    required this.hospital,
    required this.availableDays,
  });

  @override
  List<Object?> get props => [type, fee, currency, hospital, availableDays];
}

class Hospital extends Equatable {
  final String name;
  final String location;
  final String waitTime;
  final List<MoreClinic> moreClinics;

  const Hospital({
    required this.name,
    required this.location,
    required this.waitTime,
    required this.moreClinics,
  });

  @override
  List<Object?> get props => [name, location, waitTime, moreClinics];
}

class MoreClinic extends Equatable {
  final String name;
  final String location;

  const MoreClinic({required this.name, required this.location});

  @override
  List<Object?> get props => [name, location];
}

class AvailableDay extends Equatable {
  final String day;
  final List<String> slots;

  const AvailableDay({required this.day, required this.slots});

  @override
  List<Object?> get props => [day, slots];
}

class TimingItem extends Equatable {
  final String day;
  final String time;

  const TimingItem({required this.day, required this.time});

  @override
  List<Object?> get props => [day, time];
}

class LocationItem extends Equatable {
  final String area;
  final String hospital;
  final String fullAddress;

  const LocationItem({
    required this.area,
    required this.hospital,
    required this.fullAddress,
  });

  @override
  List<Object?> get props => [area, hospital, fullAddress];
}
