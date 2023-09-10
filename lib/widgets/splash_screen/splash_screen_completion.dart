import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreenCompletion extends StatefulWidget {
  final VoidCallback sendAPICall;

  const SplashScreenCompletion({
    required this.sendAPICall,
    Key? key
  }) : super(key: key);

  @override
  _SplashScreenCompletionState createState() => _SplashScreenCompletionState();
}

class _SplashScreenCompletionState extends State<SplashScreenCompletion> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Daily Buzz",
        style: Theme.of(context).textTheme.displaySmall,
      )
      .animate()
      .slide(begin: const Offset(0, 8))
      .callback(callback: (_) => widget.sendAPICall()),
    );
  }
}