import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyChat());
}

class MyChat extends StatelessWidget {
  const MyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Chat",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
