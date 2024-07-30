// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 3)).then((_) {
//       Navigator.pushReplacementNamed(context, '/login');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Lottie.asset(
//               'assets/images/splash1.json', // Ensure you have the correct path to your Lottie animation file
//               width: 200,
//               height: 200,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Spend Wise",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 107, 203, 113),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
