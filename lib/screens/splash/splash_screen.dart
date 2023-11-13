import 'package:bloc_gorouter_example/routing/navigation_wrapper/nav_bloc.dart';
import 'package:bloc_gorouter_example/screens/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('SPLASH SCREEN'),
              BlocBuilder<SplashBloc, SplashBlocState>(builder: (context, state) {
                switch (state) {
                  case SplashBlocState$Loadig _:
                    return const CircularProgressIndicator();
                  case SplashBlocState$Loaded _:
                    context.read<NavigationBloc>().add(NavigationBloc$GoScreenOne());
                    return const SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
