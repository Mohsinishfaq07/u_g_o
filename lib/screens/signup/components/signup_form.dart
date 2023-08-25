// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//  import 'package:u_g_o/Screens/video/video_page.dart';
//
//  import '../../../constants.dart';
//
// class SignUpForm extends StatefulWidget {
//   final VoidCallback onSignUpSuccess; // Add this line
//
//   SignUpForm({
//     Key? key,
//     required this.onSignUpSuccess, // Add this line
//   }) : super(key: key);
//
//   @override
//   State<SignUpForm> createState() => _SignUpFormState();
// }
//
// class _SignUpFormState extends State<SignUpForm> {
//   final passwordController = TextEditingController();
//   final emailController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final formKey = GlobalKey<FormState>();
//   bool loading = false;
//
//   @override
//   void dispose() {
//     super.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             controller: emailController,
//             keyboardType: TextInputType.emailAddress,
//             textInputAction: TextInputAction.next,
//             cursorColor: kPrimaryColor,
//             onSaved: (email) {},
//             decoration: InputDecoration(
//               hintText: "Your email",
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.all(defaultPadding),
//                 child: Icon(Icons.person),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: defaultPadding),
//             child: TextFormField(
//               controller: passwordController,
//               textInputAction: TextInputAction.done,
//               obscureText: true,
//               cursorColor: kPrimaryColor,
//               decoration: InputDecoration(
//                 hintText: "Your password",
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.all(defaultPadding),
//                   child: Icon(Icons.lock),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: defaultPadding / 2),
//           ElevatedButton(
//             onPressed: () {
//               if (formKey.currentState!.validate()) {
//                 setState(() {
//                   loading = true;
//                 });
//                 try {
//                   _auth.createUserWithEmailAndPassword(
//                       email: emailController.text.toString(),
//                       password: passwordController.text.toString());
//                   setState(() {
//                     loading = false;
//                   });
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => VideoScreen()));
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text(e.toString()),
//                   ));
//                 }
//               }
//               widget.onSignUpSuccess();
//             },
//             child: Text("Sign Up".toUpperCase()),
//           ),
//         ],
//       ),
//     );
//   }
// }
