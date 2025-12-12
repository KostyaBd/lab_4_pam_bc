import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/network/api_client.dart';
import 'features/feed/data/datasources/feed_remote_datasource.dart';
import 'features/feed/data/repositories/feed_repository_impl.dart';
import 'features/feed/domain/usecases/get_doctor_details.dart';
import 'features/feed/domain/usecases/get_feed.dart';
import 'features/feed/presentation/controllers/home_controller.dart';
import 'features/feed/presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection
    final apiClient = ApiClient();
    final remote = FeedRemoteDataSourceImpl(apiClient);
    final repo = FeedRepositoryImpl(remote);
    final getFeed = GetFeed(repo);
    final getDetails = GetDoctorDetails(repo);

    // injectăm usecase-uri și controller(e) necesare pe Home
    Get.put<GetFeed>(getFeed);
    Get.put<GetDoctorDetails>(getDetails);
    Get.put<HomeController>(HomeController(getFeed));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PAM',
      home: const HomePage(),
    );
  }
}
