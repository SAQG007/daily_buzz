import 'package:daily_buzz/pages/error_occured.dart';
import 'package:daily_buzz/widgets/news_card.dart';
import 'package:flutter/material.dart';

class ScienceNews extends StatefulWidget {
  final Map<String, dynamic> scienceData;

  const ScienceNews({
    required this.scienceData,
    Key? key
  }) : super(key: key);

  @override
  _ScienceNewsState createState() => _ScienceNewsState();
}

class _ScienceNewsState extends State<ScienceNews> {
  @override
  Widget build(BuildContext context) {
    return widget.scienceData['articles'] != null
    ? ListView.builder(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      itemCount: widget.scienceData['articles'].length,
      itemBuilder: (context, index) {
        final article = widget.scienceData['articles'][index];
        return NewsCard(
          imgLink: article['image'],
          title: article['title'],
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
