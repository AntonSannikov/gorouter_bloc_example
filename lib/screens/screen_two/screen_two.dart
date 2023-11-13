import 'package:bloc_gorouter_example/routing/navigation_wrapper/nav_bloc.dart';
import 'package:bloc_gorouter_example/screens/tab_screen/tab_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  void _onTap(BuildContext context) {
    context.read<NavigationBloc>().add(NavigationBloc$GoScreenThree());
    context.read<TabBloc>().add(OnTabChanged(2));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withOpacity(0.3),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('SCREEN TWO'),
            ElevatedButton(
              onPressed: () => _onTap(context),
              child: const Text('to screen three'),
            ),
          ],
        ),
      ),
    );
  }
}
