import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:u_g_o/screens/body/body_language.dart';
import 'package:u_g_o/screens/dashboard/dashboard.dart';
import 'package:u_g_o/screens/facial/facial_expression.dart';
import 'package:u_g_o/screens/signup/signup_screen.dart';
import 'package:u_g_o/screens/vocal/vocal_feature.dart';
import 'package:u_g_o/splash_screen.dart';
import 'package:u_g_o/constants.dart';
import 'package:u_g_o/screens/welcome/welcome_screen.dart';
import 'package:u_g_o/screens/video/video_page.dart';
import 'package:postgres/postgres.dart';


Future<PostgreSQLConnection> createDatabaseConnection() async {
  final connection = PostgreSQLConnection(
    'your_host',     // Replace with your PostgreSQL host
    5432,            // Replace with your PostgreSQL port
    'flutter',    // Replace with your PostgreSQL database name
    username: 'localhost', // Replace with your PostgreSQL username
    password: 'electrical',    // Replace with your PostgreSQL password
  );

  await connection.open();

  return connection;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UGO',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: kPrimaryColor,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: kPrimaryLightColor,
          iconColor: kPrimaryColor,
          prefixIconColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      routes: {
        '/splashscreen': (context) => SplashScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/signup': (context) => SignUpScreen(),
        '/video': (context) => VideoScreen(),
        '/dashboard': (context) => Dashboard(),
        '/bodylanguage': (context) => BodyLanguageScreen(),
        '/facialexpression': (context) => FacialExpressionScreen(),
        '/vocalfeature': (context) => VocalFeatureScreen(),
        //'/about_laptop': (context) => AboutLaptopScreen(),
        //'/dashboard': (context) => DashboardScreen(),

        // Include the route for BodyLanguageScreen
      },
      initialRoute: '/splashscreen',
    );
  }
}
