import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balok Calculator',
      home: BalokCalculatorPage(),
    );
  }
}

class BalokCalculatorPage extends StatefulWidget {
  @override
  _BalokCalculatorPageState createState() => _BalokCalculatorPageState();
}

class _BalokCalculatorPageState extends State<BalokCalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  double _panjang = 0;
  double _lebar = 0;
  double _tinggi = 0;
  double _volume = 0;
  double _luasPermukaan = 0;

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _volume = _panjang * _lebar * _tinggi;
      _luasPermukaan =
          2 * (_panjang * _lebar + _panjang * _tinggi + _lebar * _tinggi);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('Balok Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Panjang',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                onSaved: (value) => _panjang = double.parse(value!),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Lebar',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                onSaved: (value) => _lebar = double.parse(value!),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tinggi',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                onSaved: (value) => _tinggi = double.parse(value!),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _calculate,
                child: Text('Calculate'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              ),
              SizedBox(height: 16),
              Text(
                'Volume: $_volume\nLuas Permukaan: $_luasPermukaan',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
