import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  final String imgLink;
  final String title;
  final String sourceName;
  final String sourceLink;

  const NewsCard({
    required this.imgLink,
    required this.title,
    required this.sourceName,
    required this.sourceLink,
    Key? key
  }) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    widget.imgLink,
                    height: 200,
                    width: 600,
                    fit: BoxFit.contain,
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
                      return Text(
                        "Error",
                        style: Theme.of(context).textTheme.labelLarge,
                      );
                    },
                  ),
                ),
                // Text(
                //   widget.imgLink,
                //   style: Theme.of(context).textTheme.labelLarge,
                // ),
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
                onPressed: () {},
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
