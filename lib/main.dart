import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Flutter Calculator App';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';

  void _calculateResult(String operation) {
    setState(() {
      final num1 = double.tryParse(_num1Controller.text) ?? 0.0;
      final num2 = double.tryParse(_num2Controller.text) ?? 0.0;
      switch (operation) {
        case '+':
          _result = (num1 + num2).toStringAsFixed(2);
          break;
        case '-':
          _result = (num1 - num2).toStringAsFixed(2);
          break;
        case '*':
          _result = (num1 * num2).toStringAsFixed(2);
          break;
        case '/':
          if (num2 == 0) {
            _result = 'Erro ao dividir por zero!';
          } else {
            _result = (num1 / num2).toStringAsFixed(2);
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Digite o primeiro número'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Digite o segundo número'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _calculateResult('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculateResult('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculateResult('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculateResult('/'),
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $_result',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}