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
  // double _wav1 = 0.1; // bottom
  // double _wav2 = 0.15;
  double _wav1 = 0.9; // bottom
  double _wav2 = 0.95;
  void _toggleText() async {
    await DatabaseService().addBubble(startedAt: Timestamp.now());
    print("saveeed");
    setState(() {
      _showText = !_showText;
    });
  }

  late Timer _timer;
  double _start = 1200.00; //1200 20 minustes
  late double partWav1 = 0.00083;
  late double partWav2 = 0.00089;

  void startTimer() async {
    _fetchedAlready = true;
    const oneSec = Duration(seconds: 1);
     await DatabaseService().addBubble(startedAt: Timestamp.now()); //don't wait up
    _timer = Timer.periodic(
      oneSec,
      (Timer timer)  {
        if (_start == 0) {
          if (mounted) {
            setState(() {
              _wav1 = -0.2;
              _wav1 = -0.25;
              timer.cancel();
              print("saving records! done");
            });
          }
        } else {
          if (mounted) {
            
            setState(() {
             
              _start--;
              partWav1 = (_wav1 / _start);
              partWav2 = (_wav2 / _start);
              _wav1 -= partWav1;
              _wav2 -= partWav2;
              
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
                      child: Text(
                    'reminder to put device on silent! Once started Do not go away from bubble screen or your bubble will burst. you are allowed to lock your phone :) . It will be autosaved',
                    style: TextStyle(height: 2, fontSize: 12),
                    // style: TextStyle(color: const Color.fromARGB(255, 14, 0, 0)),
                  )),
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
          _start < 300 && _start > 0
              ? Center(child: Text('n $_start  times.'))
              : Container(),
          Center(
              child: Text(
            'fetched already? $_fetchedAlready',
            // style: TextStyle(color: const Color.fromARGB(255, 14, 0, 0)),
          )),
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
              child: ClipOval(
                child: WaveWidget(
                  config: CustomConfig(
                    colors: [
                      Colors.blue[300]!.withOpacity(0.5),
                      Colors.cyan[400]!.withOpacity(0.5)
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
                  backgroundImage: DecorationImage(
                    image: AssetImage(
                        'assets/images/image1.png'), // Replace with your image
                    fit: BoxFit.cover, // Adjust fit as desired
                  ),
                  size: Size(double.infinity, double.infinity),
                  waveAmplitude: 0,
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
