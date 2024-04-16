// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart'; // new

import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';

import 'package:do20_app/services/bubble_database.dart';

class BubblePage extends StatefulWidget {
  BubblePage({super.key});

  @override
  _BubblePageState createState() => _BubblePageState();
}

class _BubblePageState extends State<BubblePage> {
  bool _showText = true;

  void _toggleText() async {
    await DatabaseService().addBubble(startedAt: Timestamp.now());
    print("saveeed");
    setState(() {
      _showText = !_showText;
    });
  }

  late Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec =  Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          if (_showText) Text('Now you see me!'),
          ElevatedButton(
       //     onPressed: _toggleText,
            onPressed: startTimer,
            child: Text('$_start'),
          ),
        ],
        
      ),
    );
  }
}
