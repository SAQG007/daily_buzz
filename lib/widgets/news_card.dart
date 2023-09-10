// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatefulWidget {
  final String imgLink;
  final String title;
  final String newsLink;
  final String sourceName;
  final String sourceLink;

  const NewsCard({
    required this.imgLink,
    required this.title,
    required this.newsLink,
    required this.sourceName,
    required this.sourceLink,
    Key? key
  }) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {

  Future<void> _openLink(Uri link) async {    
    if(!await launchUrl(link, mode: LaunchMode.externalApplication)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
            'Error while opening link.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              final Uri newsLink = Uri.parse(widget.newsLink);
              _openLink(newsLink);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    widget.imgLink,
                    height: 200,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const SizedBox(
                        height: 200,
                        width: 600,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/images/error/error-image.png",
                        width: 600,
                        height: 200,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  widget.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "Source: ",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              TextButton(
                onPressed: () {
                  final Uri newsSourceLink = Uri.parse(widget.sourceLink);
                  _openLink(newsSourceLink);
                },
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: MaterialStatePropertyAll(Size(0, 0)),
                ),
                child: Text(
                  widget.sourceName,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
                iconSize: 18,
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
