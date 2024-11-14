import 'package:flutter/material.dart';

class LengthConversionPage extends StatefulWidget {
  @override
  _LengthConversionPageState createState() => _LengthConversionPageState();
}

class _LengthConversionPageState extends State<LengthConversionPage> {
  final TextEditingController _inputController = TextEditingController();
  String _result = '';
  String _selectedUnit = 'Meter to Centimeter';

  void _convertLength() {
    double input = double.parse(_inputController.text);
    double converted;

    switch (_selectedUnit) {
      case 'Meter to Centimeter':
        converted = input * 100;
        break;
      case 'Centimeter to Meter':
        converted = input / 100;
        break;
      case 'Meter to Kilometer':
        converted = input / 1000;
        break;
      case 'Kilometer to Meter':
        converted = input * 1000;
        break;
      default:
        converted = input;
    }

    setState(() {
      _result = 'Hasil: $converted';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Konversi Satuan Panjang')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              decoration: InputDecoration(labelText: 'Masukkan nilai'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: _selectedUnit,
              items: [
                'Meter to Centimeter',
                'Centimeter to Meter',
                'Meter to Kilometer',
                'Kilometer to Meter'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedUnit = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertLength,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text(_result, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
