const profile =
    """
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/controllers/user_controller.dart';
import '../../bottomBar/widgets/page_showed.dart';
import '../controller/profile_controller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShowed(
      index: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            IconButton(
              onPressed: () {
                Get.find<ProfileController>().logout();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () => Get.find<UserController>().getUser(),
          child: const Center(
            child: Text('Get User'),
          ),
        ),
      ),
    );
  }
}
    """;