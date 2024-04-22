// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart'; // new

import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';

import 'package:do20_app/services/bubble_database.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'utils/water_drop.dart';


class BubblePage extends StatefulWidget {
  BubblePage({super.key});

  @override
  _BubblePageState createState() => _BubblePageState();
}

class _BubblePageState extends State<BubblePage> {
  bool _showText = true;
  bool _fetchedAlready = false;
  double _wav1 = 0.9;
  double _wav2 = 0.85;
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
    _fetchedAlready = true;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          if (mounted) {
            setState(() {
              timer.cancel();
            });
          }
        } else {
          if (mounted) {
            setState(() {
              _start--;
            });
          }
        }
      },
    );
  }

  void showDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height - 80,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  Center(
                      child: Container(
                          child: Text(
                    'reminder to put device on silent! Once started Do not go away from bubble screen or your bubble will burst. you are allowed to lock your phone :) . It will be autosaved',
                    style: TextStyle(height: 2, fontSize: 12),
                    // style: TextStyle(color: const Color.fromARGB(255, 14, 0, 0)),
                  ))),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "close",
                      // style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: startTimer,
                    child: Text(
                      "Start",
                      // style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Column(children: [
        Expanded(
            child: ListView(children: <Widget>[
          SizedBox(height: 26.0),
          Center(child: Text('You have pressed the button $_start  times.')),
          Center(
              child: Container(
                  child: Text(
            'fetched already? $_fetchedAlready',
            // style: TextStyle(color: const Color.fromARGB(255, 14, 0, 0)),
          ))),
          Align(
            child: Container(
              height: 128,
              width: 128,
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Color(0xFF9B5DE5),
                  blurRadius: 2.0,
                  spreadRadius: -5.0,
                  offset: Offset(0.0, 8.0),
                ),
              ]),
              child: WaterDrop(
                params: [
                  WaterDropParam(top: 0, height: 128, left: 0, width: 128),
                ],
                child: ClipOval(
                  child: WaveWidget(
                    config: CustomConfig(
                      colors: [
                        Color.fromARGB(255, 140, 189, 211),
                        Color.fromARGB(255, 18, 38, 57),
                      ],
                      durations: [
                        5000,
                        4000,
                      ],
                      heightPercentages: [
                        _wav1,
                        _wav2,
                      ],
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 151, 6),
                    size: Size(double.infinity, double.infinity),
                    waveAmplitude: 0,
                  ),
                ),
              ),
            ),
          ),
        ]))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: showDialog,
        tooltip: 'main.start_20_minutes_bubble'.tr(),
        child: const Icon(Icons.add),
      ),
    );

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
