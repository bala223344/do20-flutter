import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
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

  Future<String?> addBubble({
    required Timestamp startedAt,
  }) async {
    if (FirebaseAuth.instance.currentUser == null) {
      throw Exception('Must be logged in');
    }
    try {
     
    
      var data = {
        'startedAt': DateTime.now().millisecondsSinceEpoch,
        'userId': FirebaseAuth.instance.currentUser?.uid
      };
      var docRef = FirebaseFirestore.instance.collection('bubbles').add(data);
       print("adding bubble");
      print(docRef);

      // Call the user's CollectionReference to add a new user

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
