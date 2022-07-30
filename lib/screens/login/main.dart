// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:mirinae_gugu/screens/login/first_screen.dart';
// import 'package:mirinae_gugu/screens/login/login_page.dart';
// import 'package:mirinae_gugu/screens/login/sign_in.dart';
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//     getUserInfo();
//   }
//
//   Future getUserInfo() async {
//     await getUser();
//     setState(() {});
//     print(uid);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Login',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home:
//       (uid != null && authSignedIn != false) ? FirstScreen() : LoginPage(),
//     );
//   }
// }