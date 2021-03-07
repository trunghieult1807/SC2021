// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'home_page.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     systemNavigationBarColor: Colors.blueGrey[900],
//   ));
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//       .then((_) => runApp(MyApp()));
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Countdown Timer',
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.blueGrey[900],
//         brightness: Brightness.dark,
//         textTheme: TextTheme(
//           bodyText2: TextStyle(color: Colors.white),
//         ),
//         primarySwatch: Colors.orange,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//     );
//   }
// }
