// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:firebase_ui_auth/firebase_ui_auth.dart'; // new

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // new

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'; // new
import 'app_state.dart'; // new
import 'home_page.dart';
import 'lang_page.dart';
import 'bubble_page.dart';
import 'testing_page.dart';
import 'onboarding_page.dart';
import 'report_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';



// Add GoRouter configuration outside the App class
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      //builder: (context, state) => const HomePage(),
       builder: (context, state) =>  OnboardingPage(
         pages: [
          OnboardingPageModel(
            title: ('onboading.title1').tr(),
            description:
                ('onboading.desc1').tr(),
            image: 'assets/image1.png',
            bgColor: Colors.indigo,
          ),
          OnboardingPageModel(
            title: 'Connect with your friends.',
            description: 'Connect with your friends anytime anywhere.',
            image: 'assets/image1.png',
            bgColor: const Color(0xff1eb090),
          ),
          OnboardingPageModel(
            title: 'Bookmark your favourites',
            description:
                'Bookmark your favourite quotes to read at a leisure time.',
            image: 'assets/image1.png',
            bgColor: const Color(0xfffeae4f),
          ),
          OnboardingPageModel(
            title: 'Follow creators',
            description: 'Follow your favourite creators to stay in the loop.',
            image: 'assets/image1.png',
            bgColor: Colors.purple,
          ),
        ],
       ),
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return SignInScreen(
              actions: [
                ForgotPasswordAction(((context, email) {
                  final uri = Uri(
                    path: '/sign-in/forgot-password',
                    queryParameters: <String, String?>{
                      'email': email,
                    },
                  );
                  context.push(uri.toString());
                })),
                AuthStateChangeAction(((context, state) {
                
                  final user = switch (state) {
                    SignedIn state => state.user,
                    UserCreated state => state.credential.user,
                    _ => null
                  };
                  if (user == null) {
                    return;
                  }


                  if (state is UserCreated) {
                    user.updateDisplayName(user.email!.split('@')[0]);
                  }
                  if (!user.emailVerified) {
                    user.sendEmailVerification();
                    const snackBar = SnackBar(
                        content: Text(
                            'Please check your email to verify your email address'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  context.pushReplacement('/');
                })),
              ],
            );
          },
          routes: [
            GoRoute(
              path: 'forgot-password',
              builder: (context, state) {
                final arguments = state.uri.queryParameters;
                return ForgotPasswordScreen(
                  email: arguments['email'],
                  headerMaxExtent: 200,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) {
            return ProfileScreen(
              providers: const [],
              actions: [
                SignedOutAction((context) {
                  context.pushReplacement('/');
                }),
              ],
            );
          },
        ),
        GoRoute(
          path: 'lang',
          builder: (BuildContext context, GoRouterState state) =>
              const LangPage(),
        ),
        GoRoute(
          path: 'bubble',
          builder: (BuildContext context, GoRouterState state) => BubblePage(),
        ),
        GoRoute(
          path: 'testing',
          builder: (BuildContext context, GoRouterState state) => TestingPage(),
        ),
        GoRoute(
          path: 'report',
          builder: (BuildContext context, GoRouterState state) => ReportPage(),
        ),
      ],
    ),
  ],
  debugLogDiagnostics: true,
);
// end of GoRouter configuration

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
   await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('de')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      useOnlyLangCode: true,
      child: ChangeNotifierProvider(
        create: (context) => ApplicationState(),
        builder: ((context, child) => const App()),
      )));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Firebase Meetup',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),

      routerConfig: _router, // new
    );
  }
}
