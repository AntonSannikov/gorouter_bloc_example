import 'package:flutter_bloc/flutter_bloc.dart';

class OnTabChanged {
  OnTabChanged(this.index);

  final int index;
}

class TabBloc extends Bloc<OnTabChanged, OnTabChanged> {
  TabBloc([int? initialIndex]) : super(OnTabChanged(initialIndex ?? 0)) {
    on<OnTabChanged>((event, emit) => emit(OnTabChanged(event.index)));
  }
}
