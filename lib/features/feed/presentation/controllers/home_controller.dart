import 'package:get/get.dart';
import '../../domain/entities/feed.dart';
import '../../domain/usecases/get_feed.dart';

class HomeController extends GetxController {
  final GetFeed getFeed;
  HomeController(this.getFeed);

  final isLoading = true.obs;
  final error = ''.obs;
  final feed = Rxn<Feed>();
  final searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    error.value = '';
    try {
      feed.value = await getFeed();
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  List get filteredSpecialists {
    final f = feed.value;
    if (f == null) return [];
    final q = searchText.value.trim().toLowerCase();
    if (q.isEmpty) return f.specialists;
    return f.specialists
        .where((s) => s.name.toLowerCase().contains(q) || s.speciality.toLowerCase().contains(q))
        .toList();
  }
}
