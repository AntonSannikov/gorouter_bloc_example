import 'dart:async';

import 'package:bloc_gorouter_example/common/notification_wrapper/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationWrapper extends StatefulWidget {
  const NotificationWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<NotificationWrapper> createState() => _NotificationWrapperState();
}

class _NotificationWrapperState extends State<NotificationWrapper> with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  late final AnimationController _animationController;
  late final Animation<Offset> _animation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceIn));
  }

  @override
  void dispose() {
    _overlayEntry?.dispose();
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _showOverlay(String message) {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 4), _hideOverlay);
    _overlayEntry = OverlayEntry(
      builder: (context) => SlideTransition(
        position: _animation,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 100,
              width: 200,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Material(
                  color: Colors.red.withOpacity(0.7),
                  child: InkWell(
                    onTap: _hideOverlay,
                    child: Center(
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
  }

  void _hideOverlay() {
    _animationController.reverse().then((value) {
      if (mounted) {
        _overlayEntry = null;
        _overlayEntry?.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationBloc>(
      create: (context) => NotificationBloc(),
      child: BlocListener<NotificationBloc, NotificationBloc$>(
        listener: (context, state) {
          switch (state) {
            case NotificationBloc$Idle _:
              break;
            case NotificationBloc$Show _:
              _showOverlay(state.message);
            case NotificationBloc$Hide _:
              _hideOverlay();
          }
        },
        child: widget.child,
      ),
    );
  }
}
