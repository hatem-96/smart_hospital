import 'package:flutter/material.dart';
import 'package:smart_hospital/models/hospital.dart';
class HospitalTile extends StatelessWidget {
  final Hospital hospital;
  HospitalTile({this.hospital});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0 ,20.0, 0.0),
        child: ListTile(),

      ),
    );
  }
}
