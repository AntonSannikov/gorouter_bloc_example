import 'package:bloc_gorouter_example/screens/tab_screen/tab_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  void _onBottomNavigationBarTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
    context.read<TabBloc>().add(OnTabChanged(index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabBloc>(
      create: (context) => TabBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(child: widget.navigationShell),
        bottomNavigationBar: BlocBuilder<TabBloc, OnTabChanged>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.index,
              onTap: (i) => _onBottomNavigationBarTap(context, i),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'one'),
                BottomNavigationBarItem(icon: Icon(Icons.list), label: 'two'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'three'),
              ],
            );
          },
        ),
      ),
    );
  }
}
