import 'package:get/get.dart';

import 'package:lab_4_pam_bc/features/feed/domain/entities/doctor_details.dart';
import 'package:lab_4_pam_bc/features/feed/domain/entities/specialist.dart';
import 'package:lab_4_pam_bc/features/feed/domain/usecases/get_doctor_details.dart';

class DoctorController extends GetxController {
  final GetDoctorDetails getDoctorDetails;
  DoctorController(this.getDoctorDetails);

  final selected = Rxn<Specialist>();

  final isLoading = false.obs;
  final error = ''.obs;
  final details = Rxn<DoctorDetails>();
  final selectedTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments;
    if (arg is Specialist) selected.value = arg;
    loadDetails();
  }

  Future<void> loadDetails() async {
    isLoading.value = true;
    error.value = '';
    try {
      details.value = await getDoctorDetails();
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}