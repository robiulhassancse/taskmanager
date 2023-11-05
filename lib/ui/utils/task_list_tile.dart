import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: const Text('Dart is one of the most loved'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Dart is a client-optimized, object-oriented, modern programming language '),
            const Text('Date'),
            Row(
              children: [
                const Chip(
                  label: Text(
                    'Progress',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.purple,
                ),
                const Spacer(),
                IconButton(onPressed: (){}, icon: const Icon(Icons.edit,color: Colors.green,),),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever,color: Colors.red[400],),),
              ],
            )
          ],
        ));
  }
}