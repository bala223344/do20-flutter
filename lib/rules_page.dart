// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart'; // new
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class RulesPage extends StatelessWidget {
  RulesPage({super.key});

  static const headerStyle = TextStyle(color: Colors.white70);
  static const contentStyle = TextStyle(color: Colors.white);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(0, 32, 35, 43),
              title: const Text('main.what_are_the_rules',
                      style: TextStyle(
                          fontFamily: 'Macondo', color: Color(0xFF14c614)))
                  .tr(),
            ),
            body: ListView(
              children: <Widget>[
                SizedBox(height: 20.0), // Adjust width as needed
                Center(
                  child: Card(
                    color: Color.fromARGB(
                        0, 21, 23, 27), // Set background color for the Card
                    elevation: 8.0, // Adjust elevation as desired
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Customize corner radius
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          16.0), // Adjust padding as desired
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align content left
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Center(
                                child: Card(
                              color: Color.fromARGB(0, 21, 23,
                                  27), // Set background color for the Card
                              elevation: 8.0, // Adjust elevation as desired
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Customize corner radius
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "rules.title",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontStyle: FontStyle.italic),
                                ).tr(),
                              ),
                            )),
                          ),
                          const SizedBox(
                              height:
                                  8.0), // Add spacing between title and description

                          Column(
                            children: [
                              Text(
                                "rules.1",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ).tr(),
                              const Divider(
                                // Add a horizontal line
                                height: 28.0, // Adjust line thickness (optional)
                                color:
                                    Colors.grey, // Adjust line color (optional)
                                thickness:
                                    1.0, // Adjust line thickness (optional)
                              ),
                              Text(
                                "rules.2",
                                style: TextStyle(color: Colors.white70),
                              ).tr(),
                            ],
                          ),
                          const SizedBox(
                              height:
                                  8.0), // Add spacing between title and description
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
