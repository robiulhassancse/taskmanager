import 'package:flutter/material.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.green,
      title: Text('Jason Statham'),
      subtitle: Text('Action Movie'),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://www.galaxycine.vn/media/2021/4/29/jason-statham-co-tro-lai-fast-saga-1_1619711656058.jpg'),
      ),
    );
  }
}