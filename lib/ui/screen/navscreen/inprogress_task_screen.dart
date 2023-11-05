import 'package:flutter/material.dart';
import 'package:taskmanager/ui/utils/task_list_tile.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';
import 'package:taskmanager/ui/widgets/user_profile_banner.dart';

class InProgressTaskScreen extends StatelessWidget {
  const InProgressTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                UserProfileBanner(),

                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const TaskListTile();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}