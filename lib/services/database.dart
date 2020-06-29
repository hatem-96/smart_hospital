import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_hospital/models/hospital.dart';
import 'package:smart_hospital/models/user.dart';

class DatabaseService{
final String uid;
DatabaseService({this.uid});

  //collection reference to use in every time we need to use database
  final CollectionReference hospitalCollection= Firestore.instance.collection('hospital');
  Future updateUserData (String name ,String jobe ,int age ,String phone)async{
    return await hospitalCollection.document(uid).setData({
      'name':name,
      'jobe':jobe,
      'age':age,
     'phone': phone,
    });
  }
  // create a list from snapshot
List <Hospital>_hospitalListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Hospital(
        name: doc.data['name']??'',
        jobe: doc.data['jobe']??'',
        age: doc.data['age']??0,
        phone: doc.data['phone']??'',
      );
    }).toList();
}
  //get brew streams from every changes happens in the firebase
Stream <List<Hospital>> get hospital{
    return hospitalCollection.snapshots().map(_hospitalListFromSnapshot);
}
//get user data from snapshot
  UserData _userDataFromSnapShots (DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      jobe: snapshot.data['jobe'],
      phone: snapshot.data['00000000000'],
      age: snapshot.data[20]
    );
  }
//get user document stream
Stream<UserData>get userData{
    return hospitalCollection.document(uid).snapshots().map(_userDataFromSnapShots);
}
}