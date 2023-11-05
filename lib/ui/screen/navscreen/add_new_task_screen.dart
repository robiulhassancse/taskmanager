import 'package:flutter/material.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';
import 'package:taskmanager/ui/widgets/user_profile_banner.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UserProfileBanner(),
                    const Padding(padding: EdgeInsets.all(16.0),),

                    Text(
                      'Add New Screen',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 16,),
                    const TextField(
                      decoration: InputDecoration(hintText: 'Subject'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const TextField(
                      maxLength: 500,
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'Description',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                        child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.arrow_forward_ios),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
