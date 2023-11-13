import 'package:bloc_gorouter_example/routing/router_config_provider/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouterConfigProvider extends StatelessWidget {
  const RouterConfigProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AppRouter(),
      child: child,
    );
  }
}
