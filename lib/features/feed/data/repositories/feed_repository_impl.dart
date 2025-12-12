import 'package:lab_4_pam_bc/features/feed/domain/entities/feed.dart';
import 'package:lab_4_pam_bc/features/feed/domain/entities/doctor_details.dart';
import 'package:lab_4_pam_bc/features/feed/domain/repositories/feed_repository.dart';
import 'package:lab_4_pam_bc/features/feed/data/datasources/feed_remote_datasource.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedRemoteDataSource remote;

  FeedRepositoryImpl(this.remote);

  @override
  Future<Feed> getFeed() async {
    final model = await remote.getFeed(); // FeedModel
    return model.toEntity();              // Feed
  }

  @override
  Future<DoctorDetails> getDoctorDetails() async {
    final model = await remote.getDoctorDetails(); // DoctorDetailsModel
    return model.toEntity();                       // DoctorDetails
  }
}
