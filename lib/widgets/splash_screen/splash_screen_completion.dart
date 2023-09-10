import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreenCompletion extends StatefulWidget {
  final VoidCallback callBackFunction;

  const SplashScreenCompletion({
    required this.callBackFunction,
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
      .fadeOut(delay: 1.seconds)
      .callback(duration: 200.ms, callback: (_) => widget.callBackFunction()),
    );
  }
}
