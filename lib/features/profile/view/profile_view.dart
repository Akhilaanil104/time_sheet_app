

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:time_sheet_app/const/router.dart';
import 'package:time_sheet_app/features/profile/provider/profile_provider.dart';


class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(userProfilesProvider.notifier).fetchUserProfiles(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProfiles = ref.watch(userProfilesProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go(AppRouter.home),
        ),
        title: const Text(
          "My Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: userProfiles.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    "Fetching Profile...",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Header
                Container(
                  color: Colors.purple,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.03,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150', // Replace with actual profile image URL if available
                        ),
                      ),
                      const SizedBox(width: 15), // Spacing between avatar and text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userProfiles.first.name, // ✅ Fetches username dynamically
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Employee ID: ${userProfiles.first.id}", // ✅ Fetches Employee ID dynamically
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.purple,
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              icon: const Icon(Icons.edit, size: 16, color: Colors.black),
                              label: const Text(
                                "Edit Profile",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Menu Options
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.lock, color: Colors.black),
                          title: const Text(
                            "Password Settings",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.purple),
                          onTap: () {},
                        ),
                        Divider(height: 1, color: Colors.grey.shade300),
                        ListTile(
                          leading: const Icon(Icons.language, color: Colors.black),
                          title: const Text(
                            "Language",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.purple),
                          onTap: () {},
                        ),
                        Divider(height: 1, color: Colors.grey.shade300),
                        ListTile(
                          leading: const Icon(Icons.logout, color: Colors.red),
                          title: const Text(
                            "Logout",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.red),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
