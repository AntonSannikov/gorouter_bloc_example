import 'package:flutter_bloc/flutter_bloc.dart';

sealed class SplashBlocEvent {}

final class SplashBlocEvent$Loaded extends SplashBlocEvent {}

sealed class SplashBlocState {}

final class SplashBlocState$Loadig extends SplashBlocState {}

final class SplashBlocState$Loaded extends SplashBlocState {}

class SplashBloc extends Bloc<SplashBlocEvent, SplashBlocState> {
  SplashBloc() : super(SplashBlocState$Loadig()) {
    on<SplashBlocEvent$Loaded>((event, emit) => emit(SplashBlocState$Loaded()));
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 2));
    add(SplashBlocEvent$Loaded());
  }
}
