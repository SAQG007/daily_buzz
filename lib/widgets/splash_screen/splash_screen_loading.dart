import 'package:flutter/material.dart';

class SplashScreenLoading extends StatefulWidget {
  const SplashScreenLoading({Key? key}) : super(key: key);

  @override
  _SplashScreenLoadingState createState() => _SplashScreenLoadingState();
}

class _SplashScreenLoadingState extends State<SplashScreenLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 32.0),
      alignment: Alignment.bottomCenter,
      child: Text(
        "Daily Buzz",
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
