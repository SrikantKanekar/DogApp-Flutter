import 'dart:collection';

import 'package:dog_app/provider/auth.dart';
import 'package:dog_app/provider/breeds.dart';
import 'package:dog_app/screens/auth/auth_screen.dart';
import 'package:dog_app/screens/detail/detail_screen.dart';
import 'package:dog_app/screens/home/home_screen.dart';
import 'package:dog_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Breeds>(
          update: (ctx, auth, previous) {
            return Breeds(previous == null ? HashMap() : previous.items);
          },
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Dog Demo app',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: auth.isAuth
              ? const HomeScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, snapShot) =>
                      snapShot.connectionState == ConnectionState.waiting
                          ? const SplashScreen()
                          : const AuthScreen(),
                ),
          routes: {
            DetailScreen.routeName: (ctx) => const DetailScreen(),
          },
        ),
      ),
    );
  }
}
