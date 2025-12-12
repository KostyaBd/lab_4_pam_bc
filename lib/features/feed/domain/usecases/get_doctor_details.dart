import '../entities/doctor_details.dart';
import '../repositories/feed_repository.dart';

class GetDoctorDetails {
  final FeedRepository repo;
  GetDoctorDetails(this.repo);

  Future<DoctorDetails> call() => repo.getDoctorDetails();
}
