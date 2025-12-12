import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lab_4_pam_bc/features/feed/domain/entities/specialist.dart';
import 'package:lab_4_pam_bc/features/feed/presentation/controllers/home_controller.dart';
import 'package:lab_4_pam_bc/features/feed/presentation/pages/doctor_detail_page.dart';
import 'package:lab_4_pam_bc/features/feed/presentation/widgets/action_card.dart';
import 'package:lab_4_pam_bc/features/feed/presentation/widgets/section_header.dart';
import 'package:lab_4_pam_bc/features/feed/presentation/widgets/speciality_chip.dart';
import 'package:lab_4_pam_bc/features/feed/presentation/widgets/specialist_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (c.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (c.error.value.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Eroare: ${c.error.value}', textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  ElevatedButton(onPressed: c.load, child: const Text('Retry')),
                ],
              ),
            );
          }

          final feed = c.feed.value!;
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(feed.user.profileImage),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(feed.user.name,
                              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                          Text(feed.user.location,
                              style: const TextStyle(color: Colors.black54, fontSize: 12)),
                        ],
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))
                  ],
                ),

                const SizedBox(height: 14),

                // Search
                TextField(
                  onChanged: (v) => c.searchText.value = v,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: const Color(0xFFF4F4F4),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Actions
                if (feed.actions.isNotEmpty)
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: feed.actions.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, i) {
                        final a = feed.actions[i];
                        return SizedBox(
                          width: 180,
                          child: ActionCard(title: a.title, imageUrl: a.image),
                        );
                      },
                    ),
                  ),

                const SizedBox(height: 18),

                const SectionHeader(title: "Specialities most relevant to you"),
                const SizedBox(height: 12),

                SizedBox(
                  height: 95,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: feed.specialities.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 14),
                    itemBuilder: (_, i) {
                      final s = feed.specialities[i];
                      return SpecialityChip(name: s.name, iconUrl: s.icon);
                    },
                  ),
                ),

                const SizedBox(height: 18),

                SectionHeader(title: "Specialists", actionText: "View all", onAction: () {}),
                const SizedBox(height: 12),

                SizedBox(
                  height: 210,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: c.filteredSpecialists.cast<Specialist>().map((sp) {
                      return SpecialistCard(
                        name: sp.name,
                        speciality: sp.speciality,
                        imageUrl: sp.image,
                        onTap: () => Get.to(() => const DoctorDetailPage(), arguments: sp),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}