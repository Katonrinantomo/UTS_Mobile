import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profilePicture.jpg'),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text('Nama: Katon Rinantomo', style: TextStyle(fontSize: 24)),
            Text('NIM: 152022012', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
