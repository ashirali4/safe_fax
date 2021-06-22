import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:safe_fax/pages/auth/signup.dart';
import 'package:safe_fax/router_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var _routeGenerator = RouteGenerator();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sales Fax',

      theme: ThemeData(
        primaryColor: Color(0xFFf88c02),
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      onGenerateRoute: _routeGenerator.generateRoute,

    );
  }
}



