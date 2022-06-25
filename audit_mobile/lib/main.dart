import 'package:audit_mobile/pages/detail_chat.dart';
import 'package:audit_mobile/pages/home/main_page.dart';
import 'package:audit_mobile/pages/profile_page.dart';
import 'package:audit_mobile/pages/sign_in_page.dart';
import 'package:audit_mobile/pages/sign_up_page.dart';
import 'package:audit_mobile/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/profile': (context) => ProfilePage(),
        '/detail-chat': (context) => DetailChatPage(),
      },
    );
  }
}
