import 'package:flutter/material.dart';

class ScienceNews extends StatefulWidget {
  const ScienceNews({ Key? key }) : super(key: key);

  @override
  _ScienceNewsState createState() => _ScienceNewsState();
}

class _ScienceNewsState extends State<ScienceNews> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Science News",
      ),
    );
  }
}
