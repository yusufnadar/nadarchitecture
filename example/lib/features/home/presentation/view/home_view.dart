import 'package:flutter/material.dart';

import '../../../../core/services/get_it/get_it_service.dart';
import '../../../../core/services/theme/theme_service.dart';
import '../mixin/home_mixin.dart';

class HomeView extends StatefulWidget {
  final bool? firstOpen;

  const HomeView({super.key, this.firstOpen});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: Center(
        child: ElevatedButton(
          onPressed: getIt<ThemeService>().changeTheme,
          child: const Text('Change Theme'),
        ),
      ),
    );
  }
}
