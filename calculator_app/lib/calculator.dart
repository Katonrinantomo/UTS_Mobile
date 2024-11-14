import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _display = '0'; // Menampilkan angka atau ekspresi saat ini
  String _expression = ''; // Menyimpan ekspresi yang akan dihitung

  // Fungsi untuk menambah angka atau operasi ke dalam ekspresi
  void _onPressed(String value) {
    setState(() {
      if (_display == '0') {
        _display = value;
      } else {
        _display += value;
      }
    });
  }

  // Fungsi untuk menghitung hasil ekspresi
  void _calculateResult() {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(_display);
      ContextModel cm = ContextModel();
      double result = expression.evaluate(EvaluationType.REAL, cm);

      setState(() {
        _display = result.toString();
      });
    } catch (e) {
      setState(() {
        _display = 'Error';
      });
    }
  }

  // Fungsi untuk menghapus layar kalkulator
  void _clearDisplay() {
    setState(() {
      _display = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Display area
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              _display,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          // Numeric and operations buttons
          Expanded(
            child: Column(
              children: [
                _buildButtonRow(['7', '8', '9', '/']),
                _buildButtonRow(['4', '5', '6', '*']),
                _buildButtonRow(['1', '2', '3', '-']),
                _buildButtonRow(['0', '.', '=', '+']),
              ],
            ),
          ),
          // Clear button row
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _clearDisplay,
                  child: Text('C', style: TextStyle(fontSize: 24)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function to build rows of buttons
  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((buttonText) {
          return Expanded(
            child: ElevatedButton(
              onPressed: () {
                if (buttonText == '=') {
                  _calculateResult();
                } else {
                  _onPressed(buttonText);
                }
              },
              child: Text(buttonText, style: TextStyle(fontSize: 24)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
