import 'package:flutter/material.dart';
import 'dashboard.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Calculator App', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            CircleAvatar(
              backgroundImage: AssetImage('assets/profilePicture.jpg'),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text('NIM: 152022012'),
            Text('Nama: Katon Rinantomo'),
          ],
        ),
      ),
    );
  }
}
