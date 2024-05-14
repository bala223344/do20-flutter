// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart'; // new
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'what_is_do20_about_page.dart';
import 'rules_page.dart';
import 'tips_page.dart';

// ignore: must_be_immutable
class RulesAndInfoLinks extends StatelessWidget {
  RulesAndInfoLinks({super.key});

  List title = [
    'main.what_is_do20',
    'main.what_are_the_rules',
    'main.some_awesome_tips'
  ];
  List desc = [WhatIsdo20Page(), RulesPage(), TipsPage()];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 32, 35, 43),
        title: const Text('main.rules_and_info',
                style:
                    TextStyle(fontFamily: 'Macondo', color: Color(0xFF14c614)))
            .tr(),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0), // Adjust width as needed
          for (int i = 0; i < title.length; i++)
          Center(
            child: Card(
              color: Color.fromARGB(0, 21, 23, 27), // Set background color for the Card

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => desc[i]),
                        )
                      },
                      child: Row(
                        children: [
                          // First column: 10% width
                          Flexible(
                            flex: 1, // Allocate 1 flex unit (out of 10)
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Center(),
                            ),
                          ),

                          // Middle column: remaining space
                          Flexible(
                            flex:
                                8, // Allocate 8 flex units (out of 10) for most space
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .start, // Left-align elements

                              children: [
                                Center(
                                  child: Text(
                                    title[i],
                                    style: TextStyle(color: Colors.white70),
                                  ).tr(),
                                ),
                              ],
                            ),
                          ),

                          // Last column: 10% width
                          Flexible(
                            flex: 1, // Allocate 1 flex unit (out of 10)
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Center(
                                child: Icon(Icons.arrow_circle_right,
                                    color: Colors.white70),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
  
                ],
              ),
            ),
          ),
        
         
          
        ],
      ),
    ));
  }
}
