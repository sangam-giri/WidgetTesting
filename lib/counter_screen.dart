import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _count = 0;

  void _increaseCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'Increment',
        key: Key('increment-button'),
        onPressed: _increaseCounter,
      ),
      body: Center(
        child: Text(
          'Counter: $_count',
          key: Key('counter-text'),
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
