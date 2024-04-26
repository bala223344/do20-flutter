// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart'; // new

import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';

import 'package:do20_app/services/bubble_database.dart';
import 'package:easy_localization/easy_localization.dart';
import 'home_page.dart';

import 'onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeciderPage extends StatefulWidget {
  DeciderPage({super.key});

  @override
  _DeciderPageState createState() => _DeciderPageState();
}

class _DeciderPageState extends State<DeciderPage> {
  bool _is_first_run_completed = false;

  void _check_first_run() async {
    final Future<SharedPreferences> prefInstance =
        SharedPreferences.getInstance();

    final SharedPreferences prefs = await prefInstance;
    bool? firstOpen = prefs.getBool('_is_first_run_completed') ?? false;
    //set it if not there already
    if (!firstOpen) await prefs.setBool('_is_first_run_completed', true);

    setState(() {
      _is_first_run_completed = firstOpen;
    });
  }

  @override
  void initState() {
    super.initState();
    _check_first_run();
  }

  @override
  Widget build(BuildContext context) {


    if (_is_first_run_completed) {
      return HomePage();
    } else {
      return OnboardingPage(
        pages: [
          OnboardingPageModel(
            title: ('onboading.title1').tr(),
            description: ('onboading.desc1').tr(),
            image: 'assets/images/image1.png',
            bgColor: Colors.indigo,
          ),
          OnboardingPageModel(
            title: ('onboading.title2').tr(),
            description: ('onboading.desc2').tr(),
            image: 'assets/images/image1.png',
            bgColor: const Color(0xfffeae4f),
          ),
          OnboardingPageModel(
            title: ('onboading.title3').tr(),
            description: ('onboading.desc3').tr(),
            image: 'assets/images/logo/do20-colored.png',
            bgColor: const Color(0xff1eb090),
          ),
          OnboardingPageModel(
            title: ('onboading.title4').tr(),
            description: ('onboading.desc4').tr(),
            image: 'assets/images/logo/do20-colored.png',
            bgColor: Colors.purple,
          ),
        ],
      );
    }
  }
}
