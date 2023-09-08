import 'package:flutter/material.dart';

class MailButton extends StatefulWidget {
  const MailButton({Key? key}) : super(key: key);

  @override
  _MailButtonState createState() => _MailButtonState();
}

class _MailButtonState extends State<MailButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width / 2.1,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Contact Us",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            "assets/images/illustrations/mail.png",
            width: 150,
            height: 150,
          ),
        ),
      ],
    );
  }
}
