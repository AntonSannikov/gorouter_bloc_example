import 'package:bloc_gorouter_example/routing/router_config_provider/app_router.dart';
import 'package:bloc_gorouter_example/routing/router_config_provider/router_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RouterConfigProvider(
      child: Builder(builder: (context) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          routerConfig: context.read<AppRouter>().config,
        );
      }),
    );
  }
}
