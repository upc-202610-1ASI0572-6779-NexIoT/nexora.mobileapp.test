import 'package:flutter/material.dart';

import '../code/theme/app_colors.dart';
import '../data/fake/fake_nexora_api.dart';
import '../data/models/app_data.dart';
import 'main_shell.dart';

class NexoraApp extends StatelessWidget {
  const NexoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nexora IoT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        useMaterial3: true,
      ),
      home: const AppLoader(),
    );
  }
}

class AppLoader extends StatefulWidget {
  const AppLoader({super.key});

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  late final Future<AppData> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = FakeNexoraApi().getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppData>(
      future: _futureData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.blue,
              ),
            ),
          );
        }

        return MainShell(data: snapshot.data!);
      },
    );
  }
}