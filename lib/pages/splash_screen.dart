// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daily_buzz/pages/error_occured.dart';
import 'package:daily_buzz/widgets/splash_screen/splash_screen_completion.dart';
import 'package:daily_buzz/widgets/splash_screen/splash_screen_loading.dart';
import 'package:daily_buzz/widgets/top_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> { 

  // API urls
  final String _techAPIUrl = "https://gnews.io/api/v4/top-headlines?category=technology&lang=en&apikey=53c20ad9d0b1d6ed7d9d97ad44d28b79";
  final String _businessAPIUrl = "https://gnews.io/api/v4/top-headlines?category=business&lang=en&apikey=53c20ad9d0b1d6ed7d9d97ad44d28b79";
  final String _scienceAPIUrl = "https://gnews.io/api/v4/top-headlines?category=science&lang=en&apikey=53c20ad9d0b1d6ed7d9d97ad44d28b79";
  
  // json variables
  Map<String, dynamic> _techJSON = {};
  Map<String, dynamic> _businessJSON = {};
  Map<String, dynamic> _scienceJSON = {};
  
  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if(connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
        backgroundColor: Theme.of(context).colorScheme.outline,
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ErrorOccured(
        imgName: 'no-internet.svg',
        redirectTo: SplashScreen(),
        showRetryButton: true,
      )));
    }
  }

  // Simulate an API call by using a Future.delayed
  Future<void> _simulateAPICall() async {
    // sending requests
    final techResponse = await http.get(Uri.parse(_techAPIUrl));
    final businessResponse = await http.get(Uri.parse(_businessAPIUrl));
    final scienceResponse = await http.get(Uri.parse(_scienceAPIUrl));

    // parsing through responses
    if(techResponse.statusCode == 200) {
      final techResponseData = json.decode(techResponse.body);
      _techJSON = techResponseData;
    }
    if(businessResponse.statusCode == 200) {
      final businessResponseData = json.decode(businessResponse.body);
      _businessJSON = businessResponseData;
    }
    if(scienceResponse.statusCode == 200) {
      final scienceResponseData = json.decode(scienceResponse.body);
      _scienceJSON = scienceResponseData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _simulateAPICall(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // API call is still in progress
            return const SplashScreenLoading();
          }
          else if (snapshot.hasError) {
            // API call encountered an error
            return const ErrorOccured(
              imgName: 'error.svg',
              redirectTo: SplashScreen(),
              showRetryButton: true,
            );
          }
          else {
            // API call completed successfully
            return SplashScreenCompletion(
              sendAPICall: () {
                _simulateAPICall();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TopBar(
                  techData: _techJSON,
                  businessData: _businessJSON,
                  scienceData: _scienceJSON,
                )));
              },
            );
          }
        },
      ),
    );
  }
}
