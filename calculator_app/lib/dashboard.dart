import 'package:flutter/material.dart';
import 'bmi_calculator.dart';
import 'calculator.dart';
import 'length_conversion.dart';
import 'about.dart';
import 'profile.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),               // Halaman utama Dashboard
    BMICalculator(),          // Halaman BMI Calculator
    Calculator(),             // Halaman Kalkulator
    LengthConversionPage(),   // Halaman Konversi Panjang
    AboutPage(),              // Halaman Tentang
    Profile(),                // Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculate-inator')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'BMI Calculator'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: 'Calculator'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Konversi Panjang'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.blue[900], // Mengubah warna latar belakang menjadi biru tua
        selectedItemColor: Colors.blue[900],   // Warna item yang dipilih menjadi putih
        unselectedItemColor: Colors.grey,  // Warna item yang tidak dipilih menjadi abu-abu
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Selamat datang di Aplikasi Calculator!',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
