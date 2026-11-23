import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FacebookApp());
}

class FacebookApp extends StatelessWidget {
  const FacebookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Facebook Replication',
          initialRoute: '/home',
          routes: {
            '/home': (context) => const HomeScreen(),
            '/newsfeed': (context) =>
                const Scaffold(
                  body: NewsFeedScreenPlaceholder(),
                ),
          },
        );
      },
    );
  }
}

class NewsFeedScreenPlaceholder extends StatelessWidget {
  const NewsFeedScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
