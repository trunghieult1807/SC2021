// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
//
// bool _isLoggedIn = false;
// String _message;
// final _auth = FirebaseAuth.instance;
// final _facebooklogin = FacebookLogin();
//
// Future _loginWithFacebook() async {
//   _facebooklogin.loginBehavior = FacebookLoginBehavior.nativeOnly;
//   final result = await _facebooklogin.logIn(['email']);
//   if (result.status == FacebookLoginStatus.loggedIn) {
//     final credential = FacebookAuthProvider.getCredential(
//       accessToken: result.accessToken.token,
//     );
//     final user = (await _auth.signInWithCredential(credential)).user;
//     setState(() {
//       _message = "Logged in as ${user.displayName}";
//       _isLoggedIn = true;
//     });
//   }
// }
//
// Future _logout() async {
//   await _auth.signOut();
//   await _facebooklogin.logOut();
//   setState(() {
//     _isLoggedIn = false;
//   });
// }
//
// Future _checkLogin() async {
//   final user = await _auth.currentUser();
//   if (user != null) {
//     setState(() {
//       _message = "Logged in as ${user.displayName}";
//       _isLoggedIn = true;
//     });
//   }
// }