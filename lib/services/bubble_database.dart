import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  Future<String?> updateBubble({required String documentId}) async {
    if (FirebaseAuth.instance.currentUser == null) {
      throw Exception('Must be logged in');
    }
    try {
      final docRef =
          FirebaseFirestore.instance.collection('bubbles').doc(documentId);

      //var data = prefObj.docs[0].data();
      docRef.update({'endedAt': DateTime.now().millisecondsSinceEpoch});
      //FirebaseFirestore.instance.collection('bubbles').add(data);

      // Call the user's CollectionReference to add a new user
    } catch (e) {
      print(e);
      print('Error adding user');
    }
    return null;
  }

  Future<DocumentReference?> addBubble({required String documentId}) async {
    if (FirebaseAuth.instance.currentUser == null) {
      throw Exception('Must be logged in');
    }
    try {
      var data = {
        'startedAt': DateTime.now().millisecondsSinceEpoch,
        'userId': FirebaseAuth.instance.currentUser?.uid
      };
      var docRef =
          FirebaseFirestore.instance.collection('bubbles').doc(documentId);
      await docRef.set(data);

      //FirebaseFirestore.instance.collection('bubbles').add(data);

      // Call the user's CollectionReference to add a new user
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

  Future<Map<String, dynamic>> checkBubbleEligibility() async {
    try {
      CollectionReference bubbles =
          FirebaseFirestore.instance.collection('bubbles');

      // Current time
      DateTime now = DateTime.now();

      // 1 hour ago
      DateTime oneHourAgo = now.subtract(Duration(hours: 1));

      // 24 hours ago
      DateTime twentyFourHoursAgo = now.subtract(Duration(hours: 24));

      // Query for records in the last hour
      var lastHourQuery = await bubbles
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .where('startedAt', isGreaterThanOrEqualTo: oneHourAgo)
          .orderBy('startedAt', descending: true)
          .get();

      // Query for records in the last 24 hours
      var last24HoursQuery = await bubbles
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .where('startedAt', isGreaterThanOrEqualTo: twentyFourHoursAgo)
          .get();

      // Number of records in the last hour
      int recordsInLastHour = lastHourQuery.docs.length;

      // Number of records in the last 24 hours
      int recordsInLast24Hours = last24HoursQuery.docs.length;

      // Get the latest timestamp if there are records in the last hour
      DateTime? latestTimestamp;
      if (recordsInLastHour > 0) {
        latestTimestamp =
            (lastHourQuery.docs.first['startedAt'] as Timestamp).toDate();
      }

      // Calculate the time remaining for 1 hour to elapse since the latest record
      Duration? timeRemaining;
      if (latestTimestamp != null) {
        timeRemaining = latestTimestamp.add(Duration(hours: 1)).difference(now);
      }

      return {
        'hasRecordsInLastHour': recordsInLastHour > 0,
        'recordsInLast24Hours': recordsInLast24Hours,
        'latestTimestamp': latestTimestamp,
        'timeRemaining': timeRemaining?.inMinutes, // Time remaining in minutes
      };
    } catch (e) {
      return {
        'hasRecordsInLastHour': false,
        'recordsInLast24Hours': 0,
        'latestTimestamp': null,
        'timeRemaining': null,
      };
    }
  }
}
