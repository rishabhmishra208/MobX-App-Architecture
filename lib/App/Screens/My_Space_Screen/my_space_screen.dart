import 'package:flutter/material.dart';

class MySpaceScreen extends StatelessWidget {
  const MySpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'My Space Screen',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
