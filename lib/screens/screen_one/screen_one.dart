import 'package:bloc_gorouter_example/common/notification_wrapper/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  void _onShowNotificationTap(BuildContext context) {
    context.read<NotificationBloc>().add(NotificationBloc$Show('Notification message'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withOpacity(0.3),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('SCREEN ONE'),
            ElevatedButton(onPressed: () => _onShowNotificationTap(context), child: const Text('show notification')),
          ],
        ),
      ),
    );
  }
}
