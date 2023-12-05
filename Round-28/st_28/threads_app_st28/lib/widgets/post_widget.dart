import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Title'),
      subtitle: Text('Content'),
      leading: CircleAvatar(
        // backgroundImage: NetworkImage(),
      ),
      trailing: Text(
        'Date',
        style: const TextStyle(fontSize: 20),
      ),
    );

  }
}
