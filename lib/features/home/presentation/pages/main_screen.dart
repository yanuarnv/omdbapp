import 'package:flutter/material.dart';
import 'package:omdbapp/features/home/presentation/pages/home_screen.dart';

import '../../../../gen/assets.gen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedIndex,
      builder: (BuildContext context, int value, _) {
        return Scaffold(
          body: Center(child: _widgetOptions.elementAt(value)),
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
