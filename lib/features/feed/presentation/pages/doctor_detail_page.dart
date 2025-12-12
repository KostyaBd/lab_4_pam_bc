import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lab_4_pam_bc/features/feed/domain/usecases/get_doctor_details.dart';
import 'package:lab_4_pam_bc/features/feed/presentation/controllers/doctor_controller.dart';

class DoctorDetailPage extends StatelessWidget {
  const DoctorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Usecase injectat în app.dart
    final usecase = Get.find<GetDoctorDetails>();

    // Creează controller doar dacă nu există deja
    final DoctorController c = Get.put(DoctorController(usecase));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          final d = c.details.value;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // scoatem controllerul ca să nu se “înmulțească” la navigări
                        Get.delete<DoctorController>();
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      c.selected.value?.speciality ?? d?.doctor.speciality ?? '',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    const Spacer(),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.star_border)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
                  ],
                ),

                const SizedBox(height: 10),

                if (c.isLoading.value) const Center(child: CircularProgressIndicator()),

                if (c.error.value.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3F3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Details endpoint error:", style: TextStyle(fontWeight: FontWeight.w900)),
                        const SizedBox(height: 6),
                        Text(c.error.value),
                        const SizedBox(height: 10),
                        ElevatedButton(onPressed: c.loadDetails, child: const Text("Retry")),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                ],

                // Profile (folosește fallback din specialist selectat)
                Row(
                  children: [
                    CircleAvatar(
                      radius: 38,
                      backgroundImage: NetworkImage(
                        c.selected.value?.image ?? d?.doctor.profileImage ?? '',
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            c.selected.value?.name ?? d?.doctor.name ?? '',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            c.selected.value?.speciality ?? d?.doctor.speciality ?? '',
                            style: const TextStyle(color: Colors.teal),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            d?.doctor.qualification ?? '',
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // Restul UI doar dacă avem details
                if (d != null) ...[
                  Text("Rating: ${d.doctor.rating}", style: const TextStyle(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 12),
                  const Text("Timing", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 10),
                  ...d.timing.map((t) => Text("${t.day}: ${t.time}")),
                ],
              ],
            ),
          );
        }),
      ),
    );
  }
}