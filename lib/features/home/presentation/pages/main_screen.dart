import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/omdb_router.dart';
import '../../../../gen/assets.gen.dart';

class MainScreen extends StatefulWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
    if (index == 0) {
      context.go(Routes.HOME);
    } else if (index == 1) {
      context.go(Routes.NEW_AND_HOT);
    } else {
      context.go(Routes.ACCOUNT);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedIndex,
      builder: (BuildContext context, int value, _) {
        return Scaffold(
          body: widget.child,
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Assets.svg.newAndHot.svg(),
                label: 'New & Hot',
              ),
              BottomNavigationBarItem(
                icon: Assets.img.accountExample.image(width: 21, height: 21),
                label: 'My netflix',
              ),
            ],
            currentIndex: value,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}
