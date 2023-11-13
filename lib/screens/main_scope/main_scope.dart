import 'package:bloc_gorouter_example/common/notification_wrapper/notification_wrapper.dart';
import 'package:bloc_gorouter_example/routing/navigation_wrapper/nav_wrapper.dart';
import 'package:flutter/material.dart';

class MainScope extends StatelessWidget {
  const MainScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NavigationWrapper(
      child: NotificationWrapper(
        child: child,
      ),
    );
  }
}
