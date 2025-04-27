import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/bottom_nav.dart';
import 'theme/app_theme.dart';
import 'models/user.dart' as app_user;
import 'login.dart';
import 'signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => app_user.User(),
      child: const HerCyclePlusApp(),
    ),
  );
}

class HerCyclePlusApp extends StatelessWidget {
  const HerCyclePlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HerCycle+',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const AuthWrapper(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/bottomNav': (context) => const BottomNav(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print('Auth state: ${snapshot.connectionState}, User: ${snapshot.hasData ? snapshot.data!.uid : 'null'}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData) {
          print('User logged in, showing BottomNav');
          return const BottomNav();
        } else {
          print('No user, showing LoginScreen');
          return const LoginScreen();
        }
      },
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HerConnect',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const Placeholder(), // Replace with SignupScreen
        '/bottomNav': (context) => const Placeholder(), // Replace with BottomNavScreen
        '/home': (context) => const Placeholder(), // Replace with HomeScreen
        '/about': (context) => const Placeholder(), // Replace with AboutScreen
        '/contact': (context) => const Placeholder(), // Replace with ContactScreen
        '/privacy': (context) => const Placeholder(), // Replace with PrivacyScreen
      },
    );
  }
}