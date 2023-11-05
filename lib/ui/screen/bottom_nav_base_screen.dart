import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screen/navscreen/update_profile.dart';
import 'package:taskmanager/ui/screen/navscreen/completed_task_screen.dart';
import 'package:taskmanager/ui/screen/navscreen/new_task_screen.dart';

import 'navscreen/inprogress_task_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int _selectedScreenIndex=0;
  final List<Widget> _screens= const[
    NewTaskScreen(),
    CompletedTaskscreen(),
    UpdateProfileSceen(),
    InProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        unselectedItemColor: Colors.grey,
        // unselectedLabelStyle: TextStyle(
        //   color: Colors.blue,
        // ),
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        onTap: (int index){
          _selectedScreenIndex= index;
          if(mounted){
            setState(() {});
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task), label:'New Task'),
          BottomNavigationBarItem(icon: Icon(Icons.compare),label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_rounded),label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.pending_outlined),label: 'Progress'),
        ],
      ),
    );
  }
}
