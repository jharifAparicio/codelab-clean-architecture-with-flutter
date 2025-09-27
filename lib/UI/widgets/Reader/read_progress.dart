import 'package:flutter/material.dart';

class ReaderProgress extends StatelessWidget {
  final double progress;

  const ReaderProgress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Colors.transparent,
    );
  }
}
