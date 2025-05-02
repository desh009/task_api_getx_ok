import 'package:api_getx/screens/cancelled_task_screen.dart';
import 'package:api_getx/screens/completed_task_screen.dart';
import 'package:api_getx/screens/new_task_screen.dart';
import 'package:api_getx/screens/progress_task-screen.dart';
import 'package:api_getx/widgets/tm_appbar.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.new_label),
            label: 'New',
          ),
          NavigationDestination(
            icon: Icon(Icons.ac_unit_sharp),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.done),
            label: 'Complete',
          ),
          NavigationDestination(
            icon: Icon(Icons.cancel_outlined),
            label: 'Cancelled',
          ),
        ],
      ),
    );
  }
}