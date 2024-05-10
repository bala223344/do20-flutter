// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart'; // new
import 'package:easy_localization/easy_localization.dart';
import 'package:accordion/accordion.dart';

// ignore: must_be_immutable
class WhatIsdo20Page extends StatelessWidget {
  WhatIsdo20Page({super.key});
  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);

  List title = [
    'What is this app about?',
    'What can be done in 20 mins?',
    'Why pay for such trivial app?'
  ];
  List desc = [
    'Ok, You should have got the gist of this on the intro screen when you installed it. But if you missed it this app is definitely for you, you careless wanderer!.This app is designed to help you develop a habit of working for at least 20 minutes a day.',
    'Twenty minutes can be surprisingly productive! Start something on what you have been yearning for  a long time. Or do important stuff which could make your day slightly better. Or It can be learning a new thing, doing official work, doing a long term chore, reading a book. ',
    'All good things come at a cost hehe. Or People tend to value it less if it is free. Also we have a tiny team of bread winners who develop, maintain, add features and monitor your activities manually. And Oh God! Almost forgot the vital part. You don’t work if someone isn’t monitoring. Do you?. \n\n We will check on your reports from time to time and send you personalised pats on your back if you do well. Or try to cheer you up if you are quiet for a while. \n\n No AI or automated things. World is already filled with computer generated messages. In future if things go well for us we will send you personalised gifts however small it can be. \n\n Note  : You can try the app for free all the time. Just that it won’t store your data. Storing data in the cloud is the thing which costs us. \n\n Also there is no fun without seeing your report card. So go rock on the premium side (wink).'
  ];
  List icons = [Icons.app_shortcut_outlined, Icons.access_time, Icons.attach_money];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: const Text('main.what_is_do20',
                style:
                    TextStyle(fontFamily: 'Macondo', color: Color(0xFF14c614)))
            .tr(),
      ),
      body: Accordion(
        headerBorderColor: Colors.blueGrey,
        headerBorderColorOpened: Colors.transparent,
        // headerBorderWidth: 1,
        headerBackgroundColorOpened: Colors.green,
        contentBackgroundColor: Colors.white,
        contentBorderColor: Colors.green,
        contentBorderWidth: 3,
        contentHorizontalPadding: 20,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        children: [
          for (int i = 0; i < title.length; i++)
            AccordionSection(
              isOpen: true,
              contentVerticalPadding: 20,
              leftIcon:  Icon(icons[i], color: Colors.white),
              header: Text(title[i], style: headerStyle),
              content: Text(desc[i], style: contentStyle),
            ),
        ],
      ),
    );
  }
}
