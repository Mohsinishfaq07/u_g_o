// import 'package:flutter/material.dart';
// import 'package:u_g_o/screens/login/login_screen.dart';
// import 'package:u_g_o/screens/splash_services.dart'; // Import the LoginScreen
//
// class SplashScreen extends StatefulWidget {
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   SplashServices splashScreen = SplashServices(context);
//
//   late AnimationController _controller;
//   late Animation<double> _logoAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     splashScreen.isLogin();
//
//     //
//     // _controller = AnimationController(
//     //   vsync: this,
//     //   duration: Duration(seconds: 5),
//    // );
//
//     _logoAnimation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );
//
//     _controller.addListener(() {
//       setState(() {});
//     });
//
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         // Animation completed, navigate to the login screen
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => LoginScreen( )),
//         );
//       }
//     });
//
//     // Start the animation
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Widget _buildBackground(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Stack(
//       children: [
//         Positioned(
//           top: 0,
//           left: 0,
//           child: Image.asset(
//             'assets/images/main_top.png',
//             height: size.height * 0.15,
//           ),
//         ),
//         Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ScaleTransition(
//                 scale: _logoAnimation,
//                 child: Image.asset(
//                   'assets/images/newlogo.png',
//                   height: size.height * 0.1,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           right: 0,
//           child: Image.asset(
//             'assets/images/login_bottom.png',
//             height: size.height * 0.15,
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.blue.shade50,
//         ),
//         child: _buildBackground(context),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:u_g_o/screens/splash_services.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreenContent();
  }
}

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({Key? key}) : super(key: key);

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent>
    with SingleTickerProviderStateMixin {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);

    // Wait for 10 seconds, then navigate to the home screen
  }

  @override
  Widget build(BuildContext context) {
    // splashScreen = SplashServices( );
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.people),
      ]),
    );
  }
}
