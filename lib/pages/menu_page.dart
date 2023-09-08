// ignore_for_file: use_build_context_synchronously

import 'package:daily_buzz/theme/model_theme.dart';
import 'package:daily_buzz/theme/theme_preferences.dart';
import 'package:daily_buzz/widgets/menu/long_button.dart';
import 'package:daily_buzz/widgets/menu/mail_button.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
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

  // my LinkedIn profile url
  final Uri _linkedInUrl = Uri.parse('https://www.linkedin.com/in/syed-abdul-qadir-gillani/');
  
  // my GitHub profile url
  final Uri _gitHubUrl = Uri.parse('https://github.com/SAQG007');

  late String _appName;

  @override
  void initState() {
    super.initState();
    _setThemeValue();
    _getPackageInfo();
  }

  // get package info for accessing app name
  Future<void> _getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appName = packageInfo.appName;
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

  Future<void> _openSocialProfile(Uri profileLink) async {
    if(!await launchUrl(profileLink, mode: LaunchMode.externalApplication)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
            'Error while launching profile.',
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

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "About",
          ),
          content: Text(
            "$_appName is your go-to app for staying informed and up-to-date with the latest news and headlines. With a user-friendly interface and a choice between light and dark themes.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "OK",
              ),
            ),
          ],
        );
      }
    );
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _openSocialProfile(_linkedInUrl);
                        },
                        child: const LongButton(
                          title: "LinkedIn",
                          imgName: "linkedin.png",
                          bottomPosition: 0,
                          rightPosition: 0,
                          imgWidth: 70.0,
                          imgHeight: 70.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _openSocialProfile(_gitHubUrl);
                        },
                        child: const LongButton(
                          title: "GitHub",
                          imgName: "github.png",
                          bottomPosition: 8.0,
                          rightPosition: 8.0,
                          imgWidth: 55.0,
                          imgHeight: 55.0,
                        ),
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
                  GestureDetector(
                    onTap: _showAboutDialog,
                    child: const LongButton(
                      title: "About",
                      imgName: "question-mark.png",
                      bottomPosition: 0,
                      rightPosition: -9.0,
                      imgWidth: 70.0,
                      imgHeight: 70.0
                    ),
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
