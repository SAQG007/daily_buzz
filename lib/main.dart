import 'package:daily_buzz/theme/dark_theme.dart';
import 'package:daily_buzz/theme/light_theme.dart';
import 'package:daily_buzz/theme/model_theme.dart';
import 'package:daily_buzz/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
        builder: (context, ModelTheme modelTheme, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: modelTheme.isDarkTheme ? darkTheme : lightTheme,
            home: const TopBar(),
          );
        },
      ),
    );
  }
}
