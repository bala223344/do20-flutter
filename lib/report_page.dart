// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart'; // new



import 'package:do20_app/services/bubble_database.dart';

class ReportPage extends StatefulWidget {
  ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  bool _showText = true;
  List allRecs = [];

  @override
  void initState() {
    super.initState();
    print ("init state called");
    getData();
  }

  void getData() async {
    allRecs = (await DatabaseService().getAllBubbles())!;
    setState(() {});

    print('allRecs');
    print(allRecs);
  }

  void _toggleText() {
    setState(() {
      _showText = !_showText;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("WWWWWWWWT");

    return Container(
      child: Column(
        children: <Widget>[
          if (_showText) Text('REPOORORO you see me!'),
          ElevatedButton(
            onPressed: _toggleText,
            child: Text('Toggle Text'),
          ),
        ],
      ),


      
    );
  }
}
