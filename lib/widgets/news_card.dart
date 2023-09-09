import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({Key? key}) : super(key: key);

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
                    "https://www.livemint.com/lm-img/img/2023/09/09/600x338/Realme_Narzo_60x_1693988636243_1694250576137.webp",
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const SizedBox(
                        height: 190,
                        width: 600,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Weekly Tech Recap: Jio celebrates 7th anniversary, Realme Narzo 60x launch, more",
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
                child: const Text(
                  "Mint",
                  style: TextStyle(
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
