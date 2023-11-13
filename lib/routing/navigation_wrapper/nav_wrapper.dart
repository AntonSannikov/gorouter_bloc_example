import 'package:bloc_gorouter_example/routing/router_config_provider/app_router.dart';
import 'package:bloc_gorouter_example/routing/navigation_wrapper/nav_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NavigationWrapper extends StatelessWidget {
  const NavigationWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: BlocListener<NavigationBloc, NavigationBloc$>(
        listener: (context, state) {
          switch (state) {
            case NavigationBloc$GoSplash _:
              context.go(AppRouter.buildSplashRoutePath());
            case NavigationBloc$GoScreenOne _:
              context.go(AppRouter.buildScreenOneRoutePath());
            case NavigationBloc$GoScreenTwo _:
              context.go(AppRouter.buildScreenTwoRoutePath());
            case NavigationBloc$GoScreenThree _:
              context.go(AppRouter.buildScreenThreeRoutePath());
          }
        },
        child: child,
      ),
    );
  }
}
