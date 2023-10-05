import 'package:flutter/material.dart';

abstract class MediaQueryHelper {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();
  static double width =
      MediaQuery.of(navigatorState.currentContext!).size.width;
  static double height =
      MediaQuery.of(navigatorState.currentContext!).size.height;
}
