import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseServiceUserPreferences {
  // Future<String?> addUser({
  //   required String fullName,
  //   required String age,
  //   required String email,
  // }) async {
  //   try {
  //     CollectionReference users =
  //         FirebaseFirestore.instance.collection('users');
  //     // Call the user's CollectionReference to add a new user
  //     await users.doc(email).set({
  //       'full_name': fullName,
  //       'age': age,fullName
  //     });
  //     return 'success';
  //   } catch (e) {
  //     return 'Error adding user';
  //   }
  // }



  Future<String?> addOrUpdatePref(
      {required String userId,
      required String key,
      required String val}) async {
    if (FirebaseAuth.instance.currentUser == null) {
      throw Exception('Must be logged in');
    }
    try {

      var prefObj = await FirebaseFirestore.instance
          .collection('user_preferences')
          .where("userId", isEqualTo: userId)
          .get();


      //must be 1 not > or <
      if (prefObj.docs.length == 1) {
        //var data = prefObj.docs[0].data();

        FirebaseFirestore.instance
            .collection('user_preferences')
            .doc(prefObj.docs[0].id)
            .set({key: val, 'updateAt': DateTime.now().millisecondsSinceEpoch});
      } else {
        var data = {
          'createdAt': DateTime.now().millisecondsSinceEpoch,
          'userId': FirebaseAuth.instance.currentUser?.uid,
          key: val
        };

        FirebaseFirestore.instance.collection('user_preferences').add(data);
      }

      // if (prefObj == null) {
      //   var data = {
      //     'startedAt': DateTime.now().millisecondsSinceEpoch,
      //     'userId': FirebaseAuth.instance.currentUser?.uid
      //   };
      // }
      // FirebaseFirestore.instance.collection('bubbles').add(data);

      // // Call the user's CollectionReference to add a new user

      return 'success';
    } catch (e) {
      print(e);
      print('Error adding user');
    }
    return null;
  }

  // Future<String?> getUser(String email) async {
  //   try {
  //     CollectionReference users =
  //         FirebaseFirestore.instance.collection('users');
  //     final snapshot = await users.doc(email).get();
  //     final data = snapshot.data() as Map<String, dynamic>;
  //     return data['full_name'];
  //   } catch (e) {
  //     return 'Error fetching user';
  //   }
  // }
  Future<List?> getAllBubbles() async {
    try {
      CollectionReference bubbles =
          FirebaseFirestore.instance.collection('bubbles');
      var docSnapshot = await bubbles.get();
      //   db.collection("bubbles").get().then(
      //   (querySnapshot) {
      //     print("Successfully completed");
      //     for (var docSnapshot in querySnapshot.docs) {
      //       print('${docSnapshot.id} => ${docSnapshot.data()}');
      //     }
      //   },
      //   onError: (e) => print("Error completing: $e"),
      // );
      // final snapshot = await users.doc(email).get();
      //  final data = snapshot.data() as Map<String, dynamic>;
      return docSnapshot.docs;
    } catch (e) {
      return [];
    }
  }
}
