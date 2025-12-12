import '../entities/feed.dart';
import '../entities/doctor_details.dart';

abstract class FeedRepository {
  Future<Feed> getFeed();
  Future<DoctorDetails> getDoctorDetails();
}
