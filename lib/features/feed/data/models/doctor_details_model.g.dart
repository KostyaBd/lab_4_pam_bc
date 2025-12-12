// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDetailsModel _$DoctorDetailsModelFromJson(Map<String, dynamic> json) =>
    DoctorDetailsModel(
      doctor: DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      appointment: AppointmentModel.fromJson(
        json['appointment'] as Map<String, dynamic>,
      ),
      timing: (json['timing'] as List<dynamic>)
          .map((e) => TimingItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      locations: (json['locations'] as List<dynamic>)
          .map((e) => LocationItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tabs: (json['tabs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DoctorDetailsModelToJson(DoctorDetailsModel instance) =>
    <String, dynamic>{
      'doctor': instance.doctor.toJson(),
      'appointment': instance.appointment.toJson(),
      'timing': instance.timing.map((e) => e.toJson()).toList(),
      'locations': instance.locations.map((e) => e.toJson()).toList(),
      'tabs': instance.tabs,
    };

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  speciality: json['speciality'] as String,
  qualification: json['qualification'] as String,
  profileImage: json['profile_image'] as String,
  rating: (json['rating'] as num).toDouble(),
  reviewsCount: (json['reviews_count'] as num).toInt(),
  yearsOfExperience: (json['years_of_experience'] as num).toInt(),
  patientsTreated: (json['patients_treated'] as num).toInt(),
  isFavorite: json['is_favorite'] as bool,
);

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'speciality': instance.speciality,
      'qualification': instance.qualification,
      'profile_image': instance.profileImage,
      'rating': instance.rating,
      'reviews_count': instance.reviewsCount,
      'years_of_experience': instance.yearsOfExperience,
      'patients_treated': instance.patientsTreated,
      'is_favorite': instance.isFavorite,
    };

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      type: json['type'] as String,
      fee: (json['fee'] as num).toInt(),
      currency: json['currency'] as String,
      hospital: HospitalModel.fromJson(
        json['hospital'] as Map<String, dynamic>,
      ),
      availableDays: (json['available_days'] as List<dynamic>)
          .map((e) => AvailableDayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'fee': instance.fee,
      'currency': instance.currency,
      'hospital': instance.hospital,
      'available_days': instance.availableDays,
    };

HospitalModel _$HospitalModelFromJson(Map<String, dynamic> json) =>
    HospitalModel(
      name: json['name'] as String,
      location: json['location'] as String,
      waitTime: json['wait_time'] as String,
      moreClinics: (json['more_clinics'] as List<dynamic>)
          .map((e) => MoreClinicModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HospitalModelToJson(HospitalModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'wait_time': instance.waitTime,
      'more_clinics': instance.moreClinics,
    };

MoreClinicModel _$MoreClinicModelFromJson(Map<String, dynamic> json) =>
    MoreClinicModel(
      name: json['name'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$MoreClinicModelToJson(MoreClinicModel instance) =>
    <String, dynamic>{'name': instance.name, 'location': instance.location};

AvailableDayModel _$AvailableDayModelFromJson(Map<String, dynamic> json) =>
    AvailableDayModel(
      day: json['day'] as String,
      slots: (json['slots'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AvailableDayModelToJson(AvailableDayModel instance) =>
    <String, dynamic>{'day': instance.day, 'slots': instance.slots};

TimingItemModel _$TimingItemModelFromJson(Map<String, dynamic> json) =>
    TimingItemModel(day: json['day'] as String, time: json['time'] as String);

Map<String, dynamic> _$TimingItemModelToJson(TimingItemModel instance) =>
    <String, dynamic>{'day': instance.day, 'time': instance.time};

LocationItemModel _$LocationItemModelFromJson(Map<String, dynamic> json) =>
    LocationItemModel(
      area: json['area'] as String,
      hospital: json['hospital'] as String,
      fullAddress: json['full_address'] as String,
    );

Map<String, dynamic> _$LocationItemModelToJson(LocationItemModel instance) =>
    <String, dynamic>{
      'area': instance.area,
      'hospital': instance.hospital,
      'full_address': instance.fullAddress,
    };
