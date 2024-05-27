// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:movies_amit63/core/dio_helper.dart';
// import 'package:movies_amit63/views/products/contact_us.dart';
//
// class LoginView extends StatefulWidget {
//   const LoginView({Key? key}) : super(key: key);
//
//   @override
//   State<LoginView> createState() => _LoginViewState();
// }
//
// class _LoginViewState extends State<LoginView> {
//   final phoneController = TextEditingController();
//   final passwordController = TextEditingController();
//   bool isLoading = false;
//
//   Future<void> send() async {
//     isLoading = true;
//     setState(() {});
//     final response = await DioHelper.send("login",data: {
//       "phone":phoneController.text,
//       "password":passwordController.text,
//       "device_token":"test",
//       "type":Platform.operatingSystem,
//       "user_type":"client"
//     });
//     if (response.isSuccess) {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductsView(),
//           ));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.message!)));
//     }
//
//     isLoading = false;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 controller: phoneController,
//                 decoration: InputDecoration(labelText: "Phone Number"),
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: InputDecoration(labelText: "Passwrod"),
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               isLoading?Center(child: CircularProgressIndicator(),):
//               FilledButton(
//                 onPressed: () {
//                   send();
//                   // print(phoneController.text);
//                   // print(passwordController.text);
//                 },
//                 child: Text("Login"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
