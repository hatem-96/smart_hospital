import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_hospital/services/auth.dart';
import 'package:smart_hospital/services/database.dart';
import 'package:provider/provider.dart';
import 'package:smart_hospital/models/hospital.dart';
import 'package:smart_hospital/home_wrapper/main_drawer.dart';
import 'package:smart_hospital/authenticate/sign_in.dart';
import 'package:smart_hospital/shaded/loading.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smart_hospital/screens/system_info.dart';
import 'dart:convert';




class HospitalSystem extends StatelessWidget {
final dataBaseReference =FirebaseDatabase.instance.reference();
final temp=FirebaseDatabase.instance.reference();

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Hospital>>.value(
      value: DatabaseService().hospital,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Hospital System',
          ),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Log Out'),
            ),
          ],
        ),
        drawer: MainDrawer(),

        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                 // height: 100.0,
                  child: RaisedButton(child: Text('Write Data',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),color: Colors.lightBlue,
                      onPressed: (){
                    writeData();
                      }
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  //height: 100.0,
                  child: RaisedButton(child: Text('Read Data ',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),color: Colors.lightBlue,
                      onPressed: (){
                        getData();
                      }
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                //  height: 100.0,
                  child: RaisedButton(child: Text('Show Value  ',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),color: Colors.lightBlue,
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SystemInfo()),
                        );
                      }
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                //  height: 100.0,
                  child: RaisedButton(child: Text('Update Data ',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),color: Colors.lightBlue,
                      onPressed: (){
                        updateData();
                      }
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(

                  child: RaisedButton(child: Text('Delete Data ',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),color: Colors.lightBlue,
                      onPressed: (){
                        deleteData();
                      }
                  ),
                ),
              ),
             

            ],
          ),
        ),
      ),
    );
  }
void writeData ()
{
  dataBaseReference.child('hospital').set({
     'humidity':'',
    'temp':''
  });
}

void getData (){
    dataBaseReference.once().then((DataSnapshot dataSnapshot){
 var  data= dataSnapshot.value;
 print (data) ;});
}
void updateData(){
  dataBaseReference.child('hospital').update({
    'humidity':'',
    'temp':''
  });
}


void deleteData(){
    dataBaseReference.child('hospital').remove();

}

}



