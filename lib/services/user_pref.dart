import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:do20_app/services/user_preference_database.dart';

class UserPreferenceService {
  Future<void> setInitialPref() async {
    final Future<SharedPreferences> prefInstance =
        SharedPreferences.getInstance();

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user?.uid != null) {
      final SharedPreferences prefs = await prefInstance;
      String? lang = prefs.getString('lang') ?? '';
     // var rec = await DatabaseServiceUserPreferences()
       //   .addOrUpdatePref(userId: user!.uid, );

      print("printing langggg");
      print(lang);

      if (lang == '') {
        //  prefs.setString('lang', 'en');
      }
    }
  }
}
