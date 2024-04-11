// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';           // new


import 'package:cloud_firestore/cloud_firestore.dart';




import 'package:do20_app/services/bubble_database.dart';

class BubblePage extends StatefulWidget {
  BubblePage({super.key});
    
  @override
  _BubblePageState createState() => _BubblePageState();

      
}
 class _BubblePageState extends State<BubblePage> {
      bool _showText = true;
    
      void  _toggleText() async {

        await DatabaseService().addBubble(startedAt: Timestamp.now());
        print ("saveeed");
        setState(() {
          _showText = !_showText;
        });
      }
    
      @override
      Widget build(BuildContext context) {
        return Container(
          child: Column(
            children: <Widget>[
              if (_showText)
                Text('Now you see me!'),
              ElevatedButton(
                onPressed: _toggleText,
                child: Text('Toggle Text'),
              ),
            ],
          ),
        );
      }
    }
  
