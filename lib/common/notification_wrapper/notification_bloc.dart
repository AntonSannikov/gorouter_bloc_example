import 'package:flutter_bloc/flutter_bloc.dart';

sealed class NotificationBloc$ {}

final class NotificationBloc$Idle extends NotificationBloc$ {}

final class NotificationBloc$Show extends NotificationBloc$ {
  NotificationBloc$Show(this.message);

  final String message;
}

final class NotificationBloc$Hide extends NotificationBloc$ {}

class NotificationBloc extends Bloc<NotificationBloc$, NotificationBloc$> {
  NotificationBloc() : super(NotificationBloc$Idle()) {
    on<NotificationBloc$Show>((event, emit) => emit(event));
    on<NotificationBloc$Hide>((event, emit) => emit(event));
  }
}
