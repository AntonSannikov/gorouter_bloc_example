import 'package:flutter_bloc/flutter_bloc.dart';

sealed class NavigationBloc$ {}

final class NavigationBloc$GoSplash extends NavigationBloc$ {}

final class NavigationBloc$GoScreenOne extends NavigationBloc$ {}

final class NavigationBloc$GoScreenTwo extends NavigationBloc$ {}

final class NavigationBloc$GoScreenThree extends NavigationBloc$ {}

class NavigationBloc extends Bloc<NavigationBloc$, NavigationBloc$> {
  NavigationBloc() : super(NavigationBloc$GoSplash()) {
    on<NavigationBloc$GoSplash>(_proxyEvent);
    on<NavigationBloc$GoScreenOne>(_proxyEvent);
    on<NavigationBloc$GoScreenTwo>(_proxyEvent);
    on<NavigationBloc$GoScreenThree>(_proxyEvent);
  }

  void _proxyEvent(NavigationBloc$ event, Emitter<NavigationBloc$> emit) => emit(event);
}
