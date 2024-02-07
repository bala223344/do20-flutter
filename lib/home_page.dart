// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:firebase_auth/firebase_auth.dart' // new
    hide EmailAuthProvider, PhoneAuthProvider;    // new
import 'package:flutter/material.dart';           // new
import 'package:provider/provider.dart';          // new

import 'src/widgets.dart';
import 'app_state.dart';                          // new
import 'src/authentication.dart';                 // new

import 'package:easy_localization/easy_localization.dart';

import 'package:go_router/go_router.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
   Widget  build (BuildContext context) {
    
  // context.setLocale(Locale('de'));



    return Scaffold(
      appBar: AppBar(
        title: const Text('example.helloWorld').tr(),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('assets/codelab.png'),
          const SizedBox(height: 8),
          const IconAndDetail(Icons.calendar_today, 'October 30'),
          const IconAndDetail(Icons.location_city, 'San Francisco'),
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
           )
        ],
      ),
    );
  }
}
