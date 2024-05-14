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
      color: Colors.white70);
  static const contentStyleHeader = TextStyle(
      color: Colors.white70);
  static const contentStyle = TextStyle(
      color: Colors.white);

  List title = [
    'instructions.what_is_this_about',
    'instructions.what_can_be_done',
    'instructions.why_pay'
  ];
  List desc = [
    'instructions.what_is_this_about_desc',
    'instructions.what_can_be_done_desc',
    'instructions.why_pay_desc'
  ];
  List icons = [Icons.app_shortcut_outlined, Icons.access_time, Icons.attach_money];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
                  backgroundColor: Color.fromARGB(0, 32, 35, 43),
      
          title: const Text('main.what_is_do20',
                  style:
                      TextStyle(fontFamily: 'Macondo', color: Color(0xFF14c614)))
              .tr(),
        ),
        body: Accordion(
          headerBorderColor: Color.fromRGBO(28, 28, 29, 1),
          headerBorderColorOpened: Color.fromRGBO(28, 28, 29, 1),
          contentBorderRadius:0,
          headerBackgroundColorOpened: Color.fromRGBO(51, 51, 51, 1),
          contentBackgroundColor: Color.fromRGBO(28, 28, 29, 1),
          headerBackgroundColor:Color.fromRGBO(19, 19, 20, 1),
          contentBorderColor: Color.fromRGBO(28, 28, 29, 1),
          contentBorderWidth: 0,
          contentHorizontalPadding: 20,
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          children: [
            for (int i = 0; i < title.length; i++)
              AccordionSection(
                isOpen: true,
                contentVerticalPadding: 20,
                leftIcon:  Icon(icons[i], color: Colors.white70),
                header: Text(title[i], style: headerStyle).tr(),
                content: Text(desc[i], style: contentStyle).tr(),
              ),
          ],
        ),
      ),
    );
  }
}
