import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Faktorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FactorialCalculator(),
    );
  }
}

class FactorialCalculator extends StatefulWidget {
  const FactorialCalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FactorialCalculatorState createState() => _FactorialCalculatorState();
}

class _FactorialCalculatorState extends State<FactorialCalculator> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  // Fungsi untuk menghitung faktorial
  int factorial(int n) {
    if (n == 0 || n == 1) {
      return 1;
    } else {
      return n * factorial(n - 1);
    }
  }

  // Fungsi untuk menghitung dan menampilkan hasil
  void _calculateFactorial() {
    int? number = int.tryParse(_controller.text);
    if (number == null || number < 0) {
      setState(() {
        _result = 'Masukkan angka positif yang valid.';
      });
    } else {
      int result = factorial(number);
      setState(() {
        _result = 'Faktorial dari $number adalah $result';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Faktorial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan angka',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateFactorial,
              child: const Text('Hitung Faktorial'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
