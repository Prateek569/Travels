import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future<void> updateUserData( String name,  String dataval, String title) async {

    return await brewCollection.document(uid).updateData({
      'name': name,
      'title': FieldValue.arrayUnion([title]),
      'description': FieldValue.arrayUnion([dataval]),
    });
  }

  Future<void> deleteUserData(String dataval, String title) async {

    return await brewCollection.document(uid).updateData({
      'title': FieldValue.arrayRemove([title]),
      'description': FieldValue.arrayRemove([dataval]),
    });
  }

  Future<void> setUserData( String name) async {

    return await brewCollection.document(uid).setData({
      'name': name,
      'title':  FieldValue.arrayUnion(['start']),
      'description': FieldValue.arrayUnion(['start']),
    });
  }




  // user data from snapshot
  UserData  _userdatafromsnapshot(DocumentSnapshot snapshot){
    //return user data object
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      title: snapshot.data['title'],
      description: snapshot.data['description'],
    );
  }



  // get user document stream

  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots()
    // take a document snapshot and turn to UserData object
    .map(_userdatafromsnapshot);
  }

}