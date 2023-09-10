import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreenLoading extends StatefulWidget {
  const SplashScreenLoading({Key? key}) : super(key: key);

  @override
  _SplashScreenLoadingState createState() => _SplashScreenLoadingState();
}

class _SplashScreenLoadingState extends State<SplashScreenLoading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: LoadingAnimationWidget.beat(
              color: Theme.of(context).colorScheme.primary,
              size: 50.0,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 32.0),
            alignment: Alignment.bottomCenter,
            child: Text(
              "Daily Buzz",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
      ],
    );
  }
}
