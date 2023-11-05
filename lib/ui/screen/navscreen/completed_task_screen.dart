import 'package:flutter/material.dart';
import 'package:taskmanager/ui/utils/task_list_tile.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';
import 'package:taskmanager/ui/widgets/user_profile_banner.dart';

class CompletedTaskscreen extends StatelessWidget {
  const CompletedTaskscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const UserProfileBanner(),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const TaskListTile();
                    }, separatorBuilder: (BuildContext context, int index) {
                    return const Divider(height: 4, color: Colors.red,);
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
