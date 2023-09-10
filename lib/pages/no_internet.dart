import 'package:daily_buzz/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({ Key? key }) : super(key: key);

  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/illustrations/no-internet.png',
                width: 350.0,
                height: 350.0,
              ),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SplashScreen()));
                  },
                  label: const Text("Retry"),
                  icon: const Icon(Icons.refresh_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
