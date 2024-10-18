import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class APIs {
  // static FirebaseAuth auth = FirebaseAuth.instance;
  // static User get user=> auth.currentUser!;                          //google user
  // static FirebaseFirestore firestore = FirebaseFirestore.instance;
  // static ChatUser? me;  //my info
  // static SemViseSubject? semSubjectName;
  // static SpecificSubject? allSubject;                              //no usage
  // static final user_uid = auth.currentUser!.uid;

//--------------FETCH ALL SUBJECTS DATA AND STORE IT INTO LOCAL STORAGE--------------------------------------------//
  static Future<void> fetchAllHeads() async {
    log("hello a");
    try {
      log("hello b");
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Effervescence clubs')
          .get();

      for (var doc in querySnapshot.docs) {
        try {
          var jsonData = doc.data();
          log('Document Data: $jsonData');
        } catch (e) {
          log('Error while parsing document: $e');
        }
      }
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.message}');
    } catch (e) {
      log('Error fetching documents: $e');
    }

  }


//--------------FETCH ALL SUBJECTS Name Based on the Semester AND STORE IT INTO LOCAL STORAGE--------------------------------------------//
  static Future<void> fetchSemSubjectName() async{
    //
    // int yearName = me!.batch!;
    // int semesterName = me!.semester!;
    // String branchName = me!.branch!;
    // String keyName = "${yearName}";
    //
    // final storage = new FlutterSecureStorage();
    // await firestore.collection('Data').doc(yearName.toString()).get().then((user) async {
    //   if (user.exists) {
    //
    //     semSubjectName = SemViseSubject.fromJson(user.data()!);
    //     var res = (SemViseSubject.fromJson(user.data()!)).toJson();
    //     await storage.write(key: keyName, value: jsonEncode(res));
    //     log("Thala For a Reason : ${res}");
    //   } else {
    //     log("NO Sem Subject Data FOUND {Failed to load SemSubjectName}");
    //   }
    // });
  }



// //-----------------------------Fetch All Semister wise subjects-----------------------------------//
//   static Stream<QuerySnapshot<Map<String, dynamic>>> semViseSubjects() {
//     try {
//       int year = me!.batch!;
//       final stream = APIs.firestore.collection('Data')
//           .where('yearName', isEqualTo: year.toString())
//           .snapshots();
//       stream.listen((snapshot) {
//         for (var doc in snapshot.docs) {
//           log("Document data: ${jsonEncode(doc.data())}");
//         }
//       });
//       return stream;
//     } catch (e) {
//       log("Error getting document stream: $e");
//       // Return an empty stream in case of an error
//       return const Stream.empty();
//     }
//   }

//-----------------------------Fetch the user data-------------------------------------------------//
  static Future<void> updateCollegeDetails(int batch , String branch , int semester) async{

    // try{
    //   await firestore.collection("user").doc(user_uid).update({
    //     "batch" : batch,
    //     "branch" : branch,
    //     "college" : "IIIT Allahabad",
    //     "semester" : semester,
    //   });
    //
    //   log("College Details Updated");
    // }catch(e){
    //   log("Error in updating college details: ${e}");
    // }
  }

}