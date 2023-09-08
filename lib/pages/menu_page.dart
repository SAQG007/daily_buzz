import 'package:daily_buzz/widgets/menu/long_button.dart';
import 'package:daily_buzz/widgets/menu/mail_button.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({ Key? key }) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
      child: ListView(
        children: const [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MailButton(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LongButton(title: "LinkedIn", imgName: "linkedin.png", bottomPosition: 0, rightPosition: 0, imgWidth: 70.0, imgHeight: 70.0,),
                  LongButton(title: "GitHub", imgName: "github.png", bottomPosition: 8.0, rightPosition: 8.0, imgWidth: 55.0, imgHeight: 55.0,),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LongButton(title: "About", imgName: "question-mark.png", bottomPosition: 0, rightPosition: -9.0, imgWidth: 70.0, imgHeight: 70.0),
              LongButton(title: "Change Theme", imgName: "theme.png", bottomPosition: -8.0, rightPosition: -6.0, imgWidth: 90.0, imgHeight: 90.0),
            ],
          ),
        ],
      ),
    );
  }
}
