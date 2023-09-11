import 'package:daily_buzz/pages/error_occured.dart';
import 'package:daily_buzz/widgets/news_card.dart';
import 'package:flutter/material.dart';

class TechNews extends StatefulWidget {
  final Map<String, dynamic> techData;

  const TechNews({
    required this.techData,
    Key? key
  }) : super(key: key);

  @override
  _TechNewsState createState() => _TechNewsState();
}

class _TechNewsState extends State<TechNews> {
  @override
  Widget build(BuildContext context) {
    return widget.techData['articles'] != null
    ? ListView.builder(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      itemCount: widget.techData['articles'].length,
      itemBuilder: (context, index) {
        final article = widget.techData['articles'][index];
        return NewsCard(
          imgLink: article['image'],
          title: article['title'],
          description: article['description'],
          newsLink: article['url'],
          sourceName: article['source']['name'],
          sourceLink: article['source']['url'],
        );
      },
    )
    : const ErrorOccured(
      imgName: 'no-data.svg',
      showRetryButton: false,
    );
  }
}
