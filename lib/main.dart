import 'package:flutter/material.dart';
import 'color_oscilloscope.dart';
import 'value_adjuster.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Shell(),
    );
  }
}

class Shell extends StatefulWidget {
  @override
  _ShellState createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  double counter = 0;
  double counter2 = 0;
  double lowThreshold = 2;
  double highThreshold = 4;

  void _incrementCounter(double power) {
    setState(() {
      counter += power;
      Future.delayed(const Duration(seconds: 1), () {
        counter2 += power;
      });
    });
  }

  void _decrementCounter(double power) {
    setState(() {
      counter -= power;
      Future.delayed(const Duration(seconds: 1), () {
        counter2 -= power;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            height: 50,
            color: Colors.green,
          ),

          // Body
          Expanded(
            child: Row(
              children: [
                // Column for the Oscilloscopes
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ColorOscilloscope(
                            name: 'External Sensor Data',
                            counterValue: counter,
                            lowThreshold: lowThreshold,
                            highThreshold: highThreshold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Expanded(
                          child: ColorOscilloscope(
                            name: 'Internal Sensor Data',
                            counterValue: counter2,
                            lowThreshold: lowThreshold,
                            highThreshold: highThreshold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Footer
          Container(
            height: 50,
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ValueAdjuster(
                  label: 'Counter Value',
                  value: counter,
                  changeBy: 0.25,
                  onIncrement: _incrementCounter,
                  onDecrement: _decrementCounter,
                  showSign: true,
                ),
                ValueAdjuster(
                  label: 'Low Threshold',
                  value: lowThreshold,
                  changeBy: 0.25,
                  onIncrement: (value) => setState(() => lowThreshold += value),
                  onDecrement: (value) => setState(() => lowThreshold -= value),
                ),
                ValueAdjuster(
                  label: 'High Threshold',
                  value: highThreshold,
                  changeBy: 0.25,
                  onIncrement: (value) =>
                      setState(() => highThreshold += value),
                  onDecrement: (value) =>
                      setState(() => highThreshold -= value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
