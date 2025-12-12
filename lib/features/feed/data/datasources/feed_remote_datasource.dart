import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/endpoints.dart';
import '../models/feed_model.dart';
import '../models/doctor_details_model.dart';

abstract class FeedRemoteDataSource {
  Future<FeedModel> getFeed();
  Future<DoctorDetailsModel> getDoctorDetails();
}

class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  final ApiClient client;
  FeedRemoteDataSourceImpl(this.client);

  @override
  Future<FeedModel> getFeed() async {
    try {
      final res = await client.dio.get(Endpoints.feed);
      return FeedModel.fromJson(Map<String, dynamic>.from(res.data as Map));
    } on DioException catch (e) {
      throw ServerException(
        e.message ?? 'Network error',
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<DoctorDetailsModel> getDoctorDetails() async {
    try {
      final res = await client.dio.get(Endpoints.feedDetails);
      return DoctorDetailsModel.fromJson(Map<String, dynamic>.from(res.data as Map));
    } on DioException catch (e) {
      throw ServerException(
        e.message ?? 'Network error',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
