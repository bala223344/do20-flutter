// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';           // new

import 'package:easy_localization/easy_localization.dart';





class LangPage extends StatelessWidget {
  const LangPage({super.key});


   @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
            margin: EdgeInsets.all(100),
            child: SizedBox(
                height: 500,
                child: Column(children: [
                  DropdownButton(
                    value: context.locale.toString(),
                    items: const [
                      DropdownMenuItem(
                        value: "en",
                        child: Text("English"),
                      ),
                      DropdownMenuItem(
                        value: "de",
                        child: Text("繁體中文"),
                      ),
                    ],
                    onChanged: (String? value) async {
                      if (value != null) {
                       // await context.setLocale(Locale(value));
                        await EasyLocalization.of(context)?.setLocale(Locale(value));
                        print ("done");
                        print (value);
                      }
                    },
                  ),
                  InkWell(onTap: () => {}, child: Text("edit".tr()))
                ])),
          ),
    );
  }

  // @override
  //  Widget  build (BuildContext context) {
    
  // // context.setLocale(Locale('de'));

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('example.gg').tr(),
  //     ),
  //     body: ListView(
  //       children: <Widget>[
  //         Image.asset('assets/codelab.png'),
  //         const SizedBox(height: 8),
  //         const IconAndDetail(Icons.calendar_today, 'October 30'),
  //         const IconAndDetail(Icons.location_city, 'San Francisco'),
  //          Consumer<ApplicationState>(
  //           builder: (context, appState, _) => AuthFunc(
  //               loggedIn: appState.loggedIn,
  //               signOut: () {
  //                 FirebaseAuth.instance.signOut();
  //               }),
  //         ),
  //         const Divider(
  //           height: 8,
  //           thickness: 1,
  //           indent: 8,
  //           endIndent: 8,
  //           color: Colors.grey,
  //         ),
  //         const Header("What we'll be doing"),
  //         const Paragraph(
  //           'Join us for a day full of Firebase Workshops and Piz999!',
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
