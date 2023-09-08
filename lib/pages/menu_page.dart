// ignore_for_file: use_build_context_synchronously

import 'package:daily_buzz/theme/model_theme.dart';
import 'package:daily_buzz/theme/theme_preferences.dart';
import 'package:daily_buzz/widgets/menu/long_button.dart';
import 'package:daily_buzz/widgets/menu/mail_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

enum ThemeValue { light, dark, system }

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  ThemeValue? _themeValue = ThemeValue.light;

  // my mail address
  final String _mailAddress = "syedabdulqadirgillani807@gmail.com";

  @override
  void initState() {
    super.initState();
    _setThemeValue();
  }

  void _setThemeValue() async {
    ThemePreferences themePreferences = ThemePreferences();

    late bool isDarkThemeEnabled;
    isDarkThemeEnabled = await themePreferences.getTheme();

    isDarkThemeEnabled
    ? _themeValue = ThemeValue.dark
    : _themeValue = ThemeValue.light;
  }

  void _changeThemeValue(ModelTheme modelTheme) {
    _themeValue == ThemeValue.dark
    ? _themeValue = ThemeValue.light
    : _themeValue = ThemeValue.dark;

    _toggleTheme(modelTheme);
  }

  void _toggleTheme(ModelTheme modelTheme) {
    _themeValue == ThemeValue.dark
    ? modelTheme.isDark = true
    : modelTheme.isDark = false;
  }

  Future<void> _openMail() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: _mailAddress,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Daily Buzz Feedback',
      }),
    );

    if(await canLaunchUrl(emailLaunchUri)) {
      launchUrl(emailLaunchUri);
    }
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
            'Error while opening mail.',
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
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme modelTheme, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _openMail,
                    child: const MailButton(),
                  ),
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LongButton(
                        title: "LinkedIn",
                        imgName: "linkedin.png",
                        bottomPosition: 0,
                        rightPosition: 0,
                        imgWidth: 70.0,
                        imgHeight: 70.0,
                      ),
                      LongButton(
                        title: "GitHub",
                        imgName: "github.png",
                        bottomPosition: 8.0,
                        rightPosition: 8.0,
                        imgWidth: 55.0,
                        imgHeight: 55.0,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LongButton(
                    title: "About",
                    imgName: "question-mark.png",
                    bottomPosition: 0,
                    rightPosition: -9.0,
                    imgWidth: 70.0,
                    imgHeight: 70.0
                  ),
                  GestureDetector(
                    onTap: () {
                      _changeThemeValue(modelTheme);
                    },
                    child: const LongButton(
                      title: "Change Theme",
                      imgName: "theme.png",
                      bottomPosition: -8.0,
                      rightPosition: -6.0,
                      imgWidth: 90.0,
                      imgHeight: 90.0
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
