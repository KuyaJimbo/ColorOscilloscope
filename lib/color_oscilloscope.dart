// color_oscilloscope.dart

import 'package:flutter/material.dart';
import 'package:oscilloscope/oscilloscope.dart';

class ColorOscilloscope extends StatefulWidget {
  final String name;
  final double counterValue;
  final double lowThreshold;
  final double highThreshold;

  ColorOscilloscope({
    required this.name,
    required this.counterValue,
    required this.lowThreshold,
    required this.highThreshold,
  });

  @override
  _ColorOscilloscopeState createState() => _ColorOscilloscopeState();
}

class _ColorOscilloscopeState extends State<ColorOscilloscope> {
  List<double> countListG = [];
  List<double> countListO = [];
  List<double> countListR = [];
  List<double> countListW = [];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(milliseconds: 60), () {
      if (mounted) {
        _addToCountList();
        _startTimer();
      }
    });
  }

  void _addToCountList() {
    setState(() {
      double value = widget.counterValue;
      countListG.add(value.abs() < widget.lowThreshold ? value : 0);
      countListO.add(value.abs() >= widget.lowThreshold &&
              value.abs() < widget.highThreshold
          ? value
          : 0);
      countListR.add(value.abs() >= widget.highThreshold ? value : 0);
      countListW.add(0);

      // Keep the lists at a reasonable size
      if (countListG.length > 500) {
        countListG.removeAt(0);
        countListO.removeAt(0);
        countListR.removeAt(0);
        countListW.removeAt(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.name),
        Expanded(
          child: Stack(
            children: [
              _buildOscilloscope(Colors.green, countListG),
              _buildOscilloscope(Colors.orange, countListO),
              _buildOscilloscope(Colors.red, countListR),
              _buildOscilloscope(Colors.white, countListW),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOscilloscope(Color color, List<double> dataSet) {
    return Oscilloscope(
      showYAxis: true,
      yAxisColor: Colors.white,
      margin: const EdgeInsets.all(20.0),
      strokeWidth: 3.0,
      backgroundColor:
          color == Colors.green ? Colors.black : Colors.transparent,
      traceColor: color,
      yAxisMax: 5,
      yAxisMin: -5,
      dataSet: dataSet,
    );
  }
}
