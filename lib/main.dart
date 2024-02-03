import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';
import 'initializer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();
  runApp(const MyChat());
}

class MyChat extends StatelessWidget {
  const MyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Chat",
      initialRoute: AppPages.initial,
      theme: AppTheme.themeData,
      getPages: AppPages.routes,
    );
  }
}
