import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorOccured extends StatefulWidget {
  final String imgName;
  final Widget? redirectTo;
  final bool showRetryButton;

  const ErrorOccured({
    required this.imgName,
    this.redirectTo,
    required this.showRetryButton,
    Key? key
  }) : super(key: key);

  @override
  _ErrorOccuredState createState() => _ErrorOccuredState();
}

class _ErrorOccuredState extends State<ErrorOccured> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/illustrations/${widget.imgName}',
                width: 350.0,
                height: 350.0,
              ),
            ),
            Visibility(
              visible: widget.showRetryButton,
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget.redirectTo!));
                    },
                    label: const Text("Retry"),
                    icon: const Icon(Icons.refresh_outlined),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
