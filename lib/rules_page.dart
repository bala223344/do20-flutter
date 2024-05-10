// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';           // new
import 'package:easy_localization/easy_localization.dart';
import 'package:accordion/accordion.dart';




class RulesPage extends StatelessWidget {
  const RulesPage({super.key});


    // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AccordionPage(),
    );
  }
}

/// Main example page
class AccordionPage extends StatelessWidget //__
{
  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  static const loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';
  static const slogan =
      'Do not forget to play around with all sorts of colors, backgrounds, borders, etc.';

  const AccordionPage({super.key});

  @override
  build(context) => Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: const Text('Accordion'),
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
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          children: [
            AccordionSection(
              isOpen: true,
              contentVerticalPadding: 20,
              leftIcon:
                  const Icon(Icons.text_fields_rounded, color: Colors.white),
              header: const Text('Simple Text', style: headerStyle),
              content: const Text(loremIpsum, style: contentStyle),
            ),
           
           
            AccordionSection(
              isOpen: false,
              leftIcon:
                  const Icon(Icons.circle_outlined, color: Colors.black54),
              rightIcon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black54,
                size: 20,
              ),
              headerBackgroundColor: Colors.transparent,
              headerBackgroundColorOpened: Colors.amber,
              headerBorderColor: Colors.black54,
              headerBorderColorOpened: Colors.black54,
              headerBorderWidth: 1,
              contentBackgroundColor: Colors.amber,
              contentBorderColor: Colors.black54,
              contentBorderWidth: 1,
              contentVerticalPadding: 30,
              header: const Text('Custom: Header with Border',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  const Flexible(
                    child: Text(
                      slogan,
                      maxLines: 4,
                      style: TextStyle(color: Colors.black45, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.circle, color: Colors.white),
              headerBackgroundColor: Colors.deepOrange,
              headerBackgroundColorOpened: Colors.brown,
              headerBorderWidth: 1,
              contentBackgroundColor: Colors.brown,
              contentBorderWidth: 0,
              contentVerticalPadding: 30,
              header: const Text('Custom: Other Colors', style: headerStyle),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  const Flexible(
                    child: Text(
                      slogan,
                      maxLines: 4,
                      style: TextStyle(color: Colors.white54, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.circle, color: Colors.white),
              headerBackgroundColor: Colors.green[900],
              headerBackgroundColorOpened: Colors.lightBlue,
              headerBorderColorOpened: Colors.yellow,
              headerBorderWidth: 10,
              contentBackgroundColor: Colors.lightBlue,
              contentBorderColor: Colors.yellow,
              contentBorderWidth: 10,
              contentVerticalPadding: 30,
              header: const Text('Custom: Heavy Borders', style: headerStyle),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  const Flexible(
                    child: Text(
                      slogan,
                      maxLines: 4,
                      style: TextStyle(color: Colors.white54, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.circle, color: Colors.white),
              headerBorderRadius: 30,
              headerBackgroundColor: Colors.purple,
              headerBackgroundColorOpened: Colors.purple,
              headerBorderColorOpened: Colors.white,
              headerBorderWidth: 2,
              contentBackgroundColor: Colors.purple,
              contentBorderColor: Colors.white,
              contentBorderWidth: 2,
              contentBorderRadius: 100,
              contentVerticalPadding: 30,
              header: const Text('Custom: Very Round', style: headerStyle),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  const Flexible(
                    child: Text(
                      slogan,
                      maxLines: 4,
                      style: TextStyle(color: Colors.white54, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.circle, color: Colors.white),
              headerBorderRadius: 0,
              headerBackgroundColor: Colors.black87,
              headerBackgroundColorOpened: Colors.black87,
              headerBorderColorOpened: const Color(0xffaaaaaa),
              headerBorderWidth: 1,
              contentBackgroundColor: Colors.black54,
              contentBorderColor: const Color(0xffaaaaaa),
              contentBorderWidth: 1,
              contentBorderRadius: 0,
              contentVerticalPadding: 30,
              header: const Text('Android', style: headerStyle),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  const Flexible(
                    child: Text(
                      slogan,
                      maxLines: 4,
                      style: TextStyle(color: Colors.white54, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
 //__  
}