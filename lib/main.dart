import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/presentation/view/task_ui.dart';
import 'package:task/presentation/view/test_location.dart';
import 'package:task/presentation/view_model/task_controller.dart';
import 'package:task/utilities/media_quary.dart';

void main() {
  runApp(ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataController()..data(),
      child: MaterialApp(
        navigatorKey: MediaQueryHelper.navigatorState,
        navigatorObservers: [MediaQueryHelper.routeObserver],
        scaffoldMessengerKey: MediaQueryHelper.scaffoldState,
        home: const TestLocation(),
      ),
    );
  }
}
