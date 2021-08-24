import 'package:flutter/material.dart';
import 'package:my_app/providers/login.dart';
import 'package:my_app/providers/register.dart';
import 'package:my_app/views/signIn_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => Login()),
      ChangeNotifierProvider(create: (_) => Register()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
