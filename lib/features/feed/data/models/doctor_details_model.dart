import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/doctor_details.dart';

part 'doctor_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DoctorDetailsModel {
  final DoctorModel doctor;
  final AppointmentModel appointment;
  final List<TimingItemModel> timing;
  final List<LocationItemModel> locations;
  final List<String> tabs;

  const DoctorDetailsModel({
    required this.doctor,
    required this.appointment,
    required this.timing,
    required this.locations,
    required this.tabs,
  });

  factory DoctorDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDetailsModelToJson(this);

  DoctorDetails toEntity() {
    return DoctorDetails(
      doctor: doctor.toEntity(),
      appointment: appointment.toEntity(),
      timing: timing.map((e) => e.toEntity()).toList(),
      locations: locations.map((e) => e.toEntity()).toList(),
      tabs: tabs,
    );
  }
}

@JsonSerializable()
class DoctorModel {
  final int id;
  final String name;
  final String speciality;
  final String qualification;
  @JsonKey(name: 'profile_image')
  final String profileImage;
  final double rating;
  @JsonKey(name: 'reviews_count')
  final int reviewsCount;
  @JsonKey(name: 'years_of_experience')
  final int yearsOfExperience;
  @JsonKey(name: 'patients_treated')
  final int patientsTreated;
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;

  const DoctorModel({
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

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);

  Doctor toEntity() => Doctor(
    id: id,
    name: name,
    speciality: speciality,
    qualification: qualification,
    profileImage: profileImage,
    rating: rating,
    reviewsCount: reviewsCount,
    yearsOfExperience: yearsOfExperience,
    patientsTreated: patientsTreated,
    isFavorite: isFavorite,
  );
}

@JsonSerializable()
class AppointmentModel {
  final String type;
  final int fee;
  final String currency;
  final HospitalModel hospital;
  @JsonKey(name: 'available_days')
  final List<AvailableDayModel> availableDays;

  const AppointmentModel({
    required this.type,
    required this.fee,
    required this.currency,
    required this.hospital,
    required this.availableDays,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);

  Appointment toEntity() => Appointment(
    type: type,
    fee: fee,
    currency: currency,
    hospital: hospital.toEntity(),
    availableDays: availableDays.map((e) => e.toEntity()).toList(),
  );
}

@JsonSerializable()
class HospitalModel {
  final String name;
  final String location;
  @JsonKey(name: 'wait_time')
  final String waitTime;
  @JsonKey(name: 'more_clinics')
  final List<MoreClinicModel> moreClinics;

  const HospitalModel({
    required this.name,
    required this.location,
    required this.waitTime,
    required this.moreClinics,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) =>
      _$HospitalModelFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalModelToJson(this);

  Hospital toEntity() => Hospital(
    name: name,
    location: location,
    waitTime: waitTime,
    moreClinics: moreClinics.map((e) => e.toEntity()).toList(),
  );
}

@JsonSerializable()
class MoreClinicModel {
  final String name;
  final String location;

  const MoreClinicModel({required this.name, required this.location});

  factory MoreClinicModel.fromJson(Map<String, dynamic> json) =>
      _$MoreClinicModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoreClinicModelToJson(this);

  MoreClinic toEntity() => MoreClinic(name: name, location: location);
}

@JsonSerializable()
class AvailableDayModel {
  final String day;
  final List<String> slots;

  const AvailableDayModel({required this.day, required this.slots});

  factory AvailableDayModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableDayModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableDayModelToJson(this);

  AvailableDay toEntity() => AvailableDay(day: day, slots: slots);
}

@JsonSerializable()
class TimingItemModel {
  final String day;
  final String time;

  const TimingItemModel({required this.day, required this.time});

  factory TimingItemModel.fromJson(Map<String, dynamic> json) =>
      _$TimingItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimingItemModelToJson(this);

  TimingItem toEntity() => TimingItem(day: day, time: time);
}

@JsonSerializable()
class LocationItemModel {
  final String area;
  final String hospital;
  @JsonKey(name: 'full_address')
  final String fullAddress;

  const LocationItemModel({
    required this.area,
    required this.hospital,
    required this.fullAddress,
  });

  factory LocationItemModel.fromJson(Map<String, dynamic> json) =>
      _$LocationItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationItemModelToJson(this);

  LocationItem toEntity() =>
      LocationItem(area: area, hospital: hospital, fullAddress: fullAddress);
}
