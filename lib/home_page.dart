// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:firebase_auth/firebase_auth.dart' // new
    hide
        EmailAuthProvider,
        PhoneAuthProvider; // new
import 'package:flutter/material.dart'; // new
import 'package:provider/provider.dart'; // new

import 'src/widgets.dart';
import 'app_state.dart'; // new
import 'src/authentication.dart'; // new

import 'package:easy_localization/easy_localization.dart';

import 'package:go_router/go_router.dart';
import 'package:do20_app/services/user_pref.dart';
import 'utils/thermo.dart';
import 'utils/square.dart';
import 'what_is_do20_about.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // context.setLocale(Locale('de'));
    //final FirebaseAuth auth = FirebaseAuth.instance;
    // final User? user = auth.currentUser;
    //  print(user);
    UserPreferenceService().setInitialPref();

    return SafeArea(child:
      Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0), // Adjust width as needed
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the logo horizontally
            children: [
              Image.asset(
                'assets/images/logo/do20-black-bg.png',
                width: 150,
              ), // Replace with your logo path
            ],
          ),
          SizedBox(height: 20.0), // Adjust width as needed

          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blueAccent, // Make background transparent
                shadowColor: Color.fromARGB(0, 32, 35, 43), // Remove button shadow
              ),
              onPressed: () => context.go('/testing'),
              child: HorizontalThermometer(),
            ),
          ),
          Center(
              child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WhatIsdo20()),
              );
            },
            splashColor: Colors.lightBlueAccent,
            child: Text(
              'Tap to go to Second Widget',
              style: TextStyle(
                shadows: [Shadow(color: Colors.red, offset: Offset(0, -5))],
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
                decorationThickness: 2,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ), // Set your desired ripple color
          )
          ),
          TwoRowTwoColumnLayout(),

          // const IconAndDetail(Icons.calendar_today, 'October 30'),
          // const IconAndDetail(Icons.location_city, 'San Francisco'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => AuthFunc(
                loggedIn: appState.loggedIn,
                signOut: () {
                  FirebaseAuth.instance.signOut();
                }),
          ),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const Header("What we'll be doing"),
          const Paragraph(
            'Join us for a day full of Firebase Workshops and Piz999!',
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => context.go('/lang'),
              child: const Text('lang'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => context.go('/bubble'),
              child: const Text('bubble pagei'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => context.go('/report'),
              child: const Text('report page'),
            ),
          ),

          Center(
            child: ElevatedButton(
              onPressed: () => context.go('/profile'),
              child: const Text('profile'),
            ),
          )
        ],
      ),
    
      )
      )
    ;
  }
}
