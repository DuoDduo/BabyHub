import 'package:babyhub/app.dart';
import 'package:babyhub/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:babyhub/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(const MyApp());
}
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//       themeMode: ThemeMode.system,
//       theme: BabyHubTheme.lightTheme,
//       darkTheme: BabyHubTheme.darkTheme,
//     );
//   }
// }
