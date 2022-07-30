//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();
//
// bool? authSignedIn;
// String? uid;
// String? name;
// String? email;
// String? imageUrl;
//
// Future getUser() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   authSignedIn = prefs.getBool('auth') ?? false;
//
//   final User user = await _auth.currentUser!;
//
//   if (authSignedIn == true) {
//     if (user != null) {
//       uid = user.uid;
//       name = user.displayName;
//       email = user.email;
//       imageUrl = user.photoURL;
//     }
//   }
// }
//
// Future<String> signInWithGoogle() async {
//   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//   await googleSignInAccount!.authentication;
//
//   final AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );
//
//   final UserCredential authResult = await _auth.signInWithCredential(credential);
//   final User? user = authResult.user;
//
//   // Checking if email and name is null
//   assert(user!.uid != null);
//   assert(user!.email != null);
//   assert(user!.displayName != null);
//   assert(user!.photoURL != null);
//
//
//   uid = user!.uid;
//   name = user.displayName;
//   email = user.email;
//   imageUrl = user.photoURL;
//
//   // Only taking the first part of the name, i.e., First Name
//   if (name!.contains(" ")) {
//     name = name!.substring(0, name!.indexOf(" "));
//   }
//
//   assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);
//
//   final User currentUser = await _auth.currentUser!;
//   assert(user.uid == currentUser.uid);
//
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool('auth', true);
//   authSignedIn = true;
//
//   return 'signInWithGoogle succeeded: $user';
// }
//
// void signOutGoogle() async {
//   await googleSignIn.signOut();
//
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool('auth', false);
//   authSignedIn = false;
//
//   print("User Sign Out");
// }