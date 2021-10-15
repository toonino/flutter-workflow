import 'dart:math';

import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';

class Work extends StatefulWidget {
  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {
  DateTime? selectedDate;

  Random random = new Random();

  @override
  void initState() {
    setState(() {
      selectedDate = DateTime.now();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        locale: 'en',
        onDateChanged: (value) => setState(() => selectedDate = value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
        // events: List.generate(
        //     100,
        //     (index) => DateTime.now()
        //         .subtract(Duration(days: index * random.nextInt(5)))),
      ),
      body: Center(child: Text(selectedDate.toString())),
    );
  }
}
