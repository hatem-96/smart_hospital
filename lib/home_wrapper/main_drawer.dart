import 'package:flutter/material.dart';
import 'package:smart_hospital/shaded/drawer_button.dart';
import 'package:smart_hospital/screens/hospital_system.dart';
import 'package:smart_hospital/screens/person.dart';
import 'package:smart_hospital/screens/devices.dart';
import 'package:smart_hospital/screens/regular_maintenance.dart';
import 'package:smart_hospital/home_wrapper/home.dart';

class MainDrawer extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: DrawerButton(
                  text: 'Home Page',
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Home()
                    ),);
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawerButton(
                  text: 'user info',
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Personality()
                    ),);
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(

                child: DrawerButton(
                  text: 'Hospital system',
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>HospitalSystem()
                    ),);
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawerButton(
                  text: 'Hospital Devices',
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>HospitalDevices()
                    ),);
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawerButton(
                  text: 'Maintenance',
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>RegularMaintenance()
                    ),);
                  },
                ),
              ),
            ),
        //    Container(
//              width: double.infinity,
//              padding: EdgeInsets.all(20.0),
//              color: Colors.lightBlue,
//              child: Center(
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      width: 100.0,
//                      height: 100.0,
//                      decoration: BoxDecoration(
//                        shape: BoxShape.circle,
//                        image: DecorationImage(
//                          image: NetworkImage('https://scontent-hbe1-1.xx.fbcdn.net/v/t1.0-9/104559488_1638899569608834_732905095247415604_o.jpg?_nc_cat=100&_nc_sid=09cbfe&_nc_ohc=e0VeYlh3nnAAX9SgXGS&_nc_ht=scontent-hbe1-1.xx&oh=5e09643f5d5f13f4bb3a7b2298927a7d&oe=5F191208'),
//                              fit: BoxFit.fill,
//                        ),
//                      ),
//                    ),
//
//                  ],
//                ),
//              ),
//            ),
//            SizedBox(height: 2.0,),

//            Expanded(
//              child: Container(
//                child: DrawerButton(
//                  text: 'uer info',
//                  onPress: () {
//                    Navigator.push(context, MaterialPageRoute(builder:(context)=>HospitalSystem()
//                    ),);
//                  },
//                ),
//              ),
//            ),
//            Expanded(
//              child: Container(
//                child: DrawerButton(
//                  text: 'uer info',
//                  onPress: () {
//                    Navigator.push(context, MaterialPageRoute(builder:(context)=>HospitalSystem()
//                    ),);
//                  },
//                ),
//              ),
//            ),
        ],
      ),
    ),

   );


  }
}
