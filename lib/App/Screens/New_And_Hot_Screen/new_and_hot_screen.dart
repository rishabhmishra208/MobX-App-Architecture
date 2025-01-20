import 'package:flutter/material.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'New & Hot Screen',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
