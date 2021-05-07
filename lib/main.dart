import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/screens/sign_in_screen.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'FlutterFire Samples',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.indigo,
                brightness: Brightness.dark,
            ),
            home: SignInScreen(),
        );
    }
}
