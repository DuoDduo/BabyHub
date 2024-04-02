import 'package:babyhub/bindings/general_bindings.dart';
import 'package:babyhub/routes/app_routes.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: BabyHubTheme.lightTheme,
      darkTheme: BabyHubTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: BabyHubColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: BabyHubColors.white,
          ),
        ),
      ),
    );
  }
}
