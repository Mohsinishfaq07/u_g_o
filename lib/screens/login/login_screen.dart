import 'package:flutter/material.dart';
import 'package:u_g_o/components/background.dart';
import 'package:u_g_o/responsive.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';
import 'package:u_g_o/screens/video/video_page.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileLoginScreen(
            onLoginSuccess: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoScreen() ));
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => VideoScreen(), // Replace with the appropriate screen
              //   ),
              // );
            },
          ),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: LoginForm(
                        onLoginSuccess: () {
                          print("workingggggggggggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoScreen() ));

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  final VoidCallback onLoginSuccess;

  const MobileLoginScreen({
    Key? key,
    required this.onLoginSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(
                onLoginSuccess: onLoginSuccess,
              ),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
