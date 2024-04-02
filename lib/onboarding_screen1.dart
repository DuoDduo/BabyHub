// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'BabyHub Onboarding',
//       home: OnboardingScreen(),
//     );
//   }
// }
//
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController(initialPage: 0);
//   int _currentPage = 0;
//
//   List<Widget> _buildPageIndicator() {
//     List<Widget> list = [];
//     for (int i = 0; i < 3; i++) {
//       list.add(i == _currentPage ? _indicator(true) : _indicator(false));
//     }
//     return list;
//   }
//
//   Widget _indicator(bool isActive) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 150),
//       margin: const EdgeInsets.symmetric(horizontal: 5.0),
//       height: isActive ? 12.0 : 8.0,
//       width: isActive ? 12.0 : 8.0,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: isActive ? const Color(0xFF3669C9) : Colors.grey,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               _pageController.jumpToPage(2); // Skip to the last page
//             },
//             child: const Text(
//               'Skip',
//               style: TextStyle(
//                 color: Color(0xFF3669C9),
//                 fontSize: 24.0,
//                 fontFamily: 'Lexend',
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Expanded(
//               flex: 7,
//               child: PageView(
//                 controller: _pageController,
//                 onPageChanged: (int page) {
//                   setState(() {
//                     _currentPage = page;
//                   });
//                 },
//                 children: const <Widget>[
//                   OnboardingPage(
//                     title: 'Discover a Variety of Infant Products',
//                     subtitle:
//                         'From diapers to toys, find everything your baby needs in one place.',
//                     imageAsset: 'assets/images/onboarding_images/login.png',
//                   ),
//                   OnboardingPage(
//                     title: 'Real-Time Order Tracking',
//                     subtitle:
//                         "Track your orders in real-time and know exactly when they'll arrive at your doorstep.",
//                     imageAsset: 'assets/images/onboarding_images/order.png',
//                   ),
//                   OnboardingPage(
//                     title: 'Effortless Shopping at Your Fingertips',
//                     subtitle:
//                         "With a user-friendly interface shopping for your baby has never been this easy.",
//                     imageAsset: 'assets/images/onboarding_images/search.png',
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: _buildPageIndicator(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             _pageController.nextPage(
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.ease,
//             );
//           },
//           backgroundColor: const Color(0xFF3669C9),
//           elevation: 0,
//           shape: const CircleBorder(),
//           child: const Icon(Icons.arrow_forward, color: Color(0xFFFFFFFF))),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
//
// class OnboardingPage extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String imageAsset;
//
//   const OnboardingPage({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.imageAsset,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Positioned.fill(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Image.asset(
//               imageAsset,
//               fit: BoxFit.cover,
//               width: MediaQuery.of(context).size.width * 0.6,
//               height: MediaQuery.of(context).size.height * 0.7,
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.2,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(25.0),
//                 topRight: Radius.circular(25.0),
//               ),
//               border: Border(
//                 top: BorderSide(color: Color(0xFF3669C9), width: 1.0),
//                 bottom: BorderSide.none,
//                 left: BorderSide.none,
//                 right: BorderSide.none,
//               ),
//             ),
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 const SizedBox(height: 5.0),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 33.0,
//                     letterSpacing: -1.0,
//                     fontWeight: FontWeight.w700,
//                     fontFamily: 'Lexend',
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 8.0),
//                 Text(
//                   subtitle,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 22.0,
//                     letterSpacing: -1.0,
//                     fontWeight: FontWeight.w100,
//                     fontFamily: 'Lexend',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
