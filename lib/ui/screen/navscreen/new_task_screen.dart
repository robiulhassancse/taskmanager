import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screen/navscreen/add_new_task_screen.dart';
import 'package:taskmanager/ui/utils/task_list_tile.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';
import 'package:taskmanager/ui/widgets/user_profile_banner.dart';

import '../../utils/summary_card.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

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
                const Row(
                  children: [
                    Expanded(
                      child: SummaryCard(
                        number: 123,
                        title: 'Cancle',
                      ),
                    ),
                    Expanded(
                      child: SummaryCard(
                        number: 456,
                        title: 'Completed',
                      ),
                    ),
                    Expanded(
                      child: SummaryCard(
                        number: 543,
                        title: 'Progress',
                      ),
                    ),
                    Expanded(
                      child: SummaryCard(
                        number: 865,
                        title: 'New Task',
                      ),
                    ),
                  ],
                ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddNewTaskScreen()));
        }, child: const Icon(Icons.add),
      ),
    );
  }
}
