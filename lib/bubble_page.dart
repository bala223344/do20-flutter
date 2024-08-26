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
import 'package:uuid/uuid.dart';

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
  double _wav1 = 20.9; //high values show blank
  double _wav2 = 20.95;

  late Timer _timer;
  // double _start = 1200.00; //1200 20 minustes
  // late double partWav1 = 0.00083; //1/1200
  // late double partWav2 = 0.00089;

  double _start = 60.00; //120 2 minustes
  late double partWav1 = 0.0083; //1/120
  late double partWav2 = 0.0089;

  // double _start = 12.00; //
  // late double partWav1 = 0.083; //1/120
  // late double partWav2 = 0.089;

  bool hasRecordsInLastHour = false;
  int recordsInLast24Hours = 0;
  int? timeRemaining;

  @override
  void initState() {
    super.initState();
    _checkUserRecords();
  }

  Future<void> _checkUserRecords() async {
    // Replace 'yourUserId' with the actual user ID you want to check
    String userId = 'yourUserId';

    // Call the checkUserRecords function
    var result = await DatabaseService().checkBubbleEligibility();

    setState(() {
      hasRecordsInLastHour = result['hasRecordsInLastHour'] ?? false;
      recordsInLast24Hours = result['recordsInLast24Hours'] ?? 0;
      timeRemaining = result['timeRemaining'] ?? null;
    });

    // Display warning message if there are records in the last hour
    if (hasRecordsInLastHour && timeRemaining != null) {
    //  _showWarningDialog();
    }
  }

  void startTimer() async {
    _wav1 = 0.9;
    _wav1 = 0.95;
    _fetchedAlready = true;
    const oneSec = Duration(seconds: 1);

    String documentId = Uuid().v4();
    var docRefFuture =
        await DatabaseService().addBubble(documentId: documentId);

    print("saveeed");

    print(documentId);
    // var docSnapshot = docRefFuture!.get();

    // docSnapshot.data()!;

    print("nothinging");

    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          if (mounted) {
            setState(() {
              _wav1 = -0.2; //fill it up
              _wav1 = -0.25; //fill it up
              DatabaseService().updateBubble(documentId: documentId);
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

  // void showDialog() {
  //   // DatabaseService().updateBubble(documentId: "d6923028-e6ae-4533-94ae-c189eca4f1a5");
  //   showGeneralDialog(
  //       context: context,
  //       barrierDismissible: true,
  //       barrierLabel:
  //           MaterialLocalizations.of(context).modalBarrierDismissLabel,
  //       barrierColor: Colors.black45,
  //       transitionDuration: const Duration(milliseconds: 200),
  //       pageBuilder: (BuildContext buildContext, Animation animation,
  //           Animation secondaryAnimation) {
  //         return Center(
  //           child: Container(
  //             width: MediaQuery.of(context).size.width - 10,
  //             height: MediaQuery.of(context).size.height - 80,
  //             padding: EdgeInsets.all(20),
  //             color: Colors.white,
  //             child: Column(
  //               children: [
  //                 Center(
  //                     child: Text(
  //                   'reminder to put device on silent! Once started Do not go away from bubble screen or your bubble will burst. you are allowed to lock your phone :) . It will be autosaved',
  //                   style: TextStyle(height: 2, fontSize: 12),
  //                   // style: TextStyle(color: const Color.fromARGB(255, 14, 0, 0)),
  //                 )),
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: Text(
  //                     "close",
  //                     // style: TextStyle(color: Colors.white),
  //                   ),
  //                 ),
  //                 ElevatedButton(
  //                   onPressed: startTimer,
  //                   child: Text(
  //                     "Start",
  //                     // style: TextStyle(color: Colors.white),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

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
          _start < 30000 && _start > 0 // < 300
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
          Center(
            child: Padding(
              padding: EdgeInsets.all(
                  16.0), // You can adjust the padding value as needed
              child: Text(
                'Reminder to put device on silent! Once started, DO NOT go away from this bubble screen or you will end up with a bursted bubble. You are allowed to lock your phone.  It will be autosaved once done(magic).',
                style: TextStyle(
                    height: 2,
                    fontSize: 12,
                    color: Color.fromARGB(213, 255, 252, 252)),
              ),
            ),
          )
        ]))
      ]),
      
      floatingActionButton: FloatingActionButton(
        onPressed: startTimer,
        tooltip: 'main.start_20_minutes_bubble'.tr(),
        child: const Icon(Icons.play_arrow),
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
