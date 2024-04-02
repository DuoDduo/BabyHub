import 'dart:async';

import 'package:babyhub/app.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       // Use GetMaterialApp instead of MaterialApp
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//       themeMode: ThemeMode.system,
//       theme: BabyHubTheme.lightTheme,
//       darkTheme: BabyHubTheme.darkTheme,
//     );
//   }
// }

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();

    Timer(const Duration(seconds: 8), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const MyApp()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ScaleTransition(
                  scale: _animation,
                  child: const Image(
                    height: 200,
                    image: AssetImage(BabyHubImages.darkAppLogo),
                  ),
                ),
                Text(
                  'BabyHub',
                  style: Theme.of(context).textTheme.headlineLarge!.apply(
                    color: dark ? BabyHubColors.primary : BabyHubColors.black,
                    decorationColor:
                        dark ? BabyHubColors.primary : BabyHubColors.black,
                    fontFamily: 'Lexend',
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black38.withOpacity(0.5),
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Your Ultimate Infant Shopping Companion',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: dark ? BabyHubColors.white : BabyHubColors.black,
                        decorationColor:
                            dark ? BabyHubColors.white : BabyHubColors.black,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
