import 'package:daily_buzz/widgets/news_card.dart';
import 'package:flutter/material.dart';

class BusinessNews extends StatefulWidget {
  final Map<String, dynamic> businessData;

  const BusinessNews({
    required this.businessData,
    Key? key
  }) : super(key: key);

  @override
  _BusinessNewsState createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      itemCount: widget.businessData['articles'].length,
      itemBuilder: (context, index) {
        final article = widget.businessData['articles'][index];
        return NewsCard(
          imgLink: article['image'],
          title: article['title'],
          newsLink: article['url'],
          sourceName: article['source']['name'],
          sourceLink: article['source']['url'],
        );
      },
    );
  }
}
