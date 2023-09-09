import 'package:daily_buzz/widgets/news_card.dart';
import 'package:flutter/material.dart';

class TechNews extends StatefulWidget {
  const TechNews({ Key? key }) : super(key: key);

  @override
  _TechNewsState createState() => _TechNewsState();
}

class _TechNewsState extends State<TechNews> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      children: const [
        NewsCard(),
        NewsCard(),
        NewsCard(),
      ],
    );
  }
}
