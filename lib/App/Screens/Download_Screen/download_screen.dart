import 'package:flutter/material.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Download Screen',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
