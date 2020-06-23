import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hospital/models/hospital.dart';
import 'package:smart_hospital/home_wrapper/hospital_tile.dart';
class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  @override
  Widget build(BuildContext context) {
    //access the data from the stream
    final hospital = Provider.of<List<Hospital>>(context);
//    hospital.forEach((hospital){
//print (hospital.name);
//print (hospital.jobe);
//print (hospital.age);
//print (hospital.phone);
//    });
    return ListView.builder(
      itemCount: hospital.length,
      itemBuilder: (context,index){
        return HospitalTile(hospital:hospital[index]);
      },
    );
  }
}
