import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hospital/models/hospital.dart';
import 'package:smart_hospital/home_wrapper/hospital_tile.dart';
class InformationSystemList extends StatefulWidget {
  @override
  _InformationSystemListState createState() => _InformationSystemListState();
}

class _InformationSystemListState extends State<InformationSystemList> {
  @override
  Widget build(BuildContext context) {
    //access the data from the stream
    final hospital = Provider.of<List<Hospital>>(context);
    return ListView.builder(
      itemCount: hospital.length,
      itemBuilder: (context,index){
        return HospitalTile(hospital:hospital[index]);
      },
    );
  }
}
