import 'package:flutter/material.dart';
import 'package:u_g_o/constants.dart';
import 'package:u_g_o/responsive.dart';
import '../../components/background.dart';
import 'components/Sign_in_top_image.dart';
import 'components/signin_form.dart';
import 'package:u_g_o/Screens/video/video_page.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileSigninScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: SignInScreenTopImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: SignUpForm(),
                    ),
                    SizedBox(height: defaultPadding / 2),
                    // SocalSignUp()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileSigninScreen extends StatelessWidget {
  const MobileSigninScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SignInScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            Spacer(),
          ],
        ),
        // const SocalSignUp()
        ElevatedButton(
          onPressed: () {
            // Navigate to VideoScreen after successful sign up
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoScreen()),
            );
          },
          child: const Text('Sign In'),
        ),
      ],
    );
  }
}
