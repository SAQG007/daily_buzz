import 'package:flutter/material.dart';

class LongButton extends StatefulWidget {
  final String title;
  final String imgName;
  final double bottomPosition;
  final double rightPosition;
  final double imgWidth;
  final double imgHeight;

  const LongButton({
    required this.title,
    required this.imgName,
    required this.bottomPosition,
    required this.rightPosition,
    required this.imgWidth,
    required this.imgHeight,
    Key? key
  }) : super(key: key);

  @override
  _LongButtonState createState() => _LongButtonState();
}

class _LongButtonState extends State<LongButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 8.0,
          width: MediaQuery.of(context).size.width / 2.1,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: widget.bottomPosition,
          right: widget.rightPosition,
          child: Image.asset(
            "assets/images/illustrations/${widget.imgName}",
            width: widget.imgWidth,
            height: widget.imgHeight,
          ),
        ),
      ],
    );
  }
}